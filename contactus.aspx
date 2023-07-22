<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contactus.aspx.cs" Inherits="contact_us_contactus" %>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>Contact us</title>
    <link rel="stylesheet" href="css/contactusstyle.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body class="back" background="images/background1.jpg">
  <div class="container">
  <form runat="server">
    <div class="content">
      <div class="left-side">

        <div class="phone details">
          <div class="topic">Phone</div>
          <div class="text-one">8768966489</div>
          <div class="text-two">6297157089</div>
        </div>
        <div class="email details">
          <div class="topic">Email</div>
          <div class="text-one">www.mondalarnab347.com@gmail.com</div>
          <div class="text-two">anibhowmik011@gmail.com</div>
        </div>
      </div>
      <div class="right-side">
        <div class="topic-text">Send us a message</div>
        <p>If you have any work from us or any types of quries related to this website, you can send us message from here. It's our pleasure to help you.</p>
        <asp:Label ID="lblresponse" runat="server" ForeColor="#CC3300"></asp:Label>
        <div class="input-box">
          <asp:TextBox ID="txtname" runat="server" placeholder="Enter your name"></asp:TextBox>
        </div>
        <div class="input-box">
          <asp:TextBox ID="txtmail" runat="server" placeholder="Enter your Mail"></asp:TextBox>
        </div>
        <div class="input-box message-box">
          <asp:TextBox ID="txtmessage" runat="server" placeholder="Enter your message"></asp:TextBox>
        </div>
        
        <div>
          <asp:Button ID="btnsendnow" class="button" runat="server" text="Send Now" 
                onclick="btnsendnow_Click" />
          <asp:Button ID="btnback" class="button" runat="server" Text="Back" 
                onclick="btnback_Click" />
        </div>
    </div>
    </div>
    </form>
  </div>
</body>
</html>
