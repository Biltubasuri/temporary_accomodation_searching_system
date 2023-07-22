<%@ Page Language="C#" AutoEventWireup="true" CodeFile="allrooms.aspx.cs" Inherits="user_dashboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="css/dashboardstyle.css"/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<form id="form1" runat="server">
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
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">All Rooms</span>
      </div>
      <div class="profile-details">
        <!--<img src="images/profile.jpg" alt="">-->
        <asp:Label ID="lblname" class="admin_name" runat="server"></asp:Label>
      </div>
    </nav>

    <div class="home-content">
    <asp:ListView ID="listdata1" runat="server" DataKeyNames="id" onitemdatabound="OnDataBound">
                        <EmptyDataTemplate>
                    <span>No room was found.</span>
                </EmptyDataTemplate>
                        <ItemTemplate>
                    <span style="color: #333333;">
                    <asp:Image ID="image1" runat="server" Height="180px" Width="180px"/>
                    <asp:Image ID="Image2" runat="server" Height="180px" Width="180px"/>
                    <asp:Image ID="Image3" runat="server" Height="180px" Width="180px"/>
                    <asp:Image ID="Image4" runat="server" Height="180px" Width="180px"/>
                    <asp:Image ID="Image5" runat="server" Height="180px" Width="180px"/>
                    <br />
                    Accommodation name:
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("accommodation_name") %>' />
                    <br />
                    Accommodation type:
                    <asp:Label ID="roomtypeLabel" runat="server" Text='<%# Eval("room_type") %>' />
                    <br />
                    
                    Price:
                    <asp:Label ID="pricelabel" runat="server" Text='<%# Eval("price") %>' />
                    <br />
                    Facilities:
                    <asp:Label ID="facilitiesLabel" runat="server" 
                        Text='<%# Eval("facilities") %>' />
                    <br />
                    Description:
                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                    <br />
                    Location:
                    <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
                    <br />
                    phno:
                    <asp:Label ID="phnoLabel" runat="server" Text='<%# Eval("ph_no") %>' />
                    <br />
                    
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" 
            style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size:medium;">
                <span runat="server" id="itemPlaceholder" />
                </div>
                    <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                    </div>
            </LayoutTemplate>
        </asp:ListView>
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
 </form>
</body>
</html>
