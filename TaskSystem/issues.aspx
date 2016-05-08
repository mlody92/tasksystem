<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="issues.aspx.cs" Inherits="TaskSystem.issues" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.8.0.js" type="text/javascript"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.22/jquery-ui.js"></script>
    <link rel="Stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.10/themes/redmond/jquery-ui.css" />
    <script type="text/javascript">
        $(function () {
            $(".drag_drop_grid").sortable({
                items: 'tr:not(tr:first-child)',
                cursor: 'crosshair',
                connectWith: '.drag_drop_grid',
                axis: 'y',
                dropOnEmpty: true,
                receive: function (e, ui) {
                    $(this).find("tbody").append(ui.item);
                }
            });
            $("[id*=gvDest] tr:not(tr:first-child)").remove();
        });
    </script>
    

    <asp:GridView ID="gvSource" runat="server" CssClass="drag_drop_grid GridSrc" AutoGenerateColumns="false">
        <Columns>

            <asp:TemplateField HeaderText="header">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("id")%>'></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("title")%>'></asp:Label>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("project")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <hr />
    <asp:GridView ID="gvDest" runat="server" CssClass="drag_drop_grid GridDest" AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField HeaderText="header">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("id")%>'></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("title")%>'></asp:Label>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("project")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>






    <asp:GridView ID="GridView1" runat="server" Width="300px" AutoGenerateColumns="False" >
        <Columns>
            <%--
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
            <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
            <asp:BoundField DataField="project" HeaderText="Project" SortExpression="project" />
              <asp:BoundField DataField="short" HeaderText="Short" SortExpression="short" />
                        <asp:BoundField DataField="issueIndex" HeaderText="IssueIndex" SortExpression="issueIndex" />
                        <asp:BoundField DataField="priority" HeaderText="Priority" SortExpression="priority" />
                        <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                        <asp:BoundField DataField="sprint" HeaderText="Sprint" SortExpression="sprint" />
                        <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                        <asp:BoundField DataField="affect" HeaderText="Affect" SortExpression="affect" />
                        <asp:BoundField DataField="fix" HeaderText="Fix" SortExpression="fix" />
                        <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                        <asp:ButtonField CommandName="editRecord" Text="Edit" ItemStyle-Width="10px" />--%>
            <asp:TemplateField HeaderText="header">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("id")%>'></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("title")%>'></asp:Label>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("project")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>

</asp:Content>
