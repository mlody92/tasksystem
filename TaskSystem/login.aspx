<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TaskSystem.login" %>


<!DOCTYPE HTML>
<html>
<head>
<title>TaskSystem - Sing in </title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Easy Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<!-- lined-icons -->
<link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
<!-- //lined-icons -->
<!-- chart -->
<script src="js/Chart.js"></script>
<!-- //chart -->
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
	<script>
	    new WOW().init();
	</script>
<!--//end-animate-->
<!----webfonts--->
<link href='\fonts\yQOMOX5hR0-6LTD879t-PQ.woff2' rel='stylesheet' type='text/css'>
<!---//webfonts---> 
 <!-- Meters graphs -->
<script src="js/jquery-1.10.2.min.js"></script>
<!-- Placed js at the end of the document so the pages load faster -->

</head> 
   
 <body class="sign-in-up">
    <section>
			<div id="page-wrapper" class="sign-in-wrapper">
				<div class="graphs">
					<div class="sign-in-form">
						<div class="sign-in-form-top"></div>
						<div class="signin">
							<form runat="server">
							<div class="log-input">
								<div class="log-input-left">
                                   <asp:TextBox ID="TextBox1" runat="server" placeholder="Username" type="text" class="user" AutoCompleteType="Disabled"></asp:TextBox>
								</div>
								<div class="clearfix"> </div>
							</div>
							<div class="log-input">
								<div class="log-input-left">
                                   <asp:TextBox ID="TextBox2" runat="server" placeholder="Password" type="password" class="lock"></asp:TextBox>
								</div>
								<div class="clearfix"> </div>
                            <asp:Label ID="Label1" runat="server" Visible="false" ForeColor="Red"></asp:Label>
							</div>
                            <asp:Button ID="Button1" runat="server" Text="Login" type="submit" OnClick="Button1_Click"/>

						</form>	 
						</div>
					</div>
				</div>
			</div>
		<!--footer section start-->
			<footer>
			   <p>&copy 2015 Easy Admin Panel. All Rights Reserved | Design by <a href="https://w3layouts.com/" target="_blank">w3layouts.</a></p>
			</footer>
        <!--footer section end-->
	</section>
	
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
   <script src="js/bootstrap.min.js"></script>
</body>
</html>