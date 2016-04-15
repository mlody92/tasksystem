<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="issues.aspx.cs" Inherits="TaskSystem.issues" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.24/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://code.jquery.com/ui/1.8.24/themes/blitzer/jquery-ui.css" rel="stylesheet"
        type="text/css" />
    
    <script type="text/javascript">
        $(function () {
            $("#dvSource img").draggable({
                revert: "invalid",
                refreshPositions: true,
                drag: function (event, ui) {
                    ui.helper.addClass("draggable");
                },
                stop: function (event, ui) {
                    ui.helper.removeClass("draggable");
                    var image = this.src.split("/")[this.src.split("/").length - 1];
                    if ($.ui.ddmanager.drop(ui.helper.data("draggable"), event)) {
                        alert(image + " dropped.");
                    }
                    else {
                        alert(image + " not dropped.");
                    }
                }
            });
            $("#dvDest").droppable({
                drop: function (event, ui) {
                    if ($("#dvDest img").length == 0) {
                        $("#dvDest").html("");
                    }
                    ui.draggable.addClass("dropped");
                    $("#dvDest").append(ui.draggable);
                }
            });
        });
    </script>
    <div class="bs-example5" data-example-id="default-media">
        <div class="media">
            <div class="panel-body1">
    <div id="dvSource">
        <img alt="" src="images/Chrysanthemum.jpg" />
        <img alt="" src="images/Desert.jpg" />
        <img alt="" src="images/Hydrangeas.jpg" />
        <img alt="" src="images/Jellyfish.jpg" />
        <img alt="" src="images/Koala.jpg" />
        <img alt="" src="images/Lighthouse.jpg" />
        <img alt="" src="images/Penguins.jpg" />
        <img alt="" src="images/Tulips.jpg" />
    </div>
    <hr />
    <div id="dvDest">
        Drop here
    </div>
                </div></div></div>


</asp:Content>
