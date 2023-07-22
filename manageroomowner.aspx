<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manageroomowner.aspx.cs"
    Inherits="user_profiledetails" EnableEventValidation="False" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>Manage Room Owner</title>
    <link rel="stylesheet" href="css/manageroomownerstyle.css" />
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
  <form id="Form1" runat="server">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Manage Room Owner</span>
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
        <br />
        <div class="lvcontainer">
            <asp:ListView ID="listdata" runat="server" DataKeyNames="aadhaarno"
        onitemcanceling="listdata_ItemCanceling" onitemdeleting="listdata_ItemDeleting" 
        onitemediting="listdata_ItemEditing" onitemupdating="listdata_ItemUpdating">
                 
                  <EditItemTemplate>
                    <span style="background-color:transparent;">name:
                    <asp:TextBox ID="txtname" runat="server" Text='<%# Bind("name") %>' />
                    <br />
                    mail:
                    <asp:TextBox ID="txtmail" runat="server" Text='<%# Bind("mail") %>' />
                    <br />
                    phno:
                    <asp:TextBox ID="txtphno" runat="server" Text='<%# Bind("phno") %>' />
                    <br />
                    aadhaarno:
                    <asp:Label ID="aadhaarnoLabel1" runat="server" Text='<%# Eval("aadhaarno") %>' />
                    <br />
                    address:
                    <asp:TextBox ID="txtaddress" runat="server" 
                        Text='<%# Bind("address") %>' />
                    <br />
                    pin:
                    <asp:TextBox ID="txtpin" runat="server" 
                        Text='<%# Bind("pin") %>' />
                    <br />
                    <br />
                    </span>             
                <asp:LinkButton ID="UpdateButton" CssClass="lvbtn" runat="server" CommandName="Update" Text="Update" OnClientClick="return confirm('Do you want to update?')"></asp:LinkButton>
                <asp:LinkButton ID="CancelButton" CssClass="lvbtn" runat="server" CommandName="Cancel" Text="Cancel" OnClientClick="return confirm('All unsaved data will be lost!')"></asp:LinkButton>
                <br />
                <br />
                 </EditItemTemplate>
                  <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                  <InsertItemTemplate>
        <span style="">name:
        <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
        <br />mail:
        <asp:TextBox ID="mailTextBox" runat="server" Text='<%# Bind("mail") %>' />
        <br />phno:
        <asp:TextBox ID="phnoTextBox" runat="server" Text='<%# Bind("phno") %>' />
        <br />aadhaarno:
        <asp:TextBox ID="aadhaarnoTextBox" runat="server" 
            Text='<%# Bind("aadhaarno") %>' />
        <br />address:
        <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
        <br />pin:
        <asp:TextBox ID="pinTextBox" runat="server" Text='<%# Bind("pin") %>' />
        <br />
        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
            Text="Insert" />
        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
            Text="Clear" />
        <br /><br /></span>
    </InsertItemTemplate>
                  <ItemTemplate>
                    <span style="color: #333333;">name:
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    <br />
                    mail:
                    <asp:Label ID="mailLabel" runat="server" Text='<%# Eval("mail") %>' />
                    <br />
                    phno:
                    <asp:Label ID="phnoLabel" runat="server" Text='<%# Eval("phno") %>' />
                    <br />
                    aadhaarno:
                    <asp:Label ID="aadhaarnoLabel" runat="server" 
                        Text='<%# Eval("aadhaarno") %>' />
                    <br />
                    address:
                    <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                    <br />
                    pin:
                    <asp:Label ID="pinLabel" runat="server" Text='<%# Eval("pin") %>' />
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
                  <SelectedItemTemplate>
        <span style="background-color: #E2DED6;font-weight: bold;color: #333333;">name:
        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
        <br />
        mail:
        <asp:Label ID="mailLabel" runat="server" Text='<%# Eval("mail") %>' />
        <br />
        phno:
        <asp:Label ID="phnoLabel" runat="server" Text='<%# Eval("phno") %>' />
        <br />
        aadhaarno:
        <asp:Label ID="aadhaarnoLabel" runat="server" Text='<%# Eval("aadhaarno") %>' />
        <br />
        address:
        <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
        <br />
        pin:
        <asp:Label ID="pinLabel" runat="server" Text='<%# Eval("pin") %>' />
        <br />
        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
<br /><br /></span>
    </SelectedItemTemplate>
        </asp:ListView>
        </div>
         </form>
        </section>
    <script type="text/javascript">
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
