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
    public partial class DivideNotShippedStoreList : System.Web.UI.Page
    {
        SqlConnection WMScon;
        private const string WMS_SERVER = "Server=121.189.24.227,6024;Database=SDPS;UID=sa;Pwd=#@tmakxmanffb0911";
        DataTable oDT;
        public string s입고일자 = string.Empty;
        public string s슈트번호 = string.Empty;
        public string s매장명 = string.Empty;
        public string s상세 = string.Empty;

        int 입고수량 = 0;
        int 출고수량 = 0;
        int 미출고수량 = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            s입고일자 = Request.QueryString["입고일자"];
            s슈트번호 = Request.QueryString["슈트번호"];
            s매장명 = Request.QueryString["매장명"];
            s상세 = Request.QueryString["상세"];

            lblGubunName.Text = s매장명 + " : 미출고리스트";
            lblInDate.Text = s입고일자.Substring(0, 4) + "-" + s입고일자.Substring(4, 2) + "-" + s입고일자.Substring(6, 2);

            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            string sQuery = string.Format(""
                + " EXEC usp_웹_배송의뢰서마스터_슈트별_매장별_미출고_리스트_Get '{0}', '{1}', '{2}' ",
                s입고일자,
                s슈트번호,
                s상세);

            WMScon = new SqlConnection(WMS_SERVER);
            WMScon.Open();

            oDT = new DataTable("usp_웹_배송의뢰서마스터_슈트별_미출고_리스트_Get");

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
                입고수량 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "입고수량"));
                출고수량 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "출고수량"));
                미출고수량 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "미출고수량"));
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[1].Text = "합  계";
                e.Row.Cells[4].Text = 입고수량.ToString("N0");
                e.Row.Cells[5].Text = 출고수량.ToString("N0");
                e.Row.Cells[6].Text = 미출고수량.ToString("N0");
            }

            lblIn.Text = string.Format("{0:#,##0}", 입고수량);
            lblOut.Text = string.Format("{0:#,##0}", 출고수량);
            lblNotShip.Text = string.Format("{0:#,##0}", 미출고수량);
        }
    }
}