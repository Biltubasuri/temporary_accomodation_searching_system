<%@ Page Language="C#" AutoEventWireup="true" CodeFile="complainbox.aspx.cs" Inherits="user_profiledetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head id="Head1" runat="server">
    <title>Manage Renter</title>
    <link rel="stylesheet" href="css/managerenterstyle.css"/>
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
        <span class="dashboard">Manage Renter</span>
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
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="aadhaarno" EmptyDataText="There are no data records to display." 
                DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
                GridLines="None" Width="98%">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:CommandField ShowDeleteButton="True" />
<asp:BoundField DataField="name" HeaderText="name" SortExpression="name"></asp:BoundField>
<asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail"></asp:BoundField>
<asp:BoundField DataField="message" HeaderText="message" SortExpression="message"></asp:BoundField>
<asp:BoundField DataField="aadhaarno" HeaderText="aadhaarno" ReadOnly="True" SortExpression="aadhaarno"></asp:BoundField>
<asp:BoundField DataField="user_type" HeaderText="user_type" SortExpression="user_type"></asp:BoundField>
</Columns>
    <EditRowStyle BackColor="#7C6F57" />
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#E3EAEB" />
    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F8FAFA" />
    <SortedAscendingHeaderStyle BackColor="#246B61" />
    <SortedDescendingCellStyle BackColor="#D4DFE1" />
    <SortedDescendingHeaderStyle BackColor="#15524A" />
</asp:GridView>
 <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" DeleteCommand="DELETE FROM [complain_box] WHERE [aadhaarno] = @aadhaarno" InsertCommand="INSERT INTO [complain_box] ([name], [mail], [message], [aadhaarno], [user_type]) VALUES (@name, @mail, @message, @aadhaarno, @user_type)" ProviderName="<%$ ConnectionStrings:DBCS.ProviderName %>" SelectCommand="SELECT [name], [mail], [message], [aadhaarno], [user_type] FROM [complain_box]" UpdateCommand="UPDATE [complain_box] SET [name] = @name, [mail] = @mail, [message] = @message, [user_type] = @user_type WHERE [aadhaarno] = @aadhaarno" ID="SqlDataSource1"><DeleteParameters>
<asp:Parameter Name="aadhaarno" Type="String"></asp:Parameter>
</DeleteParameters>
<InsertParameters>
<asp:Parameter Name="name" Type="String"></asp:Parameter>
<asp:Parameter Name="mail" Type="String"></asp:Parameter>
<asp:Parameter Name="message" Type="String"></asp:Parameter>
<asp:Parameter Name="aadhaarno" Type="String"></asp:Parameter>
<asp:Parameter Name="user_type" Type="String"></asp:Parameter>
</InsertParameters>
<UpdateParameters>
<asp:Parameter Name="name" Type="String"></asp:Parameter>
<asp:Parameter Name="mail" Type="String"></asp:Parameter>
<asp:Parameter Name="message" Type="String"></asp:Parameter>
<asp:Parameter Name="user_type" Type="String"></asp:Parameter>
<asp:Parameter Name="aadhaarno" Type="String"></asp:Parameter>
</UpdateParameters>
</asp:SqlDataSource>
 
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