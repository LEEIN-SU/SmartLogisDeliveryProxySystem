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
    public partial class StoreBuildingDetail : System.Web.UI.Page
    {
        SqlConnection WMScon;
        private const string WMS_SERVER = "Server=121.189.24.227,6024;Database=SDPS;UID=sa;Pwd=#@tmakxmanffb0911";
        DataTable oDT;
        public string s입고일자 = string.Empty;
        public string s건물구분 = string.Empty;
        public string s구분 = string.Empty;

        int i집하 = 0;
        int i입고 = 0;
        int i출고 = 0;
        int i미출 = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            s입고일자 = Request.QueryString["입고일자"];
            s건물구분 = Request.QueryString["건물구분"];
            s구분 = Request.QueryString["구분"];

            this.lblGubunName.Text = s구분;
            this.lblInDate.Text = s입고일자.Substring(0, 4) + "-" + s입고일자.Substring(4, 2) + "-" + s입고일자.Substring(6, 2);

            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            string sQuery = string.Format(""
                + " EXEC usp_웹_배송의뢰서마스터_집합건물별_Detail1_Get '{0}', '{1}' ",
                s입고일자,
                s건물구분);

            WMScon = new SqlConnection(WMS_SERVER);
            WMScon.Open();

            oDT = new DataTable("usp_웹_배송의뢰서마스터_집합건물별_Detail1_Get");

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
                i집하 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "집하"));
                i입고 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "입고"));
                i출고 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "출고"));
                i미출 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "미출고"));
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "합  계";
                e.Row.Cells[3].Text = i집하.ToString("N0");
                e.Row.Cells[4].Text = i입고.ToString("N0");
                e.Row.Cells[5].Text = i출고.ToString("N0");
                e.Row.Cells[6].Text = i미출.ToString("N0");
            }

            this.lblCenter.Text = string.Format("{0:#,##0}", i집하);
            this.lblIn.Text = string.Format("{0:#,##0}", i입고); 
            this.lblOut.Text = string.Format("{0:#,##0}", i출고);
            this.lblNotShip.Text = string.Format("{0:#,##0}", i미출); 
        }
    }
}