using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClosedXML.Excel;
using System.Data.SqlClient;
using DocumentFormat.OpenXml.Bibliography;

namespace SmartLogisticsDeliveryProxySystem_Search
{
    public partial class CarTimeIn : System.Web.UI.Page
    {
        SqlConnection WMScon;
        private const string WMS_SERVER = "Server=121.189.24.227,6024;Database=SDPS;UID=sa;Pwd=#@tmakxmanffb0911";
        DataTable oDT;

        int 수량 = 0;
        int qtyTotal = 0;
        int bigTotal = 0;
        int storid = 0;
        int rowIndex = 1;
        int CarCount = 0;
        int CarTotal = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string sDate = DateTime.Now.ToString("HH:mm:ss");
            string shour = sDate.Substring(0, 2);

            if (!IsPostBack)
            {
                if (15 <= int.Parse(shour) && int.Parse(shour) < 24)
                {
                    txtOutDate.Text = DateTime.Now.ToString("yyyyMMdd"); 
                }
                else
                {
                    txtOutDate.Text = DateTime.Now.AddDays(-1).ToString("yyyyMMdd");
                }

                date_Reload();
            }
        }

        private void date_Reload()
        {
            //SqlDataSource1.SelectParameters["출고일자"].DefaultValue = txtOutDate.Text.ToString();

            //GridView1.DataBind();
            string sQuery = string.Format(""
                + " EXEC usp_웹_배송의뢰서마스터_시간대별_차량입고_메인_Get '{0}' ",
                txtOutDate.Text);

            WMScon = new SqlConnection(WMS_SERVER);
            WMScon.Open();

            oDT = new DataTable("usp_웹_배송의뢰서마스터_시간대별_차량입고_메인_Get");

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

                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "소계").ToString());
                int tempTotal = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "수량").ToString());
                int CarCt = 1;

                qtyTotal += tempTotal;
                bigTotal += tempTotal;

                CarCount += CarCt;
                CarTotal += CarCt;
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[6].Text = "합  계";
                e.Row.Cells[7].Text = string.Format("{0:#,##0}", CarTotal);
                e.Row.Cells[8].Text = string.Format("{0:#,##0}", 수량);
            }

            lblCarRoate.Text = string.Format("{0:#,##0}", CarTotal) + "대";
            lblOut.Text = string.Format("{0:#,##0}", 수량) + "Box";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            date_Reload();
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            bool newRow = false;

            if ((storid > 0) && (DataBinder.Eval(e.Row.DataItem, "소계") != null))
            {
                if (storid != int.Parse(DataBinder.Eval(e.Row.DataItem, "소계").ToString()))
                {
                    newRow = true;
                }
            }

            if ((storid > 0) && (DataBinder.Eval(e.Row.DataItem, "시") == null))
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
                HeaderCell.Text = string.Format("{0:#,##0}", CarCount);
                NewTotalRow.Cells.Add(HeaderCell);
                HeaderCell = new TableCell();
                HeaderCell.HorizontalAlign = HorizontalAlign.Center;
                HeaderCell.Text = string.Format("{0:#,##0}", CarTotal);
                NewTotalRow.Cells.Add(HeaderCell);
                HeaderCell = new TableCell();
                HeaderCell.HorizontalAlign = HorizontalAlign.Center;
                HeaderCell.Text = string.Format("{0:#,##0}", qtyTotal);
                NewTotalRow.Cells.Add(HeaderCell);
                HeaderCell = new TableCell();
                HeaderCell.HorizontalAlign = HorizontalAlign.Center;
                HeaderCell.Text = string.Format("{0:#,##0}", bigTotal);
                NewTotalRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, NewTotalRow);
                rowIndex++;
                qtyTotal = 0;
                CarCount = 0;
            }
        }

        protected void btnExcelPort_Click(object sender, EventArgs e)
        {
            string sQuery = string.Format(""
                + " EXEC usp_웹_배송의뢰서마스터_시간대별_차량입고_메인_Get '{0}' ",
                txtOutDate.Text);

            WMScon = new SqlConnection(WMS_SERVER);
            WMScon.Open();

            DataTable dt = new DataTable("usp_웹_배송의뢰서마스터_시간대별_차량입고_메인_Get");

            SqlDataAdapter dgSrc = new SqlDataAdapter(sQuery, WMScon);
            dt = new DataTable();
            dgSrc.Fill(dt);

            dt.Columns.RemoveAt(0);
            dt.Columns.RemoveAt(1);

            string sFileName = txtOutDate.Text + "_시간대별차량입고_" + DateTime.Now.ToString("yyyyMMdd");
            ExportToExcel(dt, sFileName);
        }

        private void ExportToExcel(DataTable dt, string fileName)
        {
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt, fileName);

                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename=" + fileName + ".xlsx");

                using (MemoryStream MyMemoryStream = new MemoryStream())
                {
                    wb.SaveAs(MyMemoryStream);
                    MyMemoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
        }
    }
}