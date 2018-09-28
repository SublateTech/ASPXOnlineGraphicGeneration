using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Signature.Web.Controls;
using Signature.Data;
using Signature.Classes;


namespace Signature.Web
{
    public partial class Main : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected override void OnInit(EventArgs e)
        {
           // LiteralControl include = new LiteralControl("ssssssssssssssssssssss");
           // this.Box1.Controls.Add(include);
            this.MenuType = TopMenu.MenuType.CampaigneMenu;
            base.OnInit(e);
        }

        protected void butLogIn_Click(object sender, EventArgs e)
        {
            Customer oCustomer = new Customer(Season.Items[Season.SelectedIndex].Value);
            if (oCustomer.FindByChairperson(Name.Text, Password.Text))
            {
                Session["Customer"] = oCustomer;
                Response.Redirect("main_orders2.aspx");
            }
        }

    }
}
