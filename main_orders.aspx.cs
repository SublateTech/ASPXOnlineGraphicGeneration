using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Signature.Web.Controls;
using Signature.Data;
using Signature.Classes;
using System.Data;
using Infragistics.WebUI.UltraWebGrid;


namespace Signature.Web
{
    public partial class MainOrders : PageBase
    {

        Customer oCustomer;
        Order oOrder;

        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
           // if (Session["Customer"] != null)
           //     oCustomer = (Customer)(Session["Customer"]);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Customer"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                oCustomer = (Customer)(Session["Customer"]);
                txtName.Text = oCustomer.Name;

                LoadTeachers();
            }


        }
        protected override void OnInit(EventArgs e)
        {
           // LiteralControl include = new LiteralControl("ssssssssssssssssssssss");
           // this.Box1.Controls.Add(include);
            this.MenuType = TopMenu.MenuType.CampaigneMenu;
            base.OnInit(e);
        }

        protected void Students_SelectedRowChanged(object sender, Infragistics.WebUI.WebCombo.SelectedRowChangedEventArgs e)
        {
            Session["S_Index"] = Students.SelectedIndex;

            LoadTeachers();
            LoadStudents();

            oOrder = new Order(oCustomer.CompanyID);
            //Response.Write(Teachers.Rows[Teachers.SelectedIndex].Cells[0].Value.ToString());
            //Response.Write(Students.Rows[Students.SelectedIndex].Cells[0].Value.ToString());

            oOrder.CustomerID = oCustomer.ID;
            if (oOrder.Find(Teachers.Rows[Teachers.SelectedIndex].Cells[0].Value.ToString(), Students.Rows[Students.SelectedIndex].Cells[0].Value.ToString())) ;
               // Response.Write("Found It " + oOrder.ID.ToString());
            
            foreach(Order.Item Item in oOrder.Items)
            {
                UltraGridRow _row = new UltraGridRow();
                _row.Cells.Add(new UltraGridCell(Item.ProductID));
                _row.Cells.Add(new UltraGridCell(Item.Description));
                _row.Cells.Add(new UltraGridCell(Item.Quantity));
                _row.Cells.Add(new UltraGridCell(Item.Price));
                _row.Cells.Add(new UltraGridCell(Item.Price*Item.Quantity));
                Grid.Rows.Add(_row);


            }
            //Grid.DataSource = oOrder.CurrentDetail;
            //Grid.DataBind();

        }

        protected void Teachers_SelectedRowChanged(object sender, Infragistics.WebUI.WebCombo.SelectedRowChangedEventArgs e)
        {
            Session["T_Index"] = Teachers.SelectedIndex;
            LoadStudents();
        }

        void LoadStudents()
        {
            oCustomer = (Customer)(Session["Customer"]);
            DataTable dt = Global.oMySql.GetDataTable(String.Format("Select Student from Orders Where CompanyID='{0}' And CustomerID='{1}' And Teacher='{2}' Group By Student", oCustomer.CompanyID, oCustomer.ID, Teachers.Rows[Teachers.SelectedIndex].Cells[0].Value), "Student");
            //Response.Write(String.Format("Select Student from Orders Where CompanyID='{0}' And CustomerID='{1} And Teacher='{2}' Group By Student", oCustomer.CompanyID, oCustomer.ID, Teachers.Rows[Teachers.SelectedIndex].Cells[0].Value));

            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    UltraGridRow _row = new UltraGridRow();
                    _row.Cells.Add(new UltraGridCell(row["Student"].ToString()));
                    Students.Rows.Add(_row);
                }
            }
            if (Session["S_Index"] != null && (Int32)Session["S_Index"] != -1)
            {
                Students.SelectedIndex = (Int32)Session["S_Index"];
            }

        }
        void LoadTeachers()
        {
          //  Response.Write(Teachers.SelectedIndex.ToString());
            oCustomer = (Customer)(Session["Customer"]);
            DataTable dt = Global.oMySql.GetDataTable(String.Format("Select Teacher from Orders Where CompanyID='{0}' And CustomerID='{1}' Group By Teacher", oCustomer.CompanyID, oCustomer.ID), "Teachers");
            //  Response.Write(String.Format("Select Teacher from Orders Where CompanyID='{0}' And CustomerID='{1}' Group By Teacher", oCustomer.CompanyID, oCustomer.ID));

            foreach (DataRow row in dt.Rows)
            {

                UltraGridRow _row = new UltraGridRow();
                _row.Cells.Add(new UltraGridCell(row["Teacher"].ToString()));
                Teachers.Rows.Add(_row);
            }

            if (Session["T_Index"]!=null && (Int32) Session["T_Index"] != -1)
            {
                Teachers.SelectedIndex = (Int32)Session["T_Index"];
            }
        }

        protected void Grid_SelectedRowsChange(object sender, SelectedRowsEventArgs e)
        {
            Response.Write("Ok");
        }

    }
}
