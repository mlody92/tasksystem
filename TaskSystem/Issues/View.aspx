<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="TaskSystem.Issues.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 class="blank1">Issue</h3>

    <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#newModal">Edit</button>

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
                        <input id="Text7" runat="server" type="text" class="form-control1" placeholder="Readonly" readonly="" />
                    </div>
                </div>
                 <div class="form-group mb-n">
                    <label class="col-md-2 control-label">Fix version</label>
                    <div class="col-md-8">
                        <input id="Text8" runat="server" type="text" class="form-control1" placeholder="Readonly" readonly="" />
                    </div>
                </div>
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
</asp:Content>
