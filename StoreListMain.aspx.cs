using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartLogisticsDeliveryProxySystem_Search
{
    public partial class StoreListMain : System.Web.UI.Page
    {
        int i집하 = 0;
        //int i입고 = 0;
        int i출고 = 0;
        int i미출 = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string sDate = DateTime.Now.ToString("HH:mm:ss");
            string shour = sDate.Substring(0, 2);

            if (!IsPostBack)
            {
                if (15 <= int.Parse(shour) && int.Parse(shour) < 24)
                {
                    txtInDate.Text = DateTime.Now.ToString("yyyyMMdd");
                }
                else
                {
                    txtInDate.Text = DateTime.Now.AddDays(-1).ToString("yyyyMMdd");
                }

                Data_Reload();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Data_Reload();
        }

        private void Data_Reload()
        {
            SqlDataSource1.SelectParameters["입고일자"].DefaultValue = txtInDate.Text;
            gdView.DataBind();
        }

        protected void gdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                i집하 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "집하"));
                //i입고 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "입고"));
                i출고 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "출고"));
                i미출 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "미출고"));
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = "합          계";
                e.Row.Cells[4].Text = i집하.ToString("N0");
                //e.Row.Cells[5].Text = i입고.ToString("N0");
                e.Row.Cells[6].Text = i출고.ToString("N0");
                e.Row.Cells[7].Text = i미출.ToString("N0");
            }

            lblCenter.Text = i집하.ToString("N0");
            //lblIn.Text = i입고.ToString("N0");
            lblOut.Text = i출고.ToString("N0");
            lblNotShip.Text = i미출.ToString("N0");
        }
    }
}