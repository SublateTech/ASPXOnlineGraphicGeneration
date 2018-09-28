<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main_orders2.aspx.cs" Inherits="Signature.Web.MainOrders2" %>

<%@ Register Assembly="Infragistics2.WebUI.WebCombo.v9.1, Version=9.1.20091.1015, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
    Namespace="Infragistics.WebUI.WebCombo" TagPrefix="igcmbo" %>

<%@ Register Assembly="Signature.Web.Controls" Namespace="Signature.Web.Controls" TagPrefix="cc1" %>
    		
    		
<%@ Register assembly="Infragistics2.WebUI.UltraWebGrid.v9.1, Version=9.1.20091.1015, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.UltraWebGrid" tagprefix="igtbl" %>
    		
<%@ Register assembly="Infragistics2.WebUI.WebDataInput.v9.1, Version=9.1.20091.1015, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.WebDataInput" tagprefix="igtxt" %>
    		
    		
    		
    		<head>
                <style type="text/css">
                    .style1
                    {
                        width: 94%;
                        height: 230px;
                    }
                    .style2
                    {
                        width: 144px;
                        height: 26px;
                    }
                    .style3
                    {
                        height: 26px;
                    }
                    .style5
                    {
                        height: 27px;
                    }
                    .style6
                    {
                        height: 44px;
                    }
                    .style7
                    {
                        width: 57px;
                    }
                    .style9
                    {
                        width: 100px;
                    }
                    .style10
                    {
                        width: 86px;
                    }
                    #Text1
                    {
                        width: 83px;
                    }
                    .style11
                    {
                        width: 76px;
                    }
                    #Text2
                    {
                        width: 102px;
                    }
                    .style12
                    {
                        height: 27px;
                        width: 144px;
                    }
                    </style>
            <script language="javascript">
			   function AddNewRow()
			    {
				    var cbo = igcmbo_getComboById('WebCombo1');
				    var row = igtbl_addNew(cbo.grid.Id, 0);
				    row.getCell(0).setValue(11);
				    row.getCell(1).setValue("Name11");
				    row.getCell(2).setValue(new Date());

				    cbo = igcmbo_getComboById('WebCombo2');
				    row = igtbl_addNew(cbo.grid.Id, 0);
				    row.getCell(0).setValue(11);
				    row.getCell(1).setValue("Name11");
				    row.getCell(2).setValue(new Date());
				}
				function igtbl_gRowEditButtonClick1(event) {
				    alert("Ok");
				}
		    </script>
            </head>
   <cc1:Header ID="Header1" MenuType="CampaigneMenu" runat="server" /> 		
    		
    		<tr>
    		   <td align="center" >
                           
                             <form id="form1" runat="server">
                        <div>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:Button ID="Button1" runat="server" Text="Update One" />
                                <asp:Button ID="Button2" runat="server" Text="Update the Other" /><br /><br />
                                
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" >
                            <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
                            </Triggers>
                            <ContentTemplate>
                                <div style="border-style:solid;background-color:gray;">

                                <asp:Label runat="server" ID="time1"></asp:Label><br /><br />
                                </div><br />
                            </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false" >
                            <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
                            </Triggers>
                            <ContentTemplate>
                                <div style="border-style:solid;background-color:gray;">
                                <asp:Label runat="server" ID="time2"></asp:Label><br />
                                </div><br />
                            </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                
                
                           <table border='0' style="width: 596px; margin-left: 0px" width="100%">
                            <tr align='left'>
                                <td class="style2" >
                                    School Name:
                                </td>
                                <td class="style3" style="font-size: medium"  >
                                    <asp:Label ID="txtName" runat="server" Text="Label"></asp:Label>
                                </td>
                                
                            </tr>
                               <tr align="left">
                                   <td class="style2">
                                       <asp:Label runat="server" Text="Teacher : "></asp:Label>
                                   </td>
                                   <td class="style3">
                                       <igcmbo:WebCombo ID="Teachers" runat="server" BackColor="White" 
                                           BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" 
                                           SelBackColor="DarkBlue" SelForeColor="White" Version="4.00" 
                                           Editable="True" Height="20px" Width="300px" 
                                           onselectedrowchanged="Teachers_SelectedRowChanged">
                                           <Columns>
                                               <igtbl:UltraGridColumn FieldLen="35" Width="200">
                                                   <header caption="Teacher Name">
                                                   </header>
                                               </igtbl:UltraGridColumn>
                                           </Columns>
                                           <ExpandEffects ShadowColor="LightGray" />
                                           <DropDownLayout BorderCollapse="Separate" RowHeightDefault="20px" 
                                               Version="4.00">
                                               <FrameStyle BackColor="Silver" BorderStyle="Ridge" BorderWidth="2px" 
                                                   Cursor="Default" Font-Names="Verdana" Font-Size="10pt" Height="130px" 
                                                   Width="325px">
                                               </FrameStyle>
                                               <HeaderStyle BackColor="LightGray" BorderStyle="Solid">
                                               <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" 
                                                   WidthTop="1px" />
                                               </HeaderStyle>
                                               <RowStyle BackColor="White" BorderColor="Gray" BorderStyle="Solid" 
                                                   BorderWidth="1px">
                                               <BorderDetails WidthLeft="0px" WidthTop="0px" />
                                               </RowStyle>
                                               <SelectedRowStyle BackColor="DarkBlue" ForeColor="White" />
                                           </DropDownLayout>
                                       </igcmbo:WebCombo>
                                     </td>
                               </tr>
                            <tr>
                                <td class="style2" >
                                    <asp:Label runat="server" Text="Student : "></asp:Label>
                                </td>
                                <td class="style3"  >
                                    <igcmbo:WebCombo ID="Students" runat="server" BackColor="White" 
                                           BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" 
                                           SelBackColor="DarkBlue" SelForeColor="White" Version="4.00" 
                                        Editable="True" Width="300px" 
                                        onselectedrowchanged="Students_SelectedRowChanged">
                                           <Columns>
                                               <igtbl:UltraGridColumn Width="200px">
                                                   <header caption="Student Name">
                                                   </header>
                                               </igtbl:UltraGridColumn>
                                           </Columns>
                                           <ExpandEffects ShadowColor="LightGray" />
                                           <DropDownLayout BorderCollapse="Separate" RowHeightDefault="20px" 
                                               Version="4.00">
                                               <FrameStyle BackColor="Silver" BorderStyle="Ridge" BorderWidth="2px" 
                                                   Cursor="Default" Font-Names="Verdana" Font-Size="10pt" Height="130px" 
                                                   Width="325px">
                                               </FrameStyle>
                                               <HeaderStyle BackColor="LightGray" BorderStyle="Solid">
                                               <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" 
                                                   WidthTop="1px" />
                                               </HeaderStyle>
                                               <RowStyle BackColor="White" BorderColor="Gray" BorderStyle="Solid" 
                                                   BorderWidth="1px">
                                               <BorderDetails WidthLeft="0px" WidthTop="0px" />
                                               </RowStyle>
                                               <SelectedRowStyle BackColor="DarkBlue" ForeColor="White" />
                                           </DropDownLayout>
                                       </igcmbo:WebCombo>
                                </td>
                            </tr>
                               <tr>
                                   <td class="style6" colspan="2">
                                       &nbsp;</td>
                               </tr>
                               <tr>
                                   <td colspan="2" valign="top" align="center" class="style1">
                                       <asp:GridView ID="Grid" runat="server" AutoGenerateColumns="False" 
                                           DataKeyNames="ProductID" Width="100%" 
                                           onrowcancelingedit="Grid_RowCancelingEdit" onrowediting="Grid_RowEditing" 
                                           onrowupdating="Grid_RowUpdating" BorderColor="Black" 
                                           onrowdeleting="Grid_RowDeleting"  >
                                           <columns>
                                                      <asp:TemplateField HeaderText="ID">
                                                            <ItemTemplate>
                                                                <asp:Label ID="ProductID" runat="server" Text='<%# Bind("ProductID")%>'></asp:Label>
                                                            </ItemTemplate>
                                                           <HeaderStyle HorizontalAlign="Left" />
                                                            <ItemStyle Width="60px" />
                                                       </asp:TemplateField>
                                                       <asp:TemplateField HeaderText="Description">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblID" runat="server" Text='<%# Bind("Description")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ControlStyle Width="145px" />
                                                           <HeaderStyle HorizontalAlign="Left" />
                                                       </asp:TemplateField>
                                                       <asp:TemplateField HeaderText="Price">
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtPrice" runat="server" Text='<%# Bind("Price")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                       </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Quantity">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtQuantity" runat="server" Text='<%# Bind("Quantity")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ControlStyle Width="50px" />
                                                           <HeaderStyle HorizontalAlign="Left" />
                                                       </asp:TemplateField>
                                                       <asp:TemplateField HeaderText="Total">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblID" runat="server" Text='<%# Bind("Total") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ControlStyle Width="50px" />
                                                           <HeaderStyle HorizontalAlign="Left" />
                                                       </asp:TemplateField>
                                                       
                                                       <asp:CommandField  ButtonType=Button ShowEditButton=true ShowDeleteButton=true />
                                           
                                           </columns>
                                           <HeaderStyle BorderStyle="Solid" Font-Bold="True" Font-Strikeout="False" 
                                               ForeColor="#333333" />
                                       </asp:GridView>
                                        <BR><BR>
                                        </td>
                               </tr>
                               <tr>
                                   <td class="style12" colspan="1">
                                       &nbsp;</td>
                               </tr>
                               <tr>
                                   <td class="style5" colspan="2" width="100%">
                                       <table style="width: 100%; height: 35px;">
                                           <tr>
                                               <td class="style7">
                                                   Item # :</td>
                                               <td class="style10">
                                                   <igtxt:WebTextEdit ID="WebTextEdit1" runat="server" Height="20px" Width="86px">
                                                   </igtxt:WebTextEdit>
                                               </td>
                                               <td align="center" class="style9">
                                                   Quantity :</td>
                                               <td align="center" class="style11">
                                                   <igtxt:WebTextEdit ID="WebTextEdit2" runat="server" Height="20px" Width="86px">
                                                   </igtxt:WebTextEdit>
                                               </td>
                                           
                                               <td>
                                                   <input ID="igtbl_reCancelBtn1" onclick="igtbl_gRowEditButtonClick1(event);" 
                                                                            style="width:50px;" type="button" value="Cancel"></input>
                                               </td>
                                           </tr>
                                           
                                       </table>
                                   </td>
                               </tr>
                            </table>
                         </form>                     

               </td>
			</tr>
<cc1:Footer ID="Footer1" runat="server" />