﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace SmartLogisticsDeliveryProxySystem_Search
{
    public partial class DivideStoreDetail : System.Web.UI.Page
    {
        SqlConnection WMScon;
        private const string WMS_SERVER = "Server=121.189.24.227,6024;Database=SDPS;UID=sa;Pwd=#@tmakxmanffb0911";
        DataTable oDT;
        public string s입고일자 = string.Empty;
        public string s슈트번호 = string.Empty;
        public string s구분 = string.Empty;

        int i입고 = 0;
        int i출고 = 0;
        int i미출 = 0;

        int qtyTotal = 0;
        int inqtyTotal = 0;
        int outqtyTotal = 0;
        int storid = 0;
        int rowIndex = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            s입고일자 = Request.QueryString["입고일자"];
            s슈트번호 = Request.QueryString["슈트번호"];
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
                + " EXEC usp_웹_배송의뢰서마스터_슈트별_Detail_Get '{0}', '{1}' ",
                s입고일자,
                s슈트번호);

            WMScon = new SqlConnection(WMS_SERVER);
            WMScon.Open();

            oDT = new DataTable("usp_웹_배송의뢰서마스터_슈트별_Detail_Get");

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
                i미출 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "미출고"));

                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "구분상세").ToString());
                int tempTotal1 = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "입고").ToString());
                int tempTotal2 = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "출고").ToString());
                int tempTotal = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "미출고").ToString());
                qtyTotal += tempTotal;
                inqtyTotal += tempTotal1;
                outqtyTotal += tempTotal2;
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = "합  계";
                e.Row.Cells[4].Text = i입고.ToString("N0");
                e.Row.Cells[5].Text = i출고.ToString("N0");
                e.Row.Cells[6].Text = i미출.ToString("N0");
            }

            this.lblIn.Text = string.Format("{0:#,##0}", i입고);
            this.lblOut.Text = string.Format("{0:#,##0}", i출고);
            this.lblNotShip.Text = string.Format("{0:#,##0}", i미출);
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            bool newRow = false;

            if ((storid > 0) && (DataBinder.Eval(e.Row.DataItem, "구분상세") != null))
            {
                if (storid != Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "구분상세").ToString()))
                    newRow = true;
            }

            if ((storid > 0) && (DataBinder.Eval(e.Row.DataItem, "구분상세") == null))
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
                HeaderCell.ColumnSpan = 3;
                NewTotalRow.Cells.Add(HeaderCell);
                HeaderCell = new TableCell();
                HeaderCell.HorizontalAlign = HorizontalAlign.Center;
                HeaderCell.Text = inqtyTotal.ToString();
                NewTotalRow.Cells.Add(HeaderCell);
                HeaderCell = new TableCell();
                HeaderCell.HorizontalAlign = HorizontalAlign.Center;
                HeaderCell.Text = outqtyTotal.ToString();
                NewTotalRow.Cells.Add(HeaderCell);
                HeaderCell = new TableCell();
                HeaderCell.HorizontalAlign = HorizontalAlign.Center;
                HeaderCell.Text = qtyTotal.ToString();
                NewTotalRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, NewTotalRow);
                rowIndex++;
                qtyTotal = 0;
                inqtyTotal = 0;
                outqtyTotal = 0;
            }
        }
    }
}