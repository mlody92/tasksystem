﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="TaskSystem.Projects.Manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 class="blank1">Projects</h3>

    <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#myModalProject">New</button>


    <div class="bs-example5" data-example-id="default-media">
        <div class="media">
            <div class="panel-body1">
                <asp:GridView ID="GridView1" runat="server" class="table table-striped" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                        <asp:BoundField DataField="project" HeaderText="Project" SortExpression="project" />
                        <asp:BoundField DataField="short" HeaderText="Short" SortExpression="short" />
                        <asp:ButtonField CommandName="versionRecord" Text="Version" ItemStyle-Width="10px" />
                        <asp:ButtonField CommandName="editRecord" Text="Edit" ItemStyle-Width="10px" />
                        <asp:ButtonField CommandName="deleteRecord" Text="Delete" ItemStyle-Width="10px" />
                    </Columns>
                </asp:GridView>
                <asp:HiddenField ID="hfCount" runat="server" Value="0" />
            </div>
        </div>
        <div class="clearfix"></div>
    </div>


    <div id="myModalProject" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New project</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group mb-n">
                            <label class="col-md-2 control-label">Project name</label>
                            <div class="col-md-8">
                                <input id="Text1" runat="server" type="text" class="form-control1" placeholder="Project name" />
                            </div>
                        </div>
                        <div class="form-group mb-n">
                            <label class="col-md-2 control-label">Short name</label>
                            <div class="col-md-8">
                                <input id="Text3" runat="server" type="text" class="form-control1" placeholder="Short name" />
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

     <div id="editProject" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit project</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group mb-n">
                            <label class="col-md-2 control-label">Project name</label>
                            <div class="col-md-8">
                                <input id="Text2" runat="server" type="text" class="form-control1" />
                            </div>
                        </div>
                         <div class="form-group mb-n">
                            <label class="col-md-2 control-label">Short name</label>
                            <div class="col-md-8">
                                <input id="Text4" runat="server" type="text" class="form-control1" placeholder="Short name" />
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
                    <h4 class="modal-title">Delete project</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        Are you sure you want to delete this project?
                    </div>

                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button5" class="btn btn-default" runat="server" Text="Delete" CssClass="btn btn-info" OnClick="btnDelete_Click"/>
                    <asp:Button ID="Button6" class="btn btn-default" runat="server" Text="Close" data-dismiss="modal" />
                </div>
            </div>

        </div>
    </div>
</asp:Content>
