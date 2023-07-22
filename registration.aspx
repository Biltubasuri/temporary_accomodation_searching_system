<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="user_registration" %>
<html>
<head runat="server">
    <title>Users Registration</title>
    <link rel="stylesheet" href="css/registrationstyle.css"/>
</head>
<body class="back" background="images/background2.jpg">
  <div class="container">
  <form id="form1" runat="server">
    <div class="content">
      <div class="left-side">

        <img class="image" src="images/registrationbackground.webp"/>
      </div>
      <div class="right-side">
        <div class="topic-text">WELCOME,</div>
        <p>Are you raedy to join with us?</p>
        <asp:label id="lblerror" runat="server" ForeColor="#CC3300"></asp:label>
      <form action="#">
        <div class="input-box">
          <asp:TextBox ID="txtname" runat="server" type="text" placeholder="Enter your name"></asp:TextBox>
        </div>
        <div class="input-box">
          <asp:TextBox ID="txtemail" runat="server" type="text" placeholder="Enter your email"></asp:TextBox>
        </div>
        <div class="input-box"> 
          <asp:TextBox ID="txtphno" runat="server" type="text" placeholder="Enter your PH No."></asp:TextBox>
        </div>
        <div class="input-box">
          <asp:TextBox ID="txtpassword" runat="server" type="password" placeholder="Enter your Password"></asp:TextBox>
        </div>
        <div class="input-box">
          <asp:TextBox ID="txtconfirmpassword" runat="server" type="password" placeholder="Confirm your Password"></asp:TextBox>
        </div>
        <div class="input-box">
          <asp:TextBox ID="txtaddharno" runat="server" type="text" placeholder="Enter your Aadhaar No."></asp:TextBox>
        </div>
        <div class="input-box">
          <asp:DropDownList CssClass="input-box" ID="txtque" runat="server" type="text" placeholder="Enter a security question for recover your password">
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
          <asp:TextBox ID="txtans" runat="server" type="text" placeholder="Enter the answer of your security question"></asp:TextBox>
        </div>
        <div class="input-box">
          <asp:TextBox ID="txtfathername" runat="server" type="text" placeholder="Enter your Father's name(optional)"></asp:TextBox>
        </div>
        <div class="input-box">
          <asp:TextBox ID="txtaddress" runat="server" type="text" placeholder="Enter your Address(optional)"></asp:TextBox>
        </div>
        <div class="input-box">
          <asp:TextBox ID="txtpin" runat="server" type="text" placeholder="Enter your Pin(optional)"></asp:TextBox>
        </div>
        <div class="input-box">
          <asp:Image ID="imagecaptcha" runat="server" class="captcha" ImageUrl="~/user/generatecaptcha.aspx"></asp:Image>
          <asp:TextBox ID="txtcaptcha" runat="server" type="text" placeholder="Enter the captcha"></asp:TextBox>
        </div>
        <br />
        <br />
        <br />
        <div>
        <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

        <p>Already have an account?<a href="login.aspx">Let's Login In</a>.</p>
        </div>
        <div>
          <asp:Button id="btnsubmit" class="button" runat="server" text="Submit" 
                onclick="btnsubmit_Click" />
        </div>
      </form>
    </div>
  </div>
  </form>
  </div>
</body>
</html>
