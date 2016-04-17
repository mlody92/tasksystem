<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="TaskSystem.Users.Manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 class="blank1">Users</h3>

    <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#myModalUser">New</button>


    <div class="bs-example5" data-example-id="default-media">
        <div class="media">
            <div class="panel-body1">
                <asp:GridView ID="GridView1" runat="server" class="table table-striped" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="chk" runat="server"
                                    onclick="Check_Click(this)" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                        <asp:BoundField DataField="fullname" HeaderText="Fullname" SortExpression="fullname" />
                        <asp:BoundField DataField="role" HeaderText="Role" SortExpression="role" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:ButtonField CommandName="editRecord" Text="Edit" ItemStyle-Width="10px"/>
                        <asp:ButtonField CommandName="deleteRecord" Text="Delete" ItemStyle-Width="10px"/>
                        <%--<asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="buttonEdit" runat="server" CommandName="editRecord">LinkButton</asp:LinkButton>
                            </ItemTemplate>

                        </asp:TemplateField>--%>
                    </Columns>
                </asp:GridView>
                <asp:HiddenField ID="hfCount" runat="server" Value="0" />
                <%--<asp:Button ID="btnEdit"  data-toggle="modal" Text="Edit" data-target="#myModalEditUser"/>--%>

                <%--<asp:Button ID="btnDelete" runat="server" Text="Delete" data-target="#myModalUser" OnClick="btnDelete_Click" />--%>
                <%--<asp:Button ID="Button1" runat="server" Text="Delete Checked Records" OnClientClick="return ConfirmDelete();" OnClick="btnDelete_Click" />--%>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>


    <div id="myModalUser" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New user</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">


                        <div class="form-group mb-n">
                            <label class="col-md-2 control-label">Username</label>
                            <div class="col-md-8">
                                <input id="Text8" runat="server" type="text" class="form-control1" placeholder="Username" />
                            </div>
                            <%--<div class="clearfix"></div>--%>
                        </div>
                        <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Fullname</label>
                            <div class="col-sm-8">
                                <input id="Text9" type="text" runat="server" class="form-control1" placeholder="Fullname" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Email Address</label>
                            <div class="col-md-8">
                                <div class="input-group in-grp1" style="width: 100%; margin: 0 0 0 0;">
                                    <span class="input-group-addon">
                                        <i class="fa fa-envelope-o"></i>
                                    </span>
                                    <input id="Text10" type="text" class="form-control1" placeholder="Email Address" runat="server" />
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group mb-n">
                            <label class="col-md-2 control-label">Role</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control1"></asp:DropDownList>

                            </div>
                            <%--<div class="clearfix"></div>--%>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-8">
                                <input id="Password2" type="password" class="form-control1" placeholder="Password" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword" class="col-sm-2 control-label">Confirm Password</label>
                            <div class="col-sm-8">
                                <input id="Password3" type="password" class="form-control1" placeholder="Confirm Password" runat="server" />
                            </div>
                        </div>
                        <div class="but_list">
                            <div class="alert alert-success" role="alert" id="successId" runat="server" visible="false">
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </div>
                            <div class="alert alert-danger" role="alert" id="errorId" runat="server" visible="false">
                                <asp:Label ID="Label2" runat="server"></asp:Label>
                            </div>
                        </div>

                    </div>



                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button3" class="btn btn-default" runat="server" Text="Save" OnClick="Button1_Click" />
                    <asp:Button ID="Button4" class="btn btn-default" runat="server" Text="Close" data-dismiss="modal" />
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
                    <h4 class="modal-title">Edit user</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">


                        <div class="form-group mb-n">
                            <label class="col-md-2 control-label">Username</label>
                            <div class="col-md-8">
                                <input id="Text1" runat="server" type="text" class="form-control1" placeholder="Username" />
                            </div>
                            <%--<div class="clearfix"></div>--%>
                        </div>
                        <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Fullname</label>
                            <div class="col-sm-8">
                                <input id="Text2" type="text" runat="server" class="form-control1" placeholder="Fullname" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Email Address</label>
                            <div class="col-md-8">
                                <div class="input-group in-grp1" style="width: 100%; margin: 0 0 0 0;">
                                    <span class="input-group-addon">
                                        <i class="fa fa-envelope-o"></i>
                                    </span>
                                    <input id="Text3" type="text" class="form-control1" placeholder="Email Address" runat="server" />
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group mb-n">
                            <label class="col-md-2 control-label">Role</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="DropDownList2" runat="server" class="form-control1"></asp:DropDownList>

                            </div>
                            <%--<div class="clearfix"></div>--%>
                        </div>
                        <div class="but_list">
                            <div class="alert alert-success" role="alert" id="Div2" runat="server" visible="false">
                                <asp:Label ID="Label3" runat="server"></asp:Label>
                            </div>
                            <div class="alert alert-danger" role="alert" id="Div3" runat="server" visible="false">
                                <asp:Label ID="Label4" runat="server"></asp:Label>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button1" class="btn btn-default" runat="server" Text="Save" OnClick="Button2_Click"/>
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
                    <h4 class="modal-title">Delete user</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        Are you sure you want to delete the record?
                    </div>

                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnDelete" class="btn btn-default" runat="server" Text="Delete" CssClass="btn btn-info" OnClick="btnDelete_Click"/>
                    <asp:Button ID="Button6" class="btn btn-default" runat="server" Text="Close" data-dismiss="modal" />
                </div>
            </div>

        </div>
    </div>



</asp:Content>

