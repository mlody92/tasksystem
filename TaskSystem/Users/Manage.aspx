<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="TaskSystem.Users.Manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 class="blank1">Users</h3>

    <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#myModal">New</button>


    <div class="bs-example5" data-example-id="default-media">
        <div class="media">
            <div class="panel-body1">
                <asp:GridView ID="GridView1" runat="server" class="table table-striped" AutoGenerateColumns="False" DataKeyNames="id">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAll" runat="server"
                                    onclick="checkAll(this);" />
                            </HeaderTemplate>
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
                    </Columns>
                </asp:GridView>
                <asp:HiddenField ID="hfCount" runat="server" Value="0" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete Checked Records" OnClientClick="return ConfirmDelete();" OnClick="btnDelete_Click" />

                <%--<table class="table table-striped">
						 <thead>
							<tr>
							  <th>#</th>
							  <th>First Name</th>
							  <th>Last Name</th>
							  <th>Username</th>
							</tr>
						  </thead>
						  <tbody>
							<tr>
							  <th scope="row">1</th>
							  <td>Mark</td>
							  <td>Otto</td>
							  <td>@mdo</td>
							</tr>
							<tr>
							  <th scope="row">2</th>
							  <td>Jacob</td>
							  <td>Thornton</td>
							  <td>@fat</td>
							</tr>
							<tr>
							  <th scope="row">3</th>
							  <td>Larry</td>
							  <td>the Bird</td>
							  <td>@twitter</td>
							</tr>
						  </tbody>
						</table>--%>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>


    <div id="myModal" class="modal fade" role="dialog">
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

    <script type="text/javascript">
        function ConfirmDelete() {
            var count = document.getElementById("<%=hfCount.ClientID %>").value;
            var gv = document.getElementById("<%=GridView1.ClientID%>");
            var chk = gv.getElementsByTagName("input");
            for (var i = 0; i < chk.length; i++) {
                if (chk[i].checked && chk[i].id.indexOf("chkAll") == -1) {
                    count++;
                }
            }
            if (count == 0) {
                swal("No records to delete.");
                return false;
            }
            else {
                swal({
                    title: "Are you sure?",
                    text: "Do you want to delete " + count + " records.",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Yes, delete it!",
                    closeOnConfirm: true
                }, function (isConfirm) {
                    if (isConfirm) {
                        var pageId = '<%=  Page.ClientID %>';
                        __doPostBack(pageId, argumentString);
                    }
                });
            }
        }
    </script>

    <%--    <script type = "text/javascript">
        function ConfirmDelete() {
            var count = document.getElementById("<%=hfCount.ClientID %>").value;
        var gv = document.getElementById("<%=GridView1.ClientID%>");
        var chk = gv.getElementsByTagName("input");
        for (var i = 0; i < chk.length; i++) {
            if (chk[i].checked && chk[i].id.indexOf("chkAll") == -1) {
                count++;
            }
        }
        if (count == 0) {
            alert("No records to delete.");
            return false;
        }
        else {
            return confirm("Do you want to delete " + count + " records.");
        }
    }
</script>--%>
</asp:Content>

