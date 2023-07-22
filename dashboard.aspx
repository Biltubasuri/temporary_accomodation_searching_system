<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="user_dashboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Super Admin Dashboard</title>
    <link rel="stylesheet" href="css/dashboardstyle.css"/>
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
          <a href="managerooms.aspx">
            <i class='bx bx-home' ></i>
            <span class="links_name">Manage Rooms</span>
          </a>
        </li>
        <li>
          <a href="manageroomowner.aspx">
            <i class='bx bx-home' ></i>
            <span class="links_name">Manage Room Owner</span>
          </a>
        </li>
        <li>
          <a href="managerenter.aspx">
            <i class='bx bx-home' ></i>
            <span class="links_name">Manage Renter</span>
          </a>
        </li>
        <li>
          <a href="complainbox.aspx">
            <i class='bx bx-message' ></i>
            <span class="links_name">Complain Box</span>
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
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Dashboard</span>
      </div>
      <div class="profile-details">
        <!--<img src="images/profile.jpg" alt="">-->
        <asp:Label ID="lblname" class="admin_name" runat="server"></asp:Label>
      </div>
    </nav>

    <div class="home-content">
      <div class="overview-boxes">
        
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Total Rooms</div>
            <div class="number"><asp:Label ID="lblsales" runat="server"></asp:Label></div>
          </div>
          <i class='bx bxs-cart-add cart two' ></i>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Total Users</div>
            <div class="number"><asp:Label ID="lblliving" runat="server"></asp:Label></div>
          </div>
          <i class='bx bx-home cart three' ></i>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Total Room Owners</div>
            <div class="number"><asp:Label ID="lblavl" runat="server"></asp:Label></div>
          </div>
          <i class='bx bxs-star cart four' ></i>
        </div>
      </div>

      
    </div>
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
