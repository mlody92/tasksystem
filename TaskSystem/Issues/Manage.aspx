<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="TaskSystem.Issues.Manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 class="blank1">Issue</h3>


    <div class="bs-example5" data-example-id="default-media">
        <div class="media">
            <div class="panel-body1">
                <asp:GridView ID="GridView1" runat="server" class="table table-striped" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="GridView1_RowCommand">
                    <Columns>
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
                        <asp:ButtonField CommandName="editRecord" Text="Edit" ItemStyle-Width="10px" />
                    </Columns>
                </asp:GridView>
                <asp:HiddenField ID="hfCount" runat="server" Value="0" />
            </div>
        </div>
        <div class="clearfix"></div>
    </div>


    <div id="editModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit issue</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group mb-n">
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label">Title</label>
                                <div class="col-sm-8">
                                    <input id="Text3" type="text" runat="server" class="form-control1" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label">Project</label>
                                <div class="col-sm-8">

                                   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <%--<asp:DropDownList ID="DropDownList8" runat="server" OnSelectedIndexChanged="SelectedChange" EventName="SelectedChange" AppendDataBoundItems="true" class="form-control1" ClientIDMode="Static" AutoPostBack="true" />--%>
                                            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="SelectedChange" EventName="SelectedChange" class="form-control1" AutoPostBack="true" />
                                        </ContentTemplate>
                                        <%--<Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="DropDownList1" />
                                        </Triggers>--%>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <%-- <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label">Project</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control1">
                                    </asp:DropDownList>
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label">Issue type</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DropDownList2" runat="server" class="form-control1">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label">Priority</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DropDownList3" runat="server" class="form-control1">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label">Sprint</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DropDownList4" runat="server" class="form-control1"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label">Affect version</label>
                                <div class="col-sm-8">

                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="DropDownList5" runat="server" AppendDataBoundItems="true" class="form-control1" />
                                        </ContentTemplate>
                                       <%-- <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="DropDownList5" />
                                        </Triggers>--%>
                                    </asp:UpdatePanel>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label">Fix version</label>
                                <div class="col-sm-8">

                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="DropDownList6" runat="server" AppendDataBoundItems="true" class="form-control1" />
                                        </ContentTemplate>
                                      <%--  <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="DropDownList6" />
                                        </Triggers>--%>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <%-- <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label">Affect version</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DropDownList5" runat="server" class="form-control1">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label">Fix version</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DropDownList6" runat="server" class="form-control1">
                                    </asp:DropDownList>
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label">Assigne</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DropDownList7" runat="server" class="form-control1">
                                    </asp:DropDownList>

                                </div>
                            </div>
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label">Summary</label>
                                <div class="col-sm-8">
                                    <textarea id="TextArea1" cols="41" rows="5" runat="server"></textarea>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button1" class="btn btn-default" runat="server" Text="Save" OnClick="Button2_Click" />
                    <asp:Button ID="Button2" class="btn btn-default" runat="server" Text="Close" data-dismiss="modal" />
                </div>
            </div>
        </div>
    </div>

    <div id="deleteModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Delete issue</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        Are you sure you want to delete this issue?
                    </div>

                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button5" class="btn btn-default" runat="server" Text="Delete" CssClass="btn btn-info" />
                    <asp:Button ID="Button6" class="btn btn-default" runat="server" Text="Close" data-dismiss="modal" />
                </div>
            </div>

        </div>
    </div>

</asp:Content>
