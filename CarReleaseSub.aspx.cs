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
    public partial class CarReleaseSub : System.Web.UI.Page
    {
        SqlConnection WMScon;
        private const string WMS_SERVER = "Server=121.189.24.227,6024;Database=SDPS;UID=sa;Pwd=#@tmakxmanffb0911";
        DataTable oDT;
        public string s출고일자 = string.Empty;
        public string s출고차량 = string.Empty;
        int 출고수량 = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            s출고일자 = Request.QueryString["출고일자"];
            s출고차량 = Request.QueryString["출고차량"];

            this.lblCarNo.Text = s출고차량;
            this.lblOutDate.Text = s출고일자.Substring(0, 4) + "-" + s출고일자.Substring(4, 2) + "-" + s출고일자.Substring(6, 2);

            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            string sQuery = string.Format(""
                + " EXEC usp_웹_배송의뢰서마스터_차량출고_Sub_Get '{0}', '{1}' ",
                s출고일자,
                s출고차량);

            WMScon = new SqlConnection(WMS_SERVER);
            WMScon.Open();

            oDT = new DataTable("usp_웹_배송의뢰서마스터_차량출고_Sub_Get");

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
                출고수량 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "출고수량"));
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = 출고수량.ToString("N0");
            }
        }
    }
}