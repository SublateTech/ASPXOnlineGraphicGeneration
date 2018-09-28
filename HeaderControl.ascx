<%@ Control Language="c#" AutoEventWireup="false" Codebehind="HeaderControl.ascx.cs" Inherits="Signature.Web.HeaderControl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
 
    <div>
        <asp:scriptmanager ID='Scriptmanager1' runat='server'></asp:scriptmanager>

        <asp:UpdatePanel ID='UpdatePanel1' runat='server'>
        <ContentTemplate>
        <asp:AdRotator ID='AdRotator1' runat='server' DataSourceID='XmlDataSource1' />
        <asp:XmlDataSource ID='XmlDataSource1' runat='server' DataFile='~/1.xml'>
        </asp:XmlDataSource>        
        <asp:Timer ID='tm' Interval=3000 runat='server' />
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>    
