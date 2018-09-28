using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Signature.Classes;
using Signature.Data;

namespace Signature.Web
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        /*
        protected void Page_Load(object sender, EventArgs e)
        {
            Order oOrder = new Order("S09");
            if (oOrder.Find(615493))
            {
                
            }
        }
        */
        protected void Page_Load(object sender, EventArgs e)    
        {        
            try        
            {            
                if (!(IsPostBack))            
                {                
                    bindGrid(0, null);            
                }        
            }        
            catch (Exception ex)        
            {            
                Response.Write(ex.Message);        
            }    
        }    
        private void bindGrid(int DeleteRowId, string UpdateValue)    
        {        grd.DataSource = getTable(DeleteRowId, UpdateValue);        
            grd.DataBind();    }    private DataTable getTable(int DeleteRowId,string UpdateValue)   
            {        DataTable dt = null;        
                try        {            
                    dt = new DataTable();           
                    dt.Columns.Add("Id", typeof(int));           
                    dt.Columns.Add("Name", typeof(string));            
                    DataRow dr = null;            
                    for (int i = 1; i <= 10; i++)            
                    {                if (DeleteRowId != i)                
                    {                    dr = dt.NewRow();                    
                        dr["Id"] = i.ToString();                    
                        dr["Name"] = "Name " + i.ToString();                   
                        dt.Rows.Add(dr);                    dr = null;               
                    }                
                    else                
                    {                    
                        dr = dt.NewRow();                   
                        dr["Id"] = i.ToString();                   
                        dr["Name"] = UpdateValue;                    
                        dt.Rows.Add(dr);                    
                        dr = null;                
                    }            
                    }            
                    return dt;        
                }        
                catch (Exception ex)        
                {            
                    throw ex;        
                }        
                finally        
                {            
                    
                    if (dt != null) 
                        dt = null;        
                }    }    
        protected void grd_RowEditing(object sender, GridViewEditEventArgs e)    
        {        
            try        
        {            
                grd.EditIndex = e.NewEditIndex;            
                bindGrid(0, null);        
            }        catch (Exception ex)        {            Response.Write(ex.Message);        }    }    
        protected void grd_RowUpdating(object sender, GridViewUpdateEventArgs e)    {        
            TextBox txt = null;        try        {            
                txt = ((TextBox)(grd.Rows[e.RowIndex].FindControl("txtEditName")));            
                if (txt == null)                
                    throw new Exception("Not valid");            
                grd.EditIndex = -1;            
                bindGrid(e.RowIndex + 1, txt.Text);            //bindGrid(0, null);        
            }        catch (Exception ex)        {            
                Response.Write(ex.Message);        }       
            finally        {            
                if (txt != null) txt = null;        }   
        }    
        protected void grd_RowDeleting(object sender, GridViewDeleteEventArgs e)    
        {       
            try       
            {            
                bindGrid(e.RowIndex, null);       
            }        
            catch (Exception ex)        
            {            
                Response.Write(ex.Message);        
            }    
        }    
        protected void grd_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)    
        {        
            try        
            {            
                grd.EditIndex = -1;            
                bindGrid(0, null);       
            }        
            catch (Exception ex)        
            {            
                Response.Write(ex.Message);        
            }    
        }    
        protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)    
        {        
            try        
            {            
                grd.PageIndex = e.NewPageIndex;            
                bindGrid(0, null);        
            }        
            catch (Exception ex)        
            {            
                Response.Write(ex.Message);        
            }    
        }
    }
}
