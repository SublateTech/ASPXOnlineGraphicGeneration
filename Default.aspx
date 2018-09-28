<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Signature.Web.Main" %>

<%@ Register Assembly="Signature.Web.Controls" Namespace="Signature.Web.Controls" TagPrefix="cc1" %>
    		
    		<head>
                <style type="text/css">
                    .style1
                    {
                        width: 104px;
                    }
                    .style2
                    {
                        width: 104px;
                        height: 26px;
                    }
                    .style3
                    {
                        height: 26px;
                    }
                </style>
            </head>
    		
    		<tr>
    		   <td align="center" >
                        <cc1:Box ID="Box1" runat="server" BackColor="White" BorderColor="White"  HorizontalAlign="Center" ScrollBars="Vertical" Title="Campaing Software">
                        
                           <table border='0'>
                            <tr align='left'>
                                <td class="style2" >
                                    Season:</td>
                                <td class="style3"  >
                                    <asp:DropDownList ID="Season" runat="server" Height="20px" Width="164px">
                                        
                                        <asp:ListItem value="S09" selected="True">
                                              Spring 2009
                                        </asp:ListItem>
                                        <asp:ListItem value="F09" selected="False">
                                              Fall 2009
                                        </asp:ListItem>
                                        
                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                               <tr align="left">
                                   <td class="style2">
                                       <asp:Label runat="server" Text="Name : "></asp:Label>
                                   </td>
                                   <td class="style3">
                                       <asp:TextBox runat="server" Width="266px" ID="Name">TRACI MORELLI</asp:TextBox>
                                   </td>
                               </tr>
                            <tr>
                                <td class="style1" >
                                    <asp:Label runat="server" Text="Password : "></asp:Label>
                                </td>
                                <td  >
                                    <asp:textbox runat="server" Width="110px" ID="Password">10048</asp:textbox>
                                </td>
                            </tr>
                               <tr>
                                   <td class="style1" height="50">
                                       &nbsp;</td>
                                   <td height="50">
                                       <asp:Button ID="butLogIn" runat="server" onclick="butLogIn_Click" Text="Log In" 
                                           Width="109px" Height="24px" />
                                   </td>
                               </tr>
                            </table>
                        </cc1:Box>
               </td>
			</tr>
