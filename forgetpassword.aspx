<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgetpassword.aspx.cs" Inherits="forget_password_forgetpassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Forget Password</title>
    <link rel="stylesheet" href="css/forgetpasswordstyle.css"/>
</head>
<body class="back" background="images/forgot-password-concept-illustration_114360-1095.webp">
  <div class="container">
  <form id="form1" runat="server">
    <div class="content">
      <div class="left-side">
        
        <img class="image" src="images/Forgot password Customizable Cartoon Illustrations _ Bro Style.jpg"/>
      </div>
      <div class="right-side">
        <div class="topic-text">CAN'T REMEMBER PASSWORD,</div>
        <p>Don't worry,you can check your password from here.</p>
        <asp:Label ID="lblresponse" runat="server" ForeColor="Crimson" ></asp:Label>
        <div class="input-box">
          <asp:TextBox ID="txtname" runat="server" type="text" placeholder="Enter your name"></asp:TextBox>
        </div>
        <div class="input-box">
          <asp:TextBox ID="txtmail" runat="server" type="text" placeholder="Enter your mail"></asp:TextBox>
        </div>
        <div class="input-box">
          <asp:TextBox ID="txtphone" runat="server" type="text" placeholder="Enter your PH No."></asp:TextBox>
        </div>
        <div class="input-box">
          <asp:TextBox ID="txtaadhaarno" runat="server" type="text" placeholder="Enter your Addhaar no."></asp:TextBox>
        </div>
        <div class="input-box">
          <asp:DropDownList CssClass="input-box" ID="txtque" runat="server" type="text" placeholder="Enter your security question">
              <asp:ListItem>What is your mother name ?</asp:ListItem>
              <asp:ListItem>What is your pet name ?</asp:ListItem>
              <asp:ListItem>What is your nickname ?</asp:ListItem>
              <asp:ListItem>What is your 10th board exam score ?</asp:ListItem>
              <asp:ListItem>What is your favourite dish ?</asp:ListItem>
              <asp:ListItem>What is your favourite shopping app ?</asp:ListItem>
          </asp:DropDownList>
        </div>
        <br />
        <div class="input-box">
          <asp:TextBox ID="txtans" runat="server" type="text" placeholder="Enter the answer"></asp:TextBox>
        </div>
        <div class="input-box">
          <asp:Image ID="imagecaptcha" runat="server" class="captcha" ImageUrl="~/user/generatecaptcha.aspx"></asp:Image>
          <asp:TextBox ID="txtcaptcha" runat="server" type="text" placeholder="Enter the captcha"></asp:TextBox>
        </div>
        <br />
        <br />
        <br />
        <br />
        <div>
        <p>Not a member?<a href="registration.aspx">Register with us.</a></p>
        <p>Already have an account?<a href="login.aspx">Let's Login In</a>.</p>
        </div>
        <div>
          <asp:Button ID="btnshow" class="button" runat="server" Text="Show" 
                onclick="btnshow_Click"/>
        </div>
    </div>
    </div>
    </form>
  </div>
</body>
</html>
