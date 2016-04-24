<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Version.aspx.cs" Inherits="TaskSystem.Projects.Version" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <h3 class="blank1">Project version</h3>

    <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#newModal">New</button>

    
    <div class="bs-example5" data-example-id="default-media">
        <div class="media">
            Project: <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <div class="panel-body1">
                Open version:
                <asp:GridView ID="GridView1" runat="server" class="table table-striped" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="false" />
                        <asp:BoundField DataField="version" HeaderText="Version" SortExpression="version" />
                        <asp:ButtonField CommandName="releaseRecord" Text="Release" ItemStyle-Width="10px" />
                        <asp:ButtonField CommandName="editRecord" Text="Edit" ItemStyle-Width="10px" />
                        <asp:ButtonField CommandName="deleteRecord" Text="Delete" ItemStyle-Width="10px" />
                    </Columns>
                </asp:GridView>
                <asp:HiddenField ID="hfCount" runat="server" Value="0" />
            
                Released version:
                <asp:GridView ID="GridView2" runat="server" class="table table-striped" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="GridView2_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="false"/>
                        <asp:BoundField DataField="version" HeaderText="Version" SortExpression="version" />
                        <asp:ButtonField CommandName="openRecord" Text="Open" ItemStyle-Width="10px" />
                    </Columns>
                </asp:GridView>
                <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
            </div>
        </div>
        <div class="clearfix"></div>
    </div>


    <div id="newModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New version</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group mb-n">
                            <label class="col-md-2 control-label">Verion</label>
                            <div class="col-md-8">
                                <input id="Text1" runat="server" type="text" class="form-control1" placeholder="Version" />
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
                    <h4 class="modal-title">Edit version</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group mb-n">
                            <label class="col-md-2 control-label">Version</label>
                            <div class="col-md-8">
                                <input id="Text2" runat="server" type="text" class="form-control1" />
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
                    <h4 class="modal-title">Delete version</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        Are you sure you want to delete this version?
                    </div>

                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button5" class="btn btn-default" runat="server" Text="Delete" CssClass="btn btn-info" OnClick="btnDelete_Click"/>
                    <asp:Button ID="Button6" class="btn btn-default" runat="server" Text="Close" data-dismiss="modal" />
                </div>
            </div>

        </div>
    </div>

    <div id="openModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Open version</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        Are you sure you want to open this version?
                    </div>

                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button7" class="btn btn-default" runat="server" Text="Confirm" CssClass="btn btn-info" OnClick="btnOpen_Click"/>
                    <asp:Button ID="Button8" class="btn btn-default" runat="server" Text="Close" data-dismiss="modal" />
                </div>
            </div>

        </div>
    </div>

    <div id="releaseModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Release version</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        Are you sure you want to release this version?
                    </div>

                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button9" class="btn btn-default" runat="server" Text="Confirm" CssClass="btn btn-info" OnClick="btnRelease_Click"/>
                    <asp:Button ID="Button10" class="btn btn-default" runat="server" Text="Close" data-dismiss="modal" />
                </div>
            </div>

        </div>
    </div>

</asp:Content>
