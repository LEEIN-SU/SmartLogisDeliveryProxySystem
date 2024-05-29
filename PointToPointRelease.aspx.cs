using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartLogisticsDeliveryProxySystem_Search
{
    public partial class PointToPointRelease : System.Web.UI.Page
    {
        int 입고수량 = 0;
        int 출고수량 = 0;
        int 미출고수량 = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string sDate = DateTime.Now.ToString("HH:mm:ss");
            string shour = sDate.Substring(0, 2);

            if (!IsPostBack)
            {
                if (15 <= int.Parse(shour) && int.Parse(shour) < 24)
                {
                    txtOutDate.Text = DateTime.Now.AddDays(1).ToString("yyyyMMdd");
                }
                else
                {
                    txtOutDate.Text = DateTime.Now.ToString("yyyyMMdd");
                }

                if(12 <= int.Parse(shour) && int.Parse(shour) < 24)
                {
                    txtInDate.Text = DateTime.Now.ToString("yyyyMMdd");
                }
                else
                {
                    txtInDate.Text = DateTime.Now.AddDays(-1).ToString("yyyyMMdd");
                }
                date_Reload();
            }
        }

        private void date_Reload()
        {
            SqlDataSource1.SelectParameters["입고일자"].DefaultValue = txtInDate.Text.ToString();
            SqlDataSource1.SelectParameters["출고일자"].DefaultValue = txtOutDate.Text.ToString();

            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                입고수량 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "입고"));
                출고수량 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "출고"));
                미출고수량 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "미출고"));
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "합  계";
                e.Row.Cells[3].Text = 입고수량.ToString("N0");
                e.Row.Cells[4].Text = 출고수량.ToString("N0");
                e.Row.Cells[5].Text = 미출고수량.ToString("N0");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            date_Reload();
        }
    }
}