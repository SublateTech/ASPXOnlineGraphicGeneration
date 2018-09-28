
<%@ Page Language=VB Debug=true %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OLEDB" %>
<script runat=server>
Sub Page_Load(ByVal Sender as Object, ByVal E as EventArgs)
    If Not IsPostBack Then
        BuildDataList
    End If
End Sub
Sub Edit_Grid(sender As Object, e As DataGridCommandEventArgs)
    dgEmps.EditItemIndex = e.Item.ItemIndex
    BuildDataList
End Sub

Sub Update_Grid(ByVal Sender as Object, ByVal E as DataGridCommandEventArgs)
    Dim TheID as String
    Dim LastName as String
    Dim FirstName as String
    TheID = E.Item.Cells(2).Text
    LastName = CType(e.Item.Cells(0).Controls(0), TextBox).Text
    FirstName = CType(e.Item.Cells(1).Controls(0), TextBox).Text
    Dim DBConn as OleDbConnection
    Dim DBUpdate As New OleDbCommand
    DBConn = New OleDbConnection( _
        "PROVIDER=Microsoft.Jet.OLEDB.4.0;" _
        & "DATA SOURCE=" _
        & Server.MapPath("EmployeeDatabase.mdb;"))
    DBUpdate.CommandText = "Update Employee " _
        & "Set LastName = '" & LastName &"', " _
        & "FirstName = '" & FirstName & "' " _
        & "Where ID = " & TheID
    DBUpdate.Connection = DBConn
    DBUpdate.Connection.Open
    DBUpdate.ExecuteNonQuery()
    DBConn.Close
    dgEmps.EditItemIndex = -1
    BuildDataList
End Sub
Sub CommandAdd_Click(Sender As Object, E As CommandEventArgs)
    Dim DBConn as OleDbConnection
    Dim DBAdd As New OleDbCommand
    DBConn = New OleDbConnection( _
        "PROVIDER=Microsoft.Jet.OLEDB.4.0;" _
        & "DATA SOURCE=" _
        & Server.MapPath("EmployeeDatabase.mdb;"))
    DBAdd.CommandText = "Insert Into Employee (LastName) " _
        & "values ('new LastName')"
    DBAdd.Connection = DBConn
    DBAdd.Connection.Open
    DBAdd.ExecuteNonQuery()
    DBConn.Close
    dgEmps.EditItemIndex = 0
    BuildDataList
End Sub
Sub BuildDataList ()
        Dim DBConn as OleDbConnection
        Dim DBCommand As OleDbDataAdapter
        Dim DSPageData as New DataSet
        DBConn = New OleDbConnection( _
            "PROVIDER=Microsoft.Jet.OLEDB.4.0;" _
            & "DATA SOURCE=" _
            & Server.MapPath("EmployeeDatabase.mdb;"))
        DBCommand = New OleDbDataAdapter _
            ("Select * From Employee " _
            & "Order By LastName, FirstName", DBConn)
        DBCommand.Fill(DSPageData, _
            "Employee")
        dgEmps.DataSource = _
            DSPageData.Tables("Employee").DefaultView
        dgEmps.DataBind()
End Sub
</SCRIPT>
<HTML>
<HEAD>
<TITLE>Adding Rows to a DataGrid Control</TITLE>
</HEAD>
<Body LEFTMARGIN="40">
<form id="Form1" runat="server">
<BR><BR>
<asp:Label 
    id="lblMessage" 
    runat="server"
/>
<BR><BR>
<asp:datagrid
    id="dgEmps" 
    runat="server" 
    autogeneratecolumns="false"
    oneditcommand="Edit_Grid"
    onupdatecommand="Update_Grid" Height="157px" Width="557px"
    >
    <columns>
        <asp:boundcolumn 
            HeaderText="Last Name" 
            DataField="LastName"
        />
        <asp:boundcolumn 
            HeaderText="First Name" 
            DataField="FirstName"
        />
        <asp:boundcolumn 
            datafield="ID"
            visible=False
            readonly=true
        />
        <asp:editcommandcolumn
             edittext="Edit"
             updatetext="Update"
             itemstyle-wrap="false"
             headertext="Edit"
             headerStyle-wrap="false"
        >
<HeaderStyle Wrap="False"></HeaderStyle>

<ItemStyle Wrap="False"></ItemStyle>
        </asp:editcommandcolumn>
    </columns>
</asp:datagrid>
<BR><BR>
<asp:LinkButton 
    id="butAdd" 
    text="Add" 
    commandname="Add"
    oncommand="CommandAdd_Click"
    runat="server"
/>
</form>
</BODY>
</HTML>
