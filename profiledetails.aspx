<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profiledetails.aspx.cs" Inherits="user_profiledetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head id="Head1" runat="server">
    <title>Users Profile Details</title>
    <link rel="stylesheet" href="css/profiledetailsstyle.css"/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
  <div class="sidebar">
    <div class="logo-details">
      <span class="logo_name">Room Finder</span>
    </div>
      <ul class="nav-links">
        <li>
          <a href="allrooms.aspx" class="active">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">All Rooms</span>
          </a>
        </li>
        <li>
          <a href="contactus.aspx">
            <i class='bx bx-message' ></i>
            <span class="links_name">Complain Box</span>
          </a>
        </li>
        <li>
          <a href="profiledetails.aspx">
            <i class='bx bx-cog' ></i>
            <span class="links_name">Profile Details</span>
          </a>
        </li>

        <li class="log_out">
          <a href="login.aspx">
            <i class='bx bx-log-out'></i>
            <span class="links_name">Log out</span>
          </a>
        </li>
      </ul>
  </div>
  <section class="home-section">
  <form id="Form1" runat="server">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Profile Details</span>
      </div>
      
 
      <div class="profile-details">
        <!--<img src="images/profile.jpg" alt="">-->
        <asp:Label ID="lblname" class="admin_name" runat="server"></asp:Label>
      </div>
    </nav>

    <div class="home-content">
      <div class="container">
        
         <div class="imgcontainer">
            <img src="images/user.png" alt="Avatar" class="avatar">
         </div>
            <div class="content">
            <div class="right-side">
            <asp:Label ID="lblwelcome" runat="server" Text="" class="topic-text"></asp:Label>
            <p>Your details are now displaying below,</p>
            <asp:Label ID="lblresponse" runat="server"></asp:Label>
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
                    <asp:TextBox ID="txtaadhaarno" runat="server" type="text" placeholder="Enter your Aadhaar No."></asp:TextBox>
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
                    <asp:TextBox ID="txtans" runat="server" type="text" placeholder="Enter answer of your question"></asp:TextBox>
                 </div>
                 <div class="input-box">
                    <asp:TextBox ID="txtfathername" runat="server" type="text" placeholder="Enter your father's name"></asp:TextBox>
                 </div>
                <div class="input-box">
                    <asp:TextBox ID="txtaddress" runat="server" type="text" placeholder="Enter your Address"></asp:TextBox>
                </div>
                <div class="input-box">
                    <asp:TextBox ID="txtpin" runat="server" type="text" placeholder="Enter your Pin"></asp:TextBox>
                </div>
                <div>
                    <asp:Button id="btnback" class="button" runat="server" text="Back" 
                        onclick="btnback_Click" />
                    <asp:Button id="btnupdate" class="button" runat="server" text="Update" 
                        onclick="btnupdate_Click" />
                </div>
            
            </div>
           </div>
          </div>
         </div>
         </form>
        </section>
       
  <script>
   let sidebar = document.querySelector(".sidebar");
   let sidebarBtn = document.querySelector(".sidebarBtn");
   sidebarBtn.onclick = function() {
   sidebar.classList.toggle("active");
   if(sidebar.classList.contains("active")){
    sidebarBtn.classList.replace("bx-menu" ,"bx-menu-alt-right");
   }else
    sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
   }
 </script>
</body>
</html>