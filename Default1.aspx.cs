using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Signature.Web.Controls;
using Signature.Web;


namespace Signature.Web
{
	/// <summary>
	/// Summary description for AdvancedPageInheritance.
	/// </summary>
	public class Default : PageBase
	{
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
            
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);

            /*
            Order oOrder = new Order("F08");
            oOrder.Find(595517);
            oOrder.OpenPrinter(1);
            oOrder.Print();
            oOrder.ClosePrinter();
             */
            /*
            Customer oCustomer = new Customer("F08");
            if (oCustomer.Find("00014"))
                oCustomer.Print();
            */

            
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);
		}
        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);

            /*
            CrystalDecisions.Web.CrystalReportViewer oViewer = new CrystalDecisions.Web.CrystalReportViewer();

            Rep oRep = new Rep("F08");
            if (oRep.Find("306"))
                oRep.PrintGACommissionReport(oViewer);
            
            oViewer.DisplayGroupTree = true;
            oViewer.DisplayPage = true;
            oViewer.DisplayToolbar = true;
            
           // oViewer.RenderBeginTag(writer);
            oViewer.RenderControl(writer);
          //  oViewer.RenderEndTag(writer);

            //this.Page.Controls.Add(oViewer);
            */
        }

		#endregion
	}
}
