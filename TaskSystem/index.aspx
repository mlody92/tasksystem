﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TaskSystem.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="switches">
        <div class="col-4">
            <div class="col-md-4 switch-right">
                <div class="switch-right-grid">
                    <div class="switch-right-grid1">
                        <h3>AVAILABLE PROJECTS:</h3>
                        <ul>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <li>
                                        <asp:Label runat="server" ID="lblResp"><%#Eval("project") %></asp:Label><li />
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [project] FROM [project] ORDER BY [project]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <div class="col-md-4 switch-right">
                <div class="switch-right-grid">
                    <div class="switch-right-grid1">
                        <h3>10 LAST MY ISSUES:</h3>
                        <ul>
                            <asp:ListView ID="ListView2" runat="server">
                                <ItemTemplate>
                                    <%--<li><asp:Label runat="server" ID="lblResp"><%#Eval("short")+"-"+Eval("issueIndex")+" "+Eval("title") %> </asp:Label><li />--%>
                                    <%--<li> <asp:LinkButton ID="LinkButton1" runat="server" CommandName="view" Text='<%#Eval("short")+"-"+Eval("issueIndex")+" "+Eval("title") %>' OnClick="Button1_Click"/>--%>
                                    <li>
                                        <asp:HyperLink ID="hpLinkSurname" runat="server" NavigateUrl='<%# "~/Issues/View.aspx?" + Eval("short")+"-"+Eval("issueIndex") %>' Text='<%#Eval("short")+"-"+Eval("issueIndex")+" "+Eval("title") %>' />
                                    </li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>

                    </div>
                </div>

            </div>
            <div class="col-md-4 switch-right">
                <div class="switch-right-grid">
                    <div class="switch-right-grid1">
                        <h3>10 LAST ISSUES</h3>
                       <ul>
                            <asp:ListView ID="ListView3" runat="server">
                                <ItemTemplate>
                                    <%--<li><asp:Label runat="server" ID="lblResp"><%#Eval("short")+"-"+Eval("issueIndex")+" "+Eval("title") %> </asp:Label><li />--%>
                                    <%--<li> <asp:LinkButton ID="LinkButton1" runat="server" CommandName="view" Text='<%#Eval("short")+"-"+Eval("issueIndex")+" "+Eval("title") %>' OnClick="Button1_Click"/>--%>
                                    <li>
                                        <asp:HyperLink ID="hpLinkSurname" runat="server" NavigateUrl='<%# "~/Issues/View.aspx?" + Eval("short")+"-"+Eval("issueIndex") %>' Text='<%#Eval("short")+"-"+Eval("issueIndex")+" "+Eval("title") %>' />
                                    </li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <%--/////--%>

    <div class="graph_box1" style="padding: 1em 0 1em 0;">
        <div class="col-md-6 grid_2 grid_2_bot">
            <div class="grid_1">
                <h4>Issues in open sprints</h4>
                <div class="legend">
                    <div id="os-Win-lbl">Open
                        <asp:Label ID="Label1" runat="server" Text="100%"></asp:Label></div>
                    <div id="os-Mac-lbl">In progress
                        <asp:Label ID="Label2" runat="server" Text="100%"></asp:Label></div>
                    <div id="os-Other-lbl">Code review
                        <asp:Label ID="Label3" runat="server" Text="100%"></asp:Label></div>
                    <div id="os-1-lbl">Test
                        <asp:Label ID="Label4" runat="server" Text="100%"></asp:Label></div>
                    <div id="os-2-lbl">Closed
                        <asp:Label ID="Label5" runat="server" Text="100%"></asp:Label></div>
                    <div id="os-3-lbl">Won't fix
                        <asp:Label ID="Label6" runat="server" Text="100%"></asp:Label></div>
                    <div id="os-4-lbl">Duplicate
                        <asp:Label ID="Label7" runat="server" Text="100%"></asp:Label></div>
                </div>

                <canvas id="pie" height="315" width="470" style="width: 470px; height: 315px;"></canvas>

            </div>

        </div>
        <div class="col-md-6 grid_2 grid_2_bot">
            <div class="grid_1">
                <h4>Issues in active sprint</h4>
                <div class="legend">
                    <div id="os-Win-lbl" class="os-Win-lbl">Open
                        <asp:Label ID="Label8" runat="server" Text="100%"></asp:Label></div>
                    <div id="os-Mac-lbl">In progress
                        <asp:Label ID="Label9" runat="server" Text="100%"></asp:Label></div>
                    <div id="os-Other-lbl">Code review
                        <asp:Label ID="Label10" runat="server" Text="100%"></asp:Label></div>
                    <div id="os-1-lbl">Test
                        <asp:Label ID="Label11" runat="server" Text="100%"></asp:Label></div>
                    <div id="os-2-lbl">Closed
                        <asp:Label ID="Label12" runat="server" Text="100%"></asp:Label></div>
                    <div id="os-3-lbl">Won't fix
                        <asp:Label ID="Label13" runat="server" Text="100%"></asp:Label></div>
                    <div id="os-4-lbl">Duplicate
                        <asp:Label ID="Label14" runat="server" Text="100%"></asp:Label></div>
                </div>

                <canvas id="pie2" height="235" width="390" style="width: 390px; height: 235px;"></canvas>

            </div>

        </div>
        <div class="clearfix"></div>
    </div>

    <%--/////--%>


<%--
    <div class="col_3">
        <div class="col-md-3 widget widget1">
            <div class="r3_counter_box">
                <i class="fa fa-mail-forward"></i>
                <div class="stats">
                    <h5>45 <span>%</span></h5>

                    <div class="grow">
                        <p>Growth</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 widget widget1">
            <div class="r3_counter_box">
                <i class="fa fa-users"></i>
                <div class="stats">
                    <h5>50 <span>%</span></h5>
                    <div class="grow grow1">
                        <p>New Users</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 widget widget1">
            <div class="r3_counter_box">
                <i class="fa fa-eye"></i>
                <div class="stats">
                    <h5>70 <span>%</span></h5>
                    <div class="grow grow3">
                        <p>Visitors</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 widget">
            <div class="r3_counter_box">
                <i class="fa fa-usd"></i>
                <div class="stats">
                    <h5>70 <span>%</span></h5>
                    <div class="grow grow2">
                        <p>Profit</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>

    <!-- switches -->
    <div class="switches">
        <div class="col-4">
            <div class="col-md-4 switch-right">
                <div class="switch-right-grid">
                    <div class="switch-right-grid1">
                        <h3>TODAY'S STATS</h3>
                        <p>Duis aute irure dolor in reprehenderit.</p>
                        <ul>
                            <li>Earning: $400 USD</li>
                            <li>Items Sold: 20 Items</li>
                            <li>Last Hour Sales: $34 USD</li>
                        </ul>
                    </div>
                </div>
                <div class="sparkline">
                    <canvas id="line" height="150" width="480" style="width: 480px; height: 150px;"></canvas>
                    <script>
                        var lineChartData = {
                            labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Mon"],
                            datasets: [
                                {
                                    fillColor: "#fff",
                                    strokeColor: "#F44336",
                                    pointColor: "#fbfbfb",
                                    pointStrokeColor: "#F44336",
                                    data: [20, 35, 45, 30, 10, 65, 40]
                                }
                            ]

                        };
                        new Chart(document.getElementById("line").getContext("2d")).Line(lineChartData);
                    </script>
                </div>
            </div>
            <div class="col-md-4 switch-right">
                <div class="switch-right-grid">
                    <div class="switch-right-grid1">
                        <h3>MONTHLY STATS</h3>
                        <p>Duis aute irure dolor in reprehenderit.</p>
                        <ul>
                            <li>Earning: $5,000 USD</li>
                            <li>Items Sold: 400 Items</li>
                            <li>Last Hour Sales: $2,434 USD</li>
                        </ul>
                    </div>
                </div>
                <div class="sparkline">
                    <canvas id="bar" height="150" width="480" style="width: 480px; height: 150px;"></canvas>
                    <script>
                        var barChartData = {
                            labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Mon", "Tue", "Wed", "Thu"],
                            datasets: [
                                {
                                    fillColor: "#8BC34A",
                                    strokeColor: "#8BC34A",
                                    data: [25, 40, 50, 65, 55, 30, 20, 10, 6, 4]
                                },
                                {
                                    fillColor: "#8BC34A",
                                    strokeColor: "#8BC34A",
                                    data: [30, 45, 55, 70, 40, 25, 15, 8, 5, 2]
                                }
                            ]

                        };
                        new Chart(document.getElementById("bar").getContext("2d")).Bar(barChartData);
                    </script>
                </div>
            </div>
            <div class="col-md-4 switch-right">
                <div class="switch-right-grid">
                    <div class="switch-right-grid1">
                        <h3>ALLTIME STATS</h3>
                        <p>Duis aute irure dolor in reprehenderit.</p>
                        <ul>
                            <li>Earning: $80,000 USD</li>
                            <li>Items Sold: 8,000 Items</li>
                            <li>Last Hour Sales: $75,434 USD</li>
                        </ul>
                    </div>
                </div>
                <div class="sparkline">
                    <!--graph-->
                    <link rel="stylesheet" href="/css/graph.css">
                    <script src="/js/jquery.flot.min.js"></script>
                    <!--//graph-->
                    <script>
                        $(document).ready(function () {

                            // Graph Data ##############################################
                            var graphData = [{
                                // Returning Visits
                                data: [[4, 4500], [5, 3500], [6, 6550], [7, 7600], [8, 4500], [9, 3500], [10, 6550], ],
                                color: '#FFCA28',
                                points: { radius: 7, fillColor: '#fff' }
                            }
                            ];

                            // Lines Graph #############################################
                            $.plot($('#graph-lines'), graphData, {
                                series: {
                                    points: {
                                        show: true,
                                        radius: 1
                                    },
                                    lines: {
                                        show: true
                                    },
                                    shadowSize: 0
                                },
                                grid: {
                                    color: '#fff',
                                    borderColor: 'transparent',
                                    borderWidth: 10,
                                    hoverable: true
                                },
                                xaxis: {
                                    tickColor: 'transparent',
                                    tickDecimals: false
                                },
                                yaxis: {
                                    tickSize: 1200
                                }
                            });

                            // Graph Toggle ############################################
                            $('#graph-bars').hide();

                            $('#lines').on('click', function (e) {
                                $('#bars').removeClass('active');
                                $('#graph-bars').fadeOut();
                                $(this).addClass('active');
                                $('#graph-lines').fadeIn();
                                e.preventDefault();
                            });

                            $('#bars').on('click', function (e) {
                                $('#lines').removeClass('active');
                                $('#graph-lines').fadeOut();
                                $(this).addClass('active');
                                $('#graph-bars').fadeIn().removeClass('hidden');
                                e.preventDefault();
                            });

                        });
                    </script>
                    <div id="graph-wrapper">
                        <div class="graph-container">
                            <div id="graph-lines"></div>
                            <div id="graph-bars"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- //switches -->
    <div class="col_1">
        <div class="col-md-4 span_8">
            <div class="activity_box">
                <h3>Inbox</h3>
                <div class="scrollbar scrollbar1" id="style-2">
                    <div class="activity-row">
                        <div class="col-xs-3 activity-img">
                            <img src='/images/1.png' class="img-responsive" alt="" />
                        </div>
                        <div class="col-xs-7 activity-desc">
                            <h5><a href="#">John Smith</a></h5>
                            <p>Hey ! There I'm available.</p>
                        </div>
                        <div class="col-xs-2 activity-desc1">
                            <h6>13:40 PM</h6>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="activity-row">
                        <div class="col-xs-3 activity-img">
                            <img src='/images/5.png' class="img-responsive" alt="" />
                        </div>
                        <div class="col-xs-7 activity-desc">
                            <h5><a href="#">Andrew Jos</a></h5>
                            <p>Hey ! There I'm available.</p>
                        </div>
                        <div class="col-xs-2 activity-desc1">
                            <h6>13:40 PM</h6>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="activity-row">
                        <div class="col-xs-3 activity-img">
                            <img src='/images/3.png' class="img-responsive" alt="" />
                        </div>
                        <div class="col-xs-7 activity-desc">
                            <h5><a href="#">Adom Smith</a></h5>
                            <p>Hey ! There I'm available.</p>
                        </div>
                        <div class="col-xs-2 activity-desc1">
                            <h6>13:40 PM</h6>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="activity-row">
                        <div class="col-xs-3 activity-img">
                            <img src='/images/4.png' class="img-responsive" alt="" />
                        </div>
                        <div class="col-xs-7 activity-desc">
                            <h5><a href="#">Peter Carl</a></h5>
                            <p>Hey ! There I'm available.</p>
                        </div>
                        <div class="col-xs-2 activity-desc1">
                            <h6>13:40 PM</h6>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="activity-row">
                        <div class="col-xs-3 activity-img">
                            <img src='/images/1.png' class="img-responsive" alt="" />
                        </div>
                        <div class="col-xs-7 activity-desc">
                            <h5><a href="#">John Smith</a></h5>
                            <p>Hey ! There I'm available.</p>
                        </div>
                        <div class="col-xs-2 activity-desc1">
                            <h6>13:40 PM</h6>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 span_8">
            <div class="activity_box activity_box1">
                <h3>chat</h3>
                <div class="scrollbar" id="Div1">
                    <div class="activity-row activity-row1">
                        <div class="col-xs-3 activity-img">
                            <img src='/images/1.png' class="img-responsive" alt="" /><span>10:00 PM</span>
                        </div>
                        <div class="col-xs-5 activity-img1">
                            <div class="activity-desc-sub">
                                <h5>John Smith</h5>
                                <p>Hello !</p>
                            </div>
                        </div>
                        <div class="col-xs-4 activity-desc1"></div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="activity-row activity-row1">
                        <div class="col-xs-2 activity-desc1"></div>
                        <div class="col-xs-7 activity-img2">
                            <div class="activity-desc-sub1">
                                <h5>Adom Smith</h5>
                                <p>Hi,How are you ? What about our next meeting?</p>
                            </div>
                        </div>
                        <div class="col-xs-3 activity-img">
                            <img src='/images/3.png' class="img-responsive" alt="" /><span>10:02 PM</span>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="activity-row activity-row1">
                        <div class="col-xs-3 activity-img">
                            <img src='/images/1.png' class="img-responsive" alt="" /><span>10:00 PM</span>
                        </div>
                        <div class="col-xs-5 activity-img1">
                            <div class="activity-desc-sub">
                                <h5>John Smith</h5>
                                <p>Yeah fine</p>
                            </div>
                        </div>
                        <div class="col-xs-4 activity-desc1"></div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="activity-row activity-row1">
                        <div class="col-xs-2 activity-desc1"></div>
                        <div class="col-xs-7 activity-img2">
                            <div class="activity-desc-sub1">
                                <h5>Adom Smith</h5>
                                <p>Wow that's great</p>
                            </div>
                        </div>
                        <div class="col-xs-3 activity-img">
                            <img src='/images/3.png' class="img-responsive" alt="" /><span>10:02 PM</span>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <form>
                    <input type="text" value="Enter your text" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter your text';}" required="">
                    <input type="submit" value="Send" required="" />
                </form>
            </div>
        </div>
        <div class="col-md-4 span_8">
            <div class="activity_box activity_box2">
                <h3>todo</h3>
                <div class="scrollbar" id="Div2">
                    <div class="activity-row activity-row1">
                        <div class="single-bottom">
                            <ul>
                                <li>
                                    <input type="checkbox" id="brand" value="">
                                    <label for="brand"><span></span>Sunt in culpa qui officia.</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="brand1" value="">
                                    <label for="brand1"><span></span>Fugiat quo voluptas nulla.</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="brand2" value="">
                                    <label for="brand2"><span></span>Dolorem eum.</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="brand9" value="">
                                    <label for="brand9"><span></span>Pain that produces no resultant.</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="brand8" value="">
                                    <label for="brand8"><span></span>Cupidatat non proident.</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="brand7" value="">
                                    <label for="brand7"><span></span>Praising pain was born.</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="brand3" value="">
                                    <label for="brand3"><span></span>Computer & Electronics</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="brand4" value="">
                                    <label for="brand4"><span></span>Dolorem ipsum quia.</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="brand5" value="">
                                    <label for="brand5"><span></span>Consequatur aut perferendis.</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="brand6" value="">
                                    <label for="brand6"><span></span>Dolorem ipsum quia.</label>
                                </li>


                            </ul>
                        </div>
                    </div>
                </div>
                <form>
                    <input type="text" value="Enter your text" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter your text';}" required="">
                    <input type="submit" value="Submit" required="" />
                </form>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>

    </div>--%>


</asp:Content>
