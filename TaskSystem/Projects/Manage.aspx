<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="TaskSystem.Projects.Manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 class="blank1">Manage</h3>
    <div class="bs-example5" data-example-id="default-media">
        <div class="media">
            <div class="tab-pane active" id="horizontal-form">
                <div class="form-horizontal">
                    <div class="form-group mb-n">
                        <label class="col-md-2 control-label">Username</label>
                        <div class="col-md-8">
                            <input id="Text1" runat="server" type="text" class="form-control1" placeholder="Readonly" readonly="" />
                        </div>
                        <%--<div class="clearfix"></div>--%>
                    </div>
                    <div class="form-group">
                        <label for="focusedinput" class="col-sm-2 control-label">Fullname</label>
                        <div class="col-sm-8">
                            <input id="Text2" type="text" runat="server" class="form-control1" placeholder="Default Input" />
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
                            <input id="Text4" runat="server" type="text" class="form-control1" placeholder="Readonly" readonly="" />
                        </div>
                        <%--<div class="clearfix"></div>--%>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-2 control-label">Old Password</label>
                        <div class="col-sm-8">
                            <input id="Text5" type="password" class="form-control1" placeholder="Old Password" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-2 control-label">New Password</label>
                        <div class="col-sm-8">
                            <input id="Text6" type="password" class="form-control1" placeholder="New Password" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-2 control-label">Confirm New Password</label>
                        <div class="col-sm-8">
                            <input id="Text7" type="password" class="form-control1" placeholder="Confirm New Password" runat="server" />
                        </div>
                    </div>
                    <div class="but_list">
                        <div class="alert alert-success" role="alert" id="succesId" runat="server" visible="false">
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </div>
                        <div class="alert alert-danger" role="alert" id="errorId" runat="server" visible="false">
                            <asp:Label ID="Label2" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <div class="row">
                            <div class="col-sm-8 col-sm-offset-2">
                                <asp:Button ID="Button1" runat="server" Text="Submit" class="btn-success btn" />
                                <asp:Button ID="Button2" runat="server" Text="Cancel" class="btn-default btn" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>


</asp:Content>
