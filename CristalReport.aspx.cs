using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using Signature.Web.Controls;


namespace Signature.Web
{
	/// <summary>
	/// Summary description for AdvancedPageInheritance.
	/// </summary>
	public partial class Report : PageBase
	{
        protected void Page_Load(object sender, EventArgs e)
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
            
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);
		}
		#endregion
	}
}
