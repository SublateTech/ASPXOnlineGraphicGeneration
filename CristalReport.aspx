<%@ Page language="c#" Codebehind="CristalReport.aspx.cs" AutoEventWireup="false" Inherits="Signature.Web.Report" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register Assembly="Signature.Web.Controls" Namespace="Signature.Web.Controls" TagPrefix="cc1" %>
    		
    		<tr>
    		   <td >
                        <cc1:Box ID="Box2" runat="server">
         
                            <h1>This is the base Class</h1>
                            <h2>This is the base Class</h2>
                            <h3>This is the base Class</h3>
                            <h4>This is the base Class</h4>
                            
                            <p>Base Class</p>
                            <CR:CRYSTALREPORTVIEWER id="CrystalReportViewer1" style="Z-INDEX: 102; LEFT: 0px; POSITION: absolute; TOP: -2px"
				                                    runat="server" Height="50px" Width="350px" AutoDataBind="true" 
				                                    PrintMode="ActiveX" GroupTreeStyle-BackColor="Transparent"
				                                    GroupTreeStyle-ForeColor="Black">
				            </CR:CRYSTALREPORTVIEWER>
                            
                        </cc1:Box>
               </td>
			</tr>

