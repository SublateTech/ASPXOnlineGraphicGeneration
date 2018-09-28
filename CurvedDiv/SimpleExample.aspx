<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SimpleExample.aspx.cs" Inherits="SimpleExample" %>

<%@ Register Assembly="CurvedDivControl" Namespace="CurvedDivControl" TagPrefix="cc1" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style>
            #CustomDiv1.Div{vertical-align:top}
            #CustomDiv2{margin-left:10px;margin-top:20px; text-align:center)
    
    </style>
</head>
<body bgcolor="#cc0099" style="">
    <form id="form1" runat="server">
    <div runat=server style=" background-color:#cc0099; height:100%; width:100%; ">
            
            <cc1:CustomDiv ID="CustomDiv1" runat="server" BackColor="Blue" BorderColor="#000040"
                ContainerColor="#cc0099" CornersStyle="border" Height="196px" Width="377px">
                <center>
                     <cc1:CustomDiv ID="CustomDiv2" runat="server" BackColor="#C0FFC0" 
                        Width="321px">
                       
                             <center>This is a sample of what you can do.</center>
                    </cc1:CustomDiv>
                </center>
                </cc1:CustomDiv>
           
       </div>
        
    </form>
</body>
</html>
