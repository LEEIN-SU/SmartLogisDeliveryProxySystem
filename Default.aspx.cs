using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartLogisticsDeliveryProxySystem_Search
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void lbnCarTimeOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("./CarTimeOut.aspx");
        }

        protected void lbtnBrandStockSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("./BrandListMain.aspx");
        }

        protected void lbtnStoreStockSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("./StoreListMain.aspx");
        }

        protected void lbnGroupStore_Click(object sender, EventArgs e)
        {
            Response.Redirect("./StoreBuildingGroup.aspx");
        }

        protected void lbnCarReleaseMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("./CarReleaseMain.aspx");
        }

        protected void lbnPointToPointNoReleaseSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("./PointToPointRelease.aspx");
        }

        protected void lbnPointToPointReleaseSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("./PointToPointNoRelease.aspx");
        }

        protected void lbnDivideStoreGroup_Click(object sender, EventArgs e)
        {
            Response.Redirect("./DivideStoreGroup.aspx");
        }

        protected void lbnCarTimeIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("./CarTimeIn.aspx");
        }

        protected void lbnCarCenterTimeIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("./CarTimeCenterIn.aspx");
        }
    }
}