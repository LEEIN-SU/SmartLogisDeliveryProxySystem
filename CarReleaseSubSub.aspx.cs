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
    public partial class CarReleaseSubSub : System.Web.UI.Page
    {
        SqlConnection WMScon;
        private const string WMS_SERVER = "Server=121.189.24.227,6024;Database=SDPS;UID=sa;Pwd=#@tmakxmanffb0911";
        DataTable oDT;
        public string s출고일자 = string.Empty;
        public string s출고차량 = string.Empty;

        int i합계 = 0;
        int qtyTotal = 0;
        int storid = 0;
        int rowIndex = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            s출고일자 = Request.QueryString["출고일자"];
            s출고차량 = Request.QueryString["출고차량"];

            lblCarNo.Text = s출고차량;
            lblOutDate.Text = s출고일자.Substring(0, 4) + "-" + s출고일자.Substring(4, 2) + "-" + s출고일자.Substring(6, 2);

            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            string sQuery = string.Format(""
                + " EXEC usp_운송장_출고_기사별1_Get '{0}', '{1}' ",
                s출고일자,
                s출고차량);

            WMScon = new SqlConnection(WMS_SERVER);
            WMScon.Open();

            oDT = new DataTable("usp_운송장_출고_기사별_Get");

            SqlDataAdapter dgSrc = new SqlDataAdapter(sQuery, WMScon);
            oDT = new DataTable();
            dgSrc.Fill(oDT);
            GridView1.DataSource = oDT;
            GridView1.DataBind();
            WMScon.Close();
            WMScon = null;
        }


        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            bool newRow = false;
            if ((storid > 0) && (DataBinder.Eval(e.Row.DataItem, "상세") != null))
            {
                if (storid != Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "상세").ToString()))
                    newRow = true;
            }
            if ((storid > 0) && (DataBinder.Eval(e.Row.DataItem, "상세") == null))
            {
                newRow = true;
                rowIndex = 0;
            }
            if (newRow)
            {
                GridView GridView1 = (GridView)sender;
                GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
                NewTotalRow.Font.Bold = true;
                NewTotalRow.BackColor = System.Drawing.Color.Gray;
                NewTotalRow.ForeColor = System.Drawing.Color.White;
                TableCell HeaderCell = new TableCell();
                HeaderCell.Text = "소   계";
                HeaderCell.HorizontalAlign = HorizontalAlign.Center;
                HeaderCell.ColumnSpan = 4;
                NewTotalRow.Cells.Add(HeaderCell);
                HeaderCell = new TableCell();
                HeaderCell.HorizontalAlign = HorizontalAlign.Center;
                HeaderCell.Text = qtyTotal.ToString();
                NewTotalRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, NewTotalRow);
                rowIndex++;
                qtyTotal = 0;
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                i합계 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "합계"));

                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "상세").ToString());
                int tempTotal = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "합계").ToString());
                qtyTotal += tempTotal;
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[5].Text = i합계.ToString("N0");
            }
        }
    }
}