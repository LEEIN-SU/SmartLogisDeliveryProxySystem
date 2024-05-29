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
    public partial class CarTimeOutStoreOrderBy : System.Web.UI.Page
    {
        SqlConnection WMScon;
        private const string WMS_SERVER = "Server=121.189.24.227,6024;Database=SDPS;UID=sa;Pwd=#@tmakxmanffb0911";
        DataTable oDT;

        int 수량 = 0;
        int qtyTotal = 0;

        public string s출고일자 = string.Empty;
        public string s출고차량 = string.Empty;
        public string s차수 = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            s출고일자 = Request.QueryString["출고일자"];
            s출고차량 = Request.QueryString["차량번호"];
            s차수 = Request.QueryString["차수"];

            this.lblCarNumber.Text = s출고차량;
            this.lblOutDate.Text = s출고일자.Substring(0, 4) + "-" + s출고일자.Substring(4, 2) + "-" + s출고일자.Substring(6, 2);
            this.lblCarChaSu.Text = s차수;

            if (!IsPostBack)
            {
                date_Reload();
            }
        }

        private void date_Reload()
        {
            string sQuery = string.Format(""
                + " EXEC usp_웹_배송의뢰서마스터_시간대별_차량출고_배송매장_차량차수별_Get '{0}', '{1}' ",
                s출고일자,
                s출고차량 + s차수);

            WMScon = new SqlConnection(WMS_SERVER);
            WMScon.Open();

            oDT = new DataTable("usp_웹_배송의뢰서마스터_시간대별_차량출고_메인_Get");

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
                수량 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "수량"));

                int tempTotal = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "수량").ToString());

                qtyTotal += tempTotal;

            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[6].Text = "합  계";
                e.Row.Cells[9].Text = string.Format("{0:#,##0}", 수량);
            }
        }
    }
}