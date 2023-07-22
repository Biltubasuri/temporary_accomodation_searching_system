<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="user_login" %>
<html>
<head>
    <title>Users login</title>
    <link rel="stylesheet" href="css/loginstyle.css"/>
</head>
<body class="back" background="images/background3.jpg">
  <div class="container">
  <form id="form1" runat="server">
    <div class="content">
      <div class="left-side">
        
        <img class="image" src="images/loginbackground.webp"/>
      </div>
      <div class="right-side">
        <div class="topic-text">WELCOME BACK,</div>
        <p>Let's resume your journey.</p>
      <form action="#">
        <div class="input-box">
          <asp:TextBox ID="txtaadhaarno" runat="server" type="text" placeholder="Enter your aadhaar No."></asp:TextBox>
          
        </div>
        <div class="input-box">
          <asp:TextBox ID="txtpassword" runat="server" type="password" placeholder="Enter your Password"></asp:TextBox>
        </div>
        <asp:Label ID="lblresponse" runat="server" ForeColor="#CC3300"></asp:Label>
        <div>
        <p>Not a member?<a href="registration.aspx">Register with us.</a></p>
        <a href="forgetpassword.aspx">Forgot your password?</a>
        </div>
        <div>
          <asp:Button ID="btnlogin" class="button" runat="server" Text="Log In" 
                onclick="btnlogin_Click" />
        </div>
      </form>
    </div>
    </div>
    </form>
  </div>
</body>
</html>
