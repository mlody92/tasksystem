<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="TaskSystem.Projects.Manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 class="blank1">Projects</h3>

    <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#myModalProject">New</button>


    <div class="bs-example5" data-example-id="default-media">
        <div class="media">
            <div class="panel-body1">
                <asp:GridView ID="GridView1" runat="server" class="table table-striped" AutoGenerateColumns="False" DataKeyNames="id">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="10px">
                            <ItemTemplate>
                                <asp:CheckBox ID="chk" runat="server"
                                    onclick="Check_Click(this)" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="project" HeaderText="Project" SortExpression="project" />
                    </Columns>
                </asp:GridView>
                <asp:HiddenField ID="hfCount" runat="server" Value="0" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
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
</asp:Content>
