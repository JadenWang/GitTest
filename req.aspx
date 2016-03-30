<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeFile="RequestBrowse.aspx.cs" Inherits="Page" %>

<html>
<head runat="server">
    <title>Request Browse</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <style>
        .MainBackground {
            background-color: #dce4ef;
        }

        #createButton {
            margin-bottom: 10px;
            margin-top: 10px;
        }

        .filter {
            margin-bottom: 10px;
            margin-right: 10px;  
        }
    </style>
    <script type="text/javascript">
        function CreateRequest() {
            var domain = '<%=Request.ApplicationPath%>';
            var url = domain + '/RequestManage';
            window.open(url, '_blank');
        }
    </script>
</head>
<body class="MainBackground">
    <form id="form1" runat="server">
        <div class="container">
            <div id="createButton">
                <a runat="server" href="~/RequestManage.aspx"> Create test Request</a>
            </div>
            <table>
                <tbody>
                    <tr>
                        <td>
                            <div class="filter">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_OnClick" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblStatus" Text="Status" AssociatedControlID="Status" runat="server"></asp:Label>
                        </td>
                        <td>
                            <div class="filter">
                                <asp:DropDownList ID="Status" AutoPostBack="True" runat="server"></asp:DropDownList>
                            </div>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="lblAssignedTo" Text="Assigned to" AssociatedControlID="AssignedTo"></asp:Label>
                        </td>
                        <td>
                            <div class="filter">
                                <asp:DropDownList ID="AssignedTo" AutoPostBack="True" runat="server"></asp:DropDownList>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>

            <asp:GridView ID="grdRequest" AutoGenerateColumns="false" runat="server" CssClass="table" OnRowDeleting="OnDeleteRequestRow">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" CommandName="Delete" AlternateText="Delete" 
                                ImageUrl="Content/img/cross.png" Width="20px" Height="20px"
                                OnClientClick="return confirm('Are you sure you want to delete this request?');"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Request ID">
                        <ItemTemplate>
                            <a href="RequestManage.aspx/<%#Eval("req_id") %>"><%#Eval("req_id") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Request Label">
                        <ItemTemplate>
                            <div style="width: 200px; overflow: hidden">
                                <%#Eval("req_label") %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <div style="width: 100px; overflow: hidden">
                                <%#Eval("status_label")%>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="AssignedTo">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem,"assignedTo")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="modified_date" HeaderText="Last Modified Date" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>


