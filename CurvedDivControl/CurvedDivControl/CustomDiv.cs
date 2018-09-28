using System;
using System.IO;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Drawing;

// Create By Mike Clark 3/2/2007
// I take no reponsibily if this code is used in another application


namespace CurvedDivControl
{
    /// <summary>
    /// A custom control to produced curved corners
    /// </summary>
    [DefaultProperty("CornersStyle"),
    ToolboxData("<{0}:CustomDiv runat=server></{0}:CustomDiv>"),
    ToolboxBitmap(@"C:\Documents and Settings\Mike\My Documents\Visual Studio 2005\Projects\CustomControls\CustomControls\images\CCContainer_icon.bmp")]
    public class CustomDiv : System.Web.UI.WebControls.Panel
    {
        public Dictionary<ECornersCurved, string> _dictCornerCallouts = new Dictionary<ECornersCurved, string>();
        /// <summary>
        /// Corners to be curved
        /// </summary>
        public enum ECornersCurved
        {
            All,
            BottomLeft,
            BottomRight,
            TopLeft,
            TopRight,
            BottomLeftTopRight,
            BottomRightTopLeft,
            Lefts,
            Rights,
            Tops,
            Bottoms,
            None

        }
        /// <summary>
        /// Style for the corner
        /// </summary>
        public enum ECornersStyle
        {
            normal,
            small,
            border
        }
        /// <summary>
        /// Contructor
        /// </summary>
        public CustomDiv()
            : base()
        {
            // Load the dictionary with the nifty corner style tags
            _dictCornerCallouts.Add(ECornersCurved.BottomLeft, "bl");
            _dictCornerCallouts.Add(ECornersCurved.BottomLeftTopRight, "bl tr");
            _dictCornerCallouts.Add(ECornersCurved.BottomRight, "br");
            _dictCornerCallouts.Add(ECornersCurved.BottomRightTopLeft, "br tl");
            _dictCornerCallouts.Add(ECornersCurved.Bottoms, "br bl");
            _dictCornerCallouts.Add(ECornersCurved.Lefts, "bl tl");
            _dictCornerCallouts.Add(ECornersCurved.Rights, "br tr");
            _dictCornerCallouts.Add(ECornersCurved.TopLeft, "tl");
            _dictCornerCallouts.Add(ECornersCurved.Tops, "tl tr");
            _dictCornerCallouts.Add(ECornersCurved.TopRight, "tr");
            _dictCornerCallouts.Add(ECornersCurved.All, "all");
            _dictCornerCallouts.Add(ECornersCurved.None, "none");

        }

        private ECornersCurved _cornersCurved;
        /// <summary>
        /// Specifies which corners to curve
        /// </summary>
        [Category("Custom Properties")]
        [DefaultValue(ECornersCurved.All)]
        [Description("Select a value from the dropdown list.")]
        [Browsable(true)]
        public ECornersCurved CornersCurved
        {
            get { return _cornersCurved; }
            set { _cornersCurved = value; }
        }

        /// <summary>
        /// Specifies the style of corner
        /// </summary>
        private ECornersStyle _cornersStyle;
        [Category("Custom Properties")]
        [DefaultValue(ECornersStyle.normal)]
        [Description("Select a value from the dropdown list.")]
        [Browsable(true)]
        public ECornersStyle CornersStyle
        {
            get { return _cornersStyle; }
            set { _cornersStyle = value; }
        }


        private Color _sContainerColor = Color.Empty;
        /// <summary>
        /// This is the color of the container that the control will be placed in
        /// </summary>
        [Category("Custom Properties")]
        [Description("Select a value from the dropdown list.")]
        [Browsable(true)]
        public Color ContainerColor
        {
            get
            {    //try and find the Container's color.  

                setContainerColor(Parent);
                //Set it to white if we can't find it.
                if (_sContainerColor.IsEmpty)
                {
                    _sContainerColor = Color.White;
                }

                return _sContainerColor;

            }
            set { _sContainerColor = value; }
        }

        protected override void OnInit(EventArgs e)
        {


            base.OnInit(e);
            RegisterNifty();

        }

        /// <summary>
        /// Overload the Render method to produce CSS friendly html
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {

            base.Render(writer);
            //// register the javascript code that specifies the format for these rounded corners
            //// this script also specifies the colors for the corners
            if (!Page.ClientScript.IsClientScriptBlockRegistered(this.GetType(),string.Format("CurvedDivLayout_{0}", ID)))
            {
                this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), string.Format("CurvedDivLayout_{0}", ID), buildLayoutScript());
            }
            writer.WriteLine(buildLayoutScript());



        }
        /// <summary>
        /// Create the child controls
        /// </summary>
        protected override void CreateChildControls()
        {
            // Add another Div tag to enable adding padding the inner contents
            Panel lPanel = new Panel();
            lPanel.Height = Height;
            Height = new Unit();
            Control[] ArrayControls = new Control[Controls.Count];
            Controls.CopyTo(ArrayControls, 0);

            foreach (Control lControl in ArrayControls)
            {
                lPanel.Controls.Add(lControl);
            }
            this.Controls.Clear();
            this.Controls.Add(lPanel);
            base.CreateChildControls();
        }

        /// <summary>
        /// Load the scripts from the WebResources
        /// </summary>
        private void RegisterNifty()
        {
            string csslink = null;
            LiteralControl include = null;

          
            // add main javascript file required to round the corners to the header
            HtmlGenericControl script = new HtmlGenericControl("script");
            script.ID = "nifty_js";
            if (!isHeaderScriptRegistered(script.ID))
            {
                script.Attributes["type"] = "text/javascript";
                script.Attributes["src"] = Page.ClientScript.GetWebResourceUrl(this.GetType(), "CurvedDivControl.Resources.nifty.js");
                this.Page.Header.Controls.Add(script);
            }


            // add the css files to create the rounded corners
            csslink = "<link rel='stylesheet' type='text/css' href='" + Page.ClientScript.GetWebResourceUrl(this.GetType(), "CurvedDivControl.Resources.niftyCorners.css") + "' />";
            include = new LiteralControl(csslink);
            include.ID = "niftyCorners_css";
            if (!isHeaderScriptRegistered(include.ID))
            {
                this.Page.Header.Controls.Add(include);
            }

            csslink = "<link rel='stylesheet' type='text/css' href='" + Page.ClientScript.GetWebResourceUrl(this.GetType(), "CurvedDivControl.Resources.niftyPrint.css") + "' />";
            include = new LiteralControl(csslink);
            include.ID = "niftyPrint_css";
            if (!isHeaderScriptRegistered(include.ID))
            {
                this.Page.Header.Controls.Add(include);
            }
        }
        /// <summary>
        /// Build the Nifty Javascript to round the corners of the div
        /// </summary>
        /// <returns></returns>
        private string buildLayoutScript()
        {
            StringBuilder lStringBuilder = new StringBuilder(@"<script type='text/javascript'>");
            lStringBuilder.AppendLine(@"<!--");
            //lStringBuilder.AppendLine("window.onload=function(){");
            lStringBuilder.AppendLine("if(NiftyCheck())");
            lStringBuilder.AppendLine("{");
            lStringBuilder.AppendLine("Rounded('DIV#ID','CORNERS_CURVED','CONTAINER_COLOR','DIV_COLOR','CORNER_STYLE');");
            lStringBuilder.Replace("DIV#ID", string.Format("DIV#{0}", ID));
            lStringBuilder.Replace("CORNERS_CURVED", _dictCornerCallouts[_cornersCurved]);
            lStringBuilder.Replace("CONTAINER_COLOR", System.Drawing.ColorTranslator.ToHtml(ContainerColor));
            lStringBuilder.Replace("DIV_COLOR", System.Drawing.ColorTranslator.ToHtml(BackColor));
            lStringBuilder.AppendLine("}");
            //lStringBuilder.AppendLine("};");
            lStringBuilder.AppendLine(@"// -->");
            lStringBuilder.AppendLine(@"</script>");


            string lcornerStyle = _cornersStyle.ToString();

            // check if this a border type and if it is add the color to it
            if (_cornersStyle == ECornersStyle.border)
            {
                lcornerStyle = string.Format("{0} {1}", lcornerStyle, System.Drawing.ColorTranslator.ToHtml(BorderColor));

            }
            else if (_cornersStyle == ECornersStyle.normal)
            {
                lcornerStyle = string.Empty;
            }


            lStringBuilder.Replace("CORNER_STYLE", lcornerStyle);

            return lStringBuilder.ToString();



        }

        /// <summary>
        /// Check to see if the script is already part of the header
        /// </summary>
        /// <param name="pstrID">Id of the Control</param>
        /// <returns></returns>
        private bool isHeaderScriptRegistered(string pstrID)
        {
            foreach (Control lControl in Page.Header.Controls)
            {
                if (lControl.ID == pstrID)
                {
                    return true;
                }
            }
            return false;

        }
        /// <summary>
        /// Recursively set the container color if it has not been specifically set
        /// </summary>
        /// <param name="pControl"></param>
        private void setContainerColor(Control pControl)
        {
            if (_sContainerColor != Color.Empty) return;
            if (pControl == null) return;


            if (pControl is WebControl)
            {
                WebControl lWebControl = ((WebControl)pControl);

                if (!lWebControl.BackColor.IsEmpty)
                {
                    _sContainerColor = ((WebControl)pControl).BackColor;
                    return;

                }
            }


            if (pControl is HtmlControl)
            {
                string lsHtmlColor = ((HtmlControl)pControl).Style["background-color"];
                if (lsHtmlColor != null)
                {
                    _sContainerColor = ColorTranslator.FromHtml(lsHtmlColor);
                    return;
                }
            }
            setContainerColor(pControl.Parent);


        }

    }
}
