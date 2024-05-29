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
    public partial class BrandListNotShipped : System.Web.UI.Page
    {
        SqlConnection WMScon;
        private const string WMS_SERVER = "Server=121.189.24.227,6024;Database=SDPS;UID=sa;Pwd=#@tmakxmanffb0911";
        DataTable oDT;
        public string s물류코드 = string.Empty;
        public string s물류명 = string.Empty;
        public string s입고일자 = string.Empty;

        int i입고 = 0;
        int i출고 = 0;
        int i미출 = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            s물류코드 = Request.QueryString["물류코드"];
            s물류명 = Request.QueryString["물류명"];
            s입고일자 = Request.QueryString["입고일"];

            this.lblInDate.Text = s입고일자.Substring(0, 4) + "-" + s입고일자.Substring(4, 2) + "-" + s입고일자.Substring(6, 2);
            this.lblLogisName.Text = s물류코드 + ":" + s물류명;

            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            string sQuery = string.Format(""
                + " EXEC usp_웹_배송의뢰서마스터_일자별_미출_상세_Get '{0}', '{1}' ",
                s입고일자,
                s물류코드);

            WMScon = new SqlConnection(WMS_SERVER);
            WMScon.Open();

            oDT = new DataTable("usp_웹_배송의뢰서마스터_일자별_미출_상세_Get");

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
                i입고 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "입고"));
                i출고 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "출고"));
                i미출 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "미출"));
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[6].Text = "합          계";
                e.Row.Cells[7].Text = i입고.ToString("N0");
                e.Row.Cells[8].Text = i출고.ToString("N0");
                e.Row.Cells[9].Text = i미출.ToString("N0");
            }

            lblIn.Text = i입고.ToString("N0");
            lblOut.Text = i출고.ToString("N0");
            lblNotShip.Text = i미출.ToString("N0");
        }
    }
}