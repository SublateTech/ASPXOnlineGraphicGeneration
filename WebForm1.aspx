<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Signature.Web.WebForm1" %>

<%@ Register Assembly="Infragistics2.Web.v9.1, Version=9.1.20091.1015, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
    Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        
    </asp:ScriptManager>
    <div>
    <asp:GridView ID="grd" runat="server" AutoGenerateColumns="false"
                 AllowPaging="true" PageSize="5" onpageindexchanging="grd_PageIndexChanging"
                 onrowcancelingedit="grd_RowCancelingEdit" onrowdeleting="grd_RowDeleting"             
                 onrowediting="grd_RowEditing" onrowupdating="grd_RowUpdating">        
                 <Columns>            
                    <asp:TemplateField HeaderText="Id">                
                        <ItemTemplate>                    
                        <asp:Label ID="lbl" runat="server" Text=''>
                        </asp:Label>                
                      </ItemTemplate>            
                      </asp:TemplateField>            
                      <asp:TemplateField HeaderText="Name">                
                      <ItemTemplate>                    
                      <%# Eval("Name") %>                
                      </ItemTemplate>                
                      <EditItemTemplate>                    
                      <asp:TextBox ID="txtEditName" runat="server" Text=''>
                      </asp:TextBox>                
                      </EditItemTemplate>            
                      </asp:TemplateField>            
                      <asp:CommandField ButtonType="Link" EditText="Edit" HeaderText="Edit" ShowEditButton="true" />            
                      <asp:CommandField ButtonType="Link" DeleteText="Delete" HeaderText="Delete" ShowDeleteButton="true" />        
                      </Columns>    
                      </asp:GridView>
    </div>
    </form>
</body>
</html>
