<%@ Page Language="C#" AutoEventWireup="true" CodeFile="managerooms.aspx.cs" Inherits="user_dashboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage rooms</title>
    <link rel="stylesheet" href="css/manageroomsstyle.css" />
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
    <form id="Form1" runat="server">
    <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Manage Rooms</span>
      </div>
      
      <div class="profile-details">
        <!--<img src="images/profile.jpg" alt="">-->
        <asp:Label ID="lblname" class="admin_name" runat="server"></asp:Label>
      </div>
    </nav>
    <br />
    <br />
    <br />
    <br />
    <div class="lvcontainer">
        <div class="lvcontainer1">
        <h2>All <span>Rooms</span></h2>
        <asp:ListView ID="listdata1" runat="server" DataKeyNames="id"
                onitemdeleting="listdata1_ItemDeleting" onitemediting="listdata1_ItemEditing" 
                onitemupdating="listdata1_ItemUpdating" 
                onitemcanceling="listdata1_ItemCanceling" onitemdatabound="OnDataBound">
                        <EditItemTemplate>
                    <span style="background-color:transparent;">Accommodation name:
                    <asp:TextBox ID="txtname" runat="server" Text='<%# Bind("accommodation_name") %>' />
                    <br />
                    Accommodation type:
                    <asp:TextBox ID="txtaccommodationtype" runat="server" Text='<%# Bind("room_type") %>' />
                    <br />
                    phno:
                    <asp:TextBox ID="txtphno" runat="server" Text='<%# Bind("ph_no") %>' />
                    <br />
                    Price:
                    <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("price") %>' />
                    <br />
                    Facilities:
                    <asp:TextBox ID="txtFacilities" runat="server" 
                        Text='<%# Bind("Facilities") %>' />
                    <br />
                    Description:
                    <asp:TextBox ID="txtDescription" runat="server" 
                        Text='<%# Bind("Description") %>' />
                    <br />
                    Location:
                    <asp:TextBox ID="txtLocation" runat="server" 
                        Text='<%# Bind("Location") %>' />
                    <br />
                    Status (live/not live):
                    <asp:TextBox ID="txtStatus" runat="server" 
                        Text='<%# Bind("status") %>' />
                    <br />
                    id:
                    <asp:TextBox ID="txtid" runat="server" 
                        Text='<%# Bind("id") %>' />
                    <br />
                    <br />
                    <asp:Image ID="image1" runat="server" Height="150px" Width="150px"/>
                    <asp:Image ID="Image2" runat="server" Height="150px" Width="150px"/>
                    <asp:Image ID="Image3" runat="server" Height="150px" Width="150px"/>
                    <asp:Image ID="Image4" runat="server" Height="150px" Width="150px"/>
                    <asp:Image ID="Image5" runat="server" Height="150px" Width="150px"/>
                    <br />
                    <br />
                    </span>          
                <asp:LinkButton ID="UpdateButton" CssClass="lvbtn" runat="server" CommandName="Update" Text="Update" OnClientClick="return confirm('Do you want to update?')"></asp:LinkButton>
                <asp:LinkButton ID="CancelButton" CssClass="lvbtn" runat="server" CommandName="Cancel" Text="Cancel" OnClientClick="return confirm('All unsaved data will be lost!')"></asp:LinkButton>
                <br />
                <br />
                 </EditItemTemplate>
                        <EmptyDataTemplate>
                    <span>No review requests was found.</span>
                </EmptyDataTemplate>
                        <ItemTemplate>
                    <span style="color: #333333;">
                    <asp:Image ID="image1" runat="server" Height="150px" Width="150px"/>
                    <asp:Image ID="Image2" runat="server" Height="150px" Width="150px"/>
                    <asp:Image ID="Image3" runat="server" Height="150px" Width="150px"/>
                    <asp:Image ID="Image4" runat="server" Height="150px" Width="150px"/>
                    <asp:Image ID="Image5" runat="server" Height="150px" Width="150px"/>
                    <br />
                    Accommodation name:
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("accommodation_name") %>' />
                    <br />
                    Accommodation type:
                    <asp:Label ID="roomtypeLabel" runat="server" Text='<%# Eval("room_type") %>' />
                    <br />
                    phno:
                    <asp:Label ID="phnoLabel" runat="server" Text='<%# Eval("ph_no") %>' />
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
                    status:
                    <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' ForeColor="Crimson" Font-Bold="true"/>
                    <br />
                    id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    <br />
                    <br />
                    <asp:LinkButton CssClass="lvbtn" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" OnClientClick="return confirm('Do you want to edit the selected row?')"></asp:LinkButton>
                    <asp:LinkButton CssClass="lvbtn" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Do you want to delete the selected row?')"></asp:LinkButton>
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
    </form>
</body>
</html>
