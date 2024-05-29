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
    public partial class StoreListSub : System.Web.UI.Page
    {
        SqlConnection WMScon;
        private const string WMS_SERVER = "Server=121.189.24.227,6024;Database=SDPS;UID=sa;Pwd=#@tmakxmanffb0911";
        DataTable oDT;
        public string s상세 = string.Empty;
        public string s입고일자 = string.Empty;
        public string s매장명 = string.Empty;

        int 집하수량 = 0;
        //int 입고수량 = 0;
        int 출고수량 = 0;
        int 미출고수량 = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            s상세 = Request.QueryString["상세"];
            s입고일자 = Request.QueryString["입고일자"];
            s매장명 = Request.QueryString["매장명"];

            this.lblStoreName.Text = s매장명;
            this.lblInDate.Text = s입고일자.Substring(0, 4) + "-" + s입고일자.Substring(4, 2) + "-" + s입고일자.Substring(6, 2);

            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            string sQuery = string.Format(""
                + " EXEC usp_웹_배송의뢰서마스터_매장별_상세1_Get '{0}', '{1}' ",
                s입고일자,
                s상세);

            WMScon = new SqlConnection(WMS_SERVER);
            WMScon.Open();

            oDT = new DataTable("usp_웹_배송의뢰서마스터_매장별_상세1_Get");

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
                집하수량 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "집하수량"));
                //입고수량 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "입고수량"));
                출고수량 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "출고수량"));
                미출고수량 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "미출고수량"));
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = 집하수량.ToString("N0");
                //e.Row.Cells[4].Text = 입고수량.ToString("N0");
                e.Row.Cells[4].Text = 출고수량.ToString("N0");
                e.Row.Cells[5].Text = 미출고수량.ToString("N0");
            }

            this.lblCenter.Text = 집하수량.ToString("N0");
            //this.lblIn.Text = 입고수량.ToString("N0");
            this.lblOut.Text = 출고수량.ToString("N0");
            this.lblNotShip.Text = 미출고수량.ToString("N0");
        }
    }
}