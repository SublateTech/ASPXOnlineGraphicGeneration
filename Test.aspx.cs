using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Signature.Classes;
using Signature.Web.Controls;


namespace Signature.Web
{
    public partial class Test : System.Web.UI.Page
    {

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
       /*
            
            Rep oRep = new Rep("GA8");
            if (oRep.Find("306"))
            {
                oViewer.DisplayGroupTree = false;
                oViewer.DisplayPage = false;
                oRep.PrintGACommissionReport(oViewer);
            }
            */

    
            base.OnLoad(e);
            string theTime = DateTime.Now.ToLongTimeString();
            for (int i = 0; i < 3; i++) {
                theTime += "<br />" + theTime;
                    }
            time1.Text = theTime;
            time2.Text = theTime;
        }


    }
}
