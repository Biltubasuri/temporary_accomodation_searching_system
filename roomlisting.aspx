<%@ Page Language="C#" AutoEventWireup="true" CodeFile="roomlisting.aspx.cs" Inherits="user_profiledetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head id="Head1" runat="server">
    <title>Owners Room Listing</title>
    <link rel="stylesheet" href="css/roomlistingstyle.css"/>
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
          <a href="dashboard.aspx" class="active">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Dashboard</span>
          </a>
        </li>
        <li>
          <a href="roomlisting.aspx">
            <i class='bx bx-home' ></i>
            <span class="links_name">List Rooms</span>
          </a>
        </li>
        <li>
          <a href="managerooms.aspx">
            <i class='bx bx-home' ></i>
            <span class="links_name">Manage Rooms</span>
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
            <span class="links_name">Setting</span>
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
        <span class="dashboard">List Rooms</span>
      </div>
      <div class="profile-details">
        <!--<img src="images/profile.jpg" alt="">-->
        <asp:Label ID="lblname" class="admin_name" runat="server"></asp:Label>
      </div>
    </nav>

    <div class="home-content">
    <div class="container">
    <div class="content">
      <div class="right-side">
        <div class="topic-text">Let's start,</div>
        <p>List your owned accommodation and connect with users. </p>
        <asp:Label ID="lblresponse" runat="server" ForeColor="#CC3300"></asp:Label>
      <form action="#">
        <div class="input-box">
          <asp:TextBox ID="txtname" runat="server" type="text" placeholder="Enter your accommodation name"></asp:TextBox>
        </div>
        <div class="input-box">
            <asp:DropDownList class="input-box dropdown"  ID="txtroomtype" runat="server">
                <asp:ListItem>Select Accommodation Type</asp:ListItem>
                <asp:ListItem>Rental Room</asp:ListItem>
                <asp:ListItem>Mess</asp:ListItem>
                <asp:ListItem>PG</asp:ListItem>
            </asp:DropDownList>
      
        </div>
        <div class="input-box">
        <br />
          <asp:TextBox ID="txtphno" runat="server" type="phone" placeholder="Enter your contact No."></asp:TextBox>
        </div>
        <div class="input-box">
        <br />
          <asp:TextBox ID="txtprice" runat="server" type="text" placeholder="Enter your room price"></asp:TextBox>
        </div>
        <div class="input-box">
        <br />
          <asp:TextBox ID="txtfacilities" runat="server" type="text" placeholder="Enter the facilities you are going to provide"></asp:TextBox>
        </div>
        <div class="input-box">
        <br />
          <asp:TextBox ID="txtdescription" runat="server" type="text" placeholder="Enter description"></asp:TextBox>
        </div>
        <div class="input-box">
        <br />
          <asp:TextBox ID="txtlocation" runat="server" type="text" placeholder="Enter your Location"></asp:TextBox>
        </div>
        <div class="input-box">
        <br />
          <asp:TextBox ID="txtid" runat="server" type="text" placeholder="Enter your room id(accommodation_name+last_3digit_of_phno.+total_no_rooms ex.starmess08912)"></asp:TextBox>
        </div>
        <br />
        <asp:FileUpload class="fileupload" ID="FileUpload1" runat="server" />
        <asp:FileUpload class="fileupload" ID="FileUpload2" runat="server" /><br />
        <asp:FileUpload class="fileupload" ID="FileUpload3" runat="server" />
        <asp:FileUpload class="fileupload" ID="FileUpload4" runat="server" /><br />
        <asp:FileUpload class="fileupload" ID="FileUpload5" runat="server" />
        <div>
          <asp:Button ID="btnsubmit" class="button" runat="server" Text="Submit" 
                onclick="btnsubmit_Click"/>
        </div>
      </form>
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