using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace SmartLogisticsDeliveryProxySystem_Search
{
    public partial class BrandListWaybillList : System.Web.UI.Page
    {
        SqlConnection WMScon;
        private const string WMS_SERVER = "Server=121.189.24.227,6024;Database=SDPS;UID=sa;Pwd=#@tmakxmanffb0911";
        DataTable oDT;

        public string s물류코드 = string.Empty;
        public string s매장코드 = string.Empty;
        public string s매장명 = string.Empty;
        public string s입고일자 = string.Empty;
        public string s물류명 = string.Empty;
        int i상품 = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            s물류코드 = Request.QueryString["물류코드"];
            s매장코드 = Request.QueryString["매장코드"];
            s매장명 = Request.QueryString["브랜드매장명"];
            s입고일자 = Request.QueryString["입고일"];
            s물류명 = Request.QueryString["물류명"];

            this.lblInDate.Text = s입고일자.Substring(0, 4) + "-" + s입고일자.Substring(4, 2) + "-" + s입고일자.Substring(6, 2);
            this.lblLogisName.Text = s물류코드 + ":" + s물류명;
            this.lblStoreName.Text = s매장명;

            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            string sQuery = string.Format(""
                + " EXEC usp_웹_배송의뢰서마스터_일자별_상세_운송장_Get '{0}', '{1}', '{2}' ",
                s물류코드,
                s매장코드,
                s입고일자);

            WMScon = new SqlConnection(WMS_SERVER);
            WMScon.Open();

            oDT = new DataTable("usp_웹_배송의뢰서마스터_일자별_상세_운송장_Get");

            SqlDataAdapter dgSrc = new SqlDataAdapter(sQuery, WMScon);
            oDT = new DataTable();
            dgSrc.Fill(oDT);
            GridView1.DataSource = oDT;
            GridView1.DataBind();
            WMScon.Close();
            WMScon = null;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                i상품 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "합계"));
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = i상품.ToString("N0");
            }
        }
    }
}