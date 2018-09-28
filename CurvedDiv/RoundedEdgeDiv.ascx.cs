using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class RoundedEdgeDiv : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    /// <summary>
    /// Load the scripts from the WebResources
    /// </summary>
    private void RegisterScripts()
    {
        string csslink = null;
        LiteralControl include = null;

        // don't know a way to check if a header script already exists before I add it.
        // instead we'll use view state to make sure this method does not get run twice

        // add main javascript file required to round the corners to the header
        HtmlGenericControl script = new HtmlGenericControl("script");
        script.Attributes["type"] = "text/javascript";
        script.Attributes["src"] = Page.ClientScript.GetWebResourceUrl(this.GetType(), "CustomControls.Resources.nifty.js");
        this.Page.Header.Controls.Add(script);


        // add the css files to create the rounded corners
        csslink = "<link rel='stylesheet' type='text/css' href='" + Page.ClientScript.GetWebResourceUrl(this.GetType(), "CustomControls.Resources.niftyCorners.css") + "' />";
        include = new LiteralControl(csslink);
        this.Page.Header.Controls.Add(include);


        csslink = "<link rel='stylesheet' type='text/css' href='" + Page.ClientScript.GetWebResourceUrl(this.GetType(), "CustomControls.Resources.niftyPrint.css") + "' />";
        include = new LiteralControl(csslink);
        this.Page.Header.Controls.Add(include);


        // register the javascript code that specifies the format for these rounded corners
        // this script also specifies the colors for the corners
        if (!Page.ClientScript.IsClientScriptIncludeRegistered(Page.ClientScript.GetWebResourceUrl(this.GetType(), "CustomControls.Resources.layout.js")))
        {
            this.Page.ClientScript.RegisterClientScriptInclude(this.GetType(), "Layout", Page.ClientScript.GetWebResourceUrl(this.GetType(), "CustomControls.Resources.layout.js"));
        }


    }
}
