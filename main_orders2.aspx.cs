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
    public partial class MainOrders2 : Page
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
           // this.MenuType = TopMenu.MenuType.CampaigneMenu;
            base.OnInit(e);
        }

        

        protected void Students_SelectedRowChanged(object sender, Infragistics.WebUI.WebCombo.SelectedRowChangedEventArgs e)
        {
            Session["S_Index"] = Students.SelectedIndex;

            LoadTeachers();
            LoadStudents();


            if (this.IsPostBack)
            {
                oOrder = new Order(oCustomer.CompanyID);
                //Response.Write(Teachers.Rows[Teachers.SelectedIndex].Cells[0].Value.ToString());
                //Response.Write(Students.Rows[Students.SelectedIndex].Cells[0].Value.ToString());

                oOrder.CustomerID = oCustomer.ID;
                /*
                if (oOrder.Find(Teachers.DisplayValue, Students.DisplayValue))
                {
                    foreach (Order.Item Item in oOrder.Items)
                    {
                        UltraGridRow _row = new UltraGridRow();
                        _row.Cells.Add(new UltraGridCell(Item.ProductID));
                        _row.Cells.Add(new UltraGridCell(Item.Description));
                        _row.Cells.Add(new UltraGridCell(Item.Quantity));
                        _row.Cells.Add(new UltraGridCell(Item.Price));
                        _row.Cells.Add(new UltraGridCell(Item.Price * Item.Quantity));
                        //  Grid.Rows.Add(_row);
                    }
                    Session["Order"] = oOrder;
                    LoadOrder();
                }
                */
            }

        }

        protected void Teachers_SelectedRowChanged(object sender, Infragistics.WebUI.WebCombo.SelectedRowChangedEventArgs e)
        {
           
            
            Session["T_Index"] = Teachers.SelectedIndex;
           LoadStudents();
         
        }

        protected virtual void LoadStudents()
        {
            

            oCustomer = (Customer)(Session["Customer"]);
            DataTable dt = Global.oMySql.GetDataTable(String.Format("Select Student from Orders Where CompanyID='{0}' And CustomerID='{1}' And Teacher='{2}' Group By Student", oCustomer.CompanyID, oCustomer.ID, Teachers.DisplayValue), "Student");


          
            if (dt != null)
            {
                Students.Rows.Clear();
                foreach (DataRow row in dt.Rows)
                {
                    UltraGridRow _row = new UltraGridRow();
                    _row.Cells.Add(new UltraGridCell(row["Student"].ToString()));
                    Students.Rows.Add(_row);
                }
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
        void LoadOrder()
        {
            if (Session["Order"] != null)
            {
                Order oOrder = (Order) Session["Order"];
                Grid.DataSource = oOrder.Items.Table;
                Grid.DataBind();
            }
        }

        protected void Grid_EditCommand(object source, DataGridCommandEventArgs e)
        {   
         //   Grid.DataBind();
            Response.Redirect("http://www.sigfund.com");
        }

        protected void Grid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Grid.EditIndex = e.NewEditIndex;
            LoadStudents();
            LoadTeachers();
            LoadOrder();
        }
        protected void Grid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Grid.EditIndex = -1;
            LoadStudents();
            LoadTeachers();
            LoadOrder();
            
        }

        protected void Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label txtQuantity = (Label)Grid.Rows[e.RowIndex].FindControl("txtQuantity");
            Order oOrder = (Order)Session["Order"];
            oOrder.Items[((TextBox)Grid.Rows[e.RowIndex].FindControl("txtProductID")).Text].Quantity =  9999;

            Session["Order"] = oOrder; 
            
            LoadStudents();
            LoadTeachers();
            LoadOrder();
        }
        protected void Grid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Response.Redirect("www.sigfund.com");
            TextBox txtQuantity = (TextBox)Grid.Rows[e.RowIndex].FindControl("txtQuantity");
            TextBox txtPrice = (TextBox)Grid.Rows[e.RowIndex].FindControl("txtPrice");
            Response.Write(txtQuantity.Text);
            /*
            Order oOrder = (Order)Session["Order"];
            oOrder.Items[((TextBox)Grid.Rows[e.RowIndex].FindControl("txtProductID")).Text].Quantity =  Convert.ToInt32((txtQuantity.Text));

            Session["Order"] = oOrder; 
            */
            LoadStudents();
            LoadTeachers();
            LoadOrder();
            // Grid.EditIndex = -1;
        }
        

    }
}
