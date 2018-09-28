<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="CurvedDivControl" Namespace="CurvedDivControl" TagPrefix="CustomDiv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    
    <style>
        Div#CustomDiv1{float:right;}
         Div#Test{float:left;}
         Div.RightArticle{margin-right:30px; margin-top:30px;}
         Div.LeftArticle{margin-top:30px; }
         .InnerLeftArticle{margin: 0px 5px 0px 5px }
         Div#InnerHeader Div{margin: 0px 0px 0px 0px}
    </style>
</head>
<body topmargin=0px leftmargin=0px>
    <form id="form1" runat="server" myenum="hay">
   <div style="height:70px; background-color:Beige;">
   Header
   
   </div>
    <div style="width:100%;min-width:800px; background-color:Bisque; padding-top:15px;  ">
    
    <CustomDiv:CustomDiv ID="Test" runat=server CornersCurved="Tops" BackColor=red ContainerColor=Bisque CornersStyle=border  BorderColor=Black Width=100px >
       <p style="margin-top:0px; margin-left:10px;color:White;height:10px">Left Sidebar</p>
       <p style="background-color:White; color:Black;Height:500px ;border-bottom:solid 1px black">sdfsdf</p>
    </CustomDiv:CustomDiv >
      
    
    <CustomDiv:CustomDiv ID="CustomDiv1" runat=server CornersCurved="All" BackColor=red ContainerColor=Bisque   CornersStyle=border  BorderColor=Black Width=100px  >
       <asp:Panel ID="Panel1" runat=server  Height=500px  >
       <p style=" margin-left:30px;">This is a test</p>
       </asp:Panel>
    </CustomDiv:CustomDiv >
    
    <div style="max-width:750px">
    
        
         <div style="float:left; margin-left:30px">
            <CustomDiv:CustomDiv ID="CustomDiv3"  CssClass="LeftArticle"  runat=server CornersCurved="All" BackColor=#6495ED  ContainerColor=Bisque  CornersStyle=border  BorderColor=#6495ED Width=300px  Height=300px  >
                <CustomDiv:CustomDiv ID="InnerHeader" CssClass=InnerLeftArticle runat=server CornersCurved="All" BackColor=Aqua  ContainerColor=CornflowerBlue  CornersStyle=border  BorderColor=white Height=30px >
                   <p style="margin-left:30px; padding-bottom:3px; height:20px; vertical-align:top">This is a test</p>
                </CustomDiv:CustomDiv >
            </CustomDiv:CustomDiv>
            
            <CustomDiv:CustomDiv ID="CustomDiv12" CssClass="LeftArticle" runat=server CornersCurved="All" BackColor=CornflowerBlue  ContainerColor=Bisque  CornersStyle=border  BorderColor=CornflowerBlue Width=300px  Height=300px  >
                <CustomDiv:CustomDiv ID="CustomDiv14" CssClass=InnerLeftArticle runat=server CornersCurved="All" BackColor=Aqua  ContainerColor=CornflowerBlue  CornersStyle=border  BorderColor=white Height=30px >
                   <p style="margin-left:30px; padding-bottom:3px; height:20px; vertical-align:top">This is a test</p>
                </CustomDiv:CustomDiv >
            </CustomDiv:CustomDiv>
            
        </div>
        <div style="margin-left:370px;margin-right:30px; max-width:400px">
            
            
             <CustomDiv:CustomDiv ID="CustomDiv7" CssClass="RightArticle" runat=server CornersCurved="Tops" BackColor=CornflowerBlue  ContainerColor=Bisque  CornersStyle=border  BorderColor=CornflowerBlue Width=100%  >
               
                <p style="margin-top:10px; margin-left:30px; color:white; height:5px">This is a test</p>
                <p style="margin-top:2px; padding: 5px 5px 5px 5px; margin-left:1px; margin-right:1px; background-color:White;Height:200px; border: solid 3px CornflowerBlue">This is a test</p>
             
            </CustomDiv:CustomDiv >
        </div>
    </div>
   
    </div>
   </form>
   
</body>
</html>
