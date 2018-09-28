<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main_orders.aspx.cs" Inherits="Signature.Web.MainOrders" %>

<%@ Register Assembly="Infragistics2.WebUI.WebCombo.v9.1, Version=9.1.20091.1015, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
    Namespace="Infragistics.WebUI.WebCombo" TagPrefix="igcmbo" %>

<%@ Register Assembly="Signature.Web.Controls" Namespace="Signature.Web.Controls" TagPrefix="cc1" %>
    		
    		
    		
    		<%@ Register assembly="Infragistics2.WebUI.UltraWebGrid.v9.1, Version=9.1.20091.1015, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.UltraWebGrid" tagprefix="igtbl" %>
    		
    		<%@ Register assembly="Infragistics2.WebUI.WebDataInput.v9.1, Version=9.1.20091.1015, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.WebDataInput" tagprefix="igtxt" %>
    		
    		
    		
    		<head>
                <style type="text/css">
                    .style1
                    {
                        width: 103%;
                    }
                    .style2
                    {
                        width: 103%;
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
                        width: 103%;
                    }
                    .style14
                    {
                        height: 213px;
                    }
                    .style15
                    {
                        width: 150px;
                    }
                    .style17
                    {
                        height: 25px;
                    }
                    .style19
                    {
                        height: 25px;
                        width: 96px;
                    }
                    .style20
                    {
                        width: 96px;
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
    		

    		
    		<tr>
    		   <td align="center" >
                        <cc1:Box ID="Box1" runat="server" BackColor="White" BorderColor="White"  HorizontalAlign="Center" ScrollBars="Vertical">
                           <table border='0' style="width: 517px; margin-left: 0px">
                            <tr align='left'>
                                <td class="style2" >
                                    School Name:</td>
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
                                <td class="style1" >
                                    <asp:Label runat="server" Text="Student : "></asp:Label>
                                </td>
                                <td  >
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
                                       </td>
                               </tr>
                               <tr>
                                   <td class="style14" colspan="2" width="100%" valign="top">
                                       <igtbl:UltraWebGrid ID="Grid" runat="server" Height="200px" 
                                           Width="100%" onselectedrowschange="Grid_SelectedRowsChange">
                                           <Bands>
                                               <igtbl:UltraGridBand>
                                                   <Columns>
                                                       <igtbl:UltraGridColumn Key="ProductID" Width="50px" AllowUpdate="No" 
                                                           IsBound="True">
                                                           <Header Caption="Item#">
                                                           </Header>
                                                       </igtbl:UltraGridColumn>
                                                       <igtbl:UltraGridColumn Key="Description" Width="200px" AllowUpdate="No" 
                                                           Case="Upper" IsBound="True">
                                                           <Header Caption="Description">
                                                               <RowLayoutColumnInfo OriginX="1" />
                                                           </Header>
                                                           <Footer>
                                                               <RowLayoutColumnInfo OriginX="1" />
                                                           </Footer>
                                                       </igtbl:UltraGridColumn>
                                                       <igtbl:UltraGridColumn Key="Quantity" Format="######" Width="40px" AllowUpdate="Yes">
                                                           <Header Caption="Quantity">
                                                               <RowLayoutColumnInfo OriginX="2" />
                                                           </Header>
                                                           <Footer>
                                                               <RowLayoutColumnInfo OriginX="2" />
                                                           </Footer>
                                                       </igtbl:UltraGridColumn>
                                                       <igtbl:UltraGridColumn Key="Price" Format="$ ###,##0.00" Width="60px" 
                                                           AllowGroupBy="No" AllowUpdate="No">
                                                           <Header Caption="Price">
                                                               <RowLayoutColumnInfo OriginX="3" />
                                                           </Header>
                                                           <Footer>
                                                               <RowLayoutColumnInfo OriginX="3" />
                                                           </Footer>
                                                       </igtbl:UltraGridColumn>
                                                       <igtbl:UltraGridColumn Key="Total" Width="50px" DataType="System.Decimal" 
                                                           Format="$ #,##0.00" AllowUpdate="No">
                                                           <Header Caption="Total">
                                                               <RowLayoutColumnInfo OriginX="4" />
                                                           </Header>
                                                           <Footer>
                                                               <RowLayoutColumnInfo OriginX="4" />
                                                           </Footer>
                                                       </igtbl:UltraGridColumn>
                                                       <igtbl:UltraGridColumn Type="Button" Width="40px" CellButtonDisplay="OnMouseEnter" AllowUpdate="Yes" Key="Edit">
                                                           <Header>
                                                               <RowLayoutColumnInfo OriginX="5" />
                                                           </Header>
                                                           <Footer>
                                                               <RowLayoutColumnInfo OriginX="5" />
                                                           </Footer>
                                                           
                                                       </igtbl:UltraGridColumn>
                                                       
                                                   </Columns>
                                              
                                                   <AddNewRow View="NotSet" Visible="NotSet">
                                                   </AddNewRow>
                                              
                                               </igtbl:UltraGridBand>
                                           </Bands>
                                           
                                           <DisplayLayout AllowColSizingDefault="Free" AllowColumnMovingDefault="OnServer" 
                                               AllowDeleteDefault="Yes" AllowSortingDefault="OnClient" 
                                               AllowUpdateDefault="Yes" BorderCollapseDefault="Separate" 
                                               HeaderClickActionDefault="SortMulti" Name="Grid" RowHeightDefault="20px" 
                                               RowSelectorsDefault="No" SelectTypeRowDefault="Extended" 
                                               StationaryMargins="Header" StationaryMarginsOutlookGroupBy="True" 
                                               TableLayout="Fixed" Version="4.00" ViewType="OutlookGroupBy">
                                               <FrameStyle BackColor="Window" BorderColor="InactiveCaption" 
                                                   BorderStyle="Solid" BorderWidth="1px" Font-Names="Microsoft Sans Serif" 
                                                   Font-Size="8.25pt" Height="200px" Width="100%">
                                               </FrameStyle>
                                               <Pager MinimumPagesForDisplay="2">
                                                   <PagerStyle BackColor="LightGray" BorderStyle="Solid" BorderWidth="1px">
                                                   <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" 
                                                       WidthTop="1px" />
                                                   </PagerStyle>
                                               </Pager>
                                               <EditCellStyleDefault BorderStyle="None" BorderWidth="0px">
                                               </EditCellStyleDefault>
                                               <FooterStyleDefault BackColor="LightGray" BorderStyle="Solid" BorderWidth="1px">
                                                   <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" 
                                                       WidthTop="1px" />
                                               </FooterStyleDefault>
                                               <HeaderStyleDefault BackColor="LightGray" BorderStyle="Solid" 
                                                   HorizontalAlign="Left">
                                                   <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" 
                                                       WidthTop="1px" />
                                               </HeaderStyleDefault>
                                               <RowStyleDefault BackColor="Window" BorderColor="Silver" BorderStyle="Solid" 
                                                   BorderWidth="1px" Font-Names="Microsoft Sans Serif" Font-Size="8.25pt">
                                                   <Padding Left="3px" />
                                                   <BorderDetails ColorLeft="Window" ColorTop="Window" />
                                               </RowStyleDefault>
                                               <GroupByRowStyleDefault BackColor="Control" BorderColor="Window">
                                               </GroupByRowStyleDefault>
                                               <GroupByBox>
                                                   <BoxStyle BackColor="ActiveBorder" BorderColor="Window">
                                                   </BoxStyle>
                                               </GroupByBox>
                                               <AddNewBox Hidden="False">
                                                   <BoxStyle BackColor="Window" BorderColor="InactiveCaption" BorderStyle="Solid" 
                                                       BorderWidth="1px">
                                                       <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" 
                                                           WidthTop="1px" />
                                                   </BoxStyle>
                                               </AddNewBox>
                                               <ActivationObject BorderColor="" BorderWidth="">
                                               </ActivationObject>
                                               <FilterOptionsDefault>
                                                   <FilterDropDownStyle BackColor="White" BorderColor="Silver" BorderStyle="Solid" 
                                                       BorderWidth="1px" CustomRules="overflow:auto;" 
                                                       Font-Names="Verdana,Arial,Helvetica,sans-serif" Font-Size="11px" Height="300px" 
                                                       Width="200px">
                                                       <Padding Left="2px" />
                                                   </FilterDropDownStyle>
                                                   <FilterHighlightRowStyle BackColor="#151C55" ForeColor="White">
                                                   </FilterHighlightRowStyle>
                                                   <FilterOperandDropDownStyle BackColor="White" BorderColor="Silver" 
                                                       BorderStyle="Solid" BorderWidth="1px" CustomRules="overflow:auto;" 
                                                       Font-Names="Verdana,Arial,Helvetica,sans-serif" Font-Size="11px">
                                                       <Padding Left="2px" />
                                                   </FilterOperandDropDownStyle>
                                               </FilterOptionsDefault>
                                           </DisplayLayout>
                                           
                                       </igtbl:UltraWebGrid>
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
                        </cc1:Box>



               




               </td>
			</tr>
