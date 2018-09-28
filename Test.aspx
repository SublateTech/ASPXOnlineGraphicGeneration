<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Signature.Web.Test" %>
<%@ Register Assembly="Signature.Web.Controls" Namespace="Signature.Web.Controls" TagPrefix="cc1" %>

<cc1:Header MenuType="CampaigneMenu" runat="server" />
    <tr>
    		   <td>
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
                     </form>
                     
               </td>
	</tr>

<cc1:Footer ID="Footer1" runat="server" />
