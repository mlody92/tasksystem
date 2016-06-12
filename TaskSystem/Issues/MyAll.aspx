<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyAll.aspx.cs" Inherits="TaskSystem.Issues.MyAll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="blank1">My all issues</h3>

    <div class="bs-example5" data-example-id="default-media">
        <div class="media">
            Search in issue:
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="Button1_Click"/>
            <hr />
            <div class="panel-body1">
                <asp:GridView ID="GridView1" runat="server" class="table table-striped" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <%--<asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />--%>
                        <asp:TemplateField HeaderText="header">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("short")+"-"+Eval("issueIndex")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="view" Text='<%# Eval("title")%>' CommandArgument='<%#Eval("short")+"-"+Eval("issueIndex")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--<asp:ButtonField CommandName="view" DataTextField="title" />--%>
                        <asp:BoundField DataField="priority" HeaderText="Priority" SortExpression="priority" />
                        <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                        <asp:BoundField DataField="sprint" HeaderText="Sprint" SortExpression="sprint" />
                        <asp:BoundField DataField="affect" HeaderText="Affect" SortExpression="affect" />
                        <asp:BoundField DataField="fix" HeaderText="Fix" SortExpression="fix" />
                        <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                    </Columns>
                </asp:GridView>
                <asp:HiddenField ID="hfCount" runat="server" Value="0" />
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</asp:Content>
