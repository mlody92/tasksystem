<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="TaskSystem.Issues.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 class="blank1">Issue</h3>

    <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#editModal">Edit</button>

    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <div class="media">
        <div class="tab-pane active" id="horizontal-form">
            <div class="form-horizontal">
                <div class="form-group mb-n">
                    <label class="col-md-2 control-label">Project</label>
                    <div class="col-md-8">
                        <input id="Text1" runat="server" type="text" class="form-control1" placeholder="Readonly" readonly="" />
                    </div>
                </div>
                <div class="form-group mb-n">
                    <label class="col-md-2 control-label">Title</label>
                    <div class="col-md-8">
                        <input id="Text2" runat="server" type="text" class="form-control1" placeholder="Readonly" readonly="" />
                    </div>
                </div>
                <div class="form-group mb-n">
                    <label class="col-md-2 control-label">Status</label>
                    <div class="col-md-8">
                        <input id="Text3" runat="server" type="text" class="form-control1" placeholder="Readonly" readonly="" />
                    </div>
                </div>
                <div class="form-group mb-n">
                    <label class="col-md-2 control-label">Sprint</label>
                    <div class="col-md-8">
                        <input id="Text9" runat="server" type="text" class="form-control1" placeholder="Readonly" readonly="" />
                    </div>
                </div>
                <div class="form-group mb-n">
                    <label class="col-md-2 control-label">Assigne</label>
                    <div class="col-md-8">
                        <input id="Text4" runat="server" type="text" class="form-control1" placeholder="Readonly" readonly="" />
                    </div>
                </div>
                <div class="form-group mb-n">
                    <label class="col-md-2 control-label">Priority</label>
                    <div class="col-md-8">
                        <input id="Text5" runat="server" type="text" class="form-control1" placeholder="Readonly" readonly="" />
                    </div>
                </div>

                <div class="form-group mb-n">
                    <label class="col-md-2 control-label">Type</label>
                    <div class="col-md-8">
                        <input id="Text6" runat="server" type="text" class="form-control1" placeholder="Readonly" readonly="" />
                    </div>
                </div>
                <div class="form-group mb-n">
                    <label class="col-md-2 control-label">Description</label>
                    <div class="col-md-8">
                        <textarea class="form-control" id="TextArea1" cols="20" rows="10" runat="server"></textarea>
                    </div>
                </div>
                <div class="form-group mb-n">
                    <label class="col-md-2 control-label">Affect version</label>
                    <div class="col-md-8">
                        <input id="Text7" runat="server" type="text" class="form-control1" placeholder="" readonly="" />
                    </div>
                </div>
                <div class="form-group mb-n">
                    <label class="col-md-2 control-label">Fix version</label>
                    <div class="col-md-8">
                        <input id="Text8" runat="server" type="text" class="form-control1" placeholder="" readonly="" />
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">
                    <asp:Button ID="Button1" runat="server" Text="Powrót" class="btn-success btn" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
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
                                    <input id="Text10" type="text" runat="server" class="form-control1" />
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
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label">Status</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DropDownList8" AppendDataBoundItems="true" runat="server" class="form-control1">
                                        <asp:ListItem Text="Open" Value="open" />
                                        <asp:ListItem Text="In progress" Value="In progress" />
                                        <asp:ListItem Text="Code review" Value="Code review" />
                                        <asp:ListItem Text="Test" Value="Test" />
                                        <asp:ListItem Text="Closed" Value="Closed" />
                                        <asp:ListItem Text="Won't fix" Value="Won't fix" />
                                        <asp:ListItem Text="Duplicate" Value="Duplicate" />
                                    </asp:DropDownList>
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
                                    <textarea id="TextArea2" cols="41" rows="5" runat="server"></textarea>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button2" class="btn btn-default" runat="server" Text="Save" OnClick="Button2_Click" />
                    <asp:Button ID="Button3" class="btn btn-default" runat="server" Text="Close" data-dismiss="modal" />
                </div>
            </div>
        </div>
    </div>
    <asp:Label ID="Label2" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>
