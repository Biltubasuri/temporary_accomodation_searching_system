<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home_home" %>

<html>
<head runat="server">
    <title>ROOM FINDER</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="stylesheet" href="css/homestyle.css" />
    <%
        string path = HttpContext.Current.Server.MapPath("Link.txt");
        string content = System.IO.File.ReadAllText(path);
        Response.Write(content);
    %>
</head>
<body>

    <section class="home" id="home">
        <div class="banner">
            <div class="navbar">
                <img class="circular--square" src="images/logo.png"/>
               <ul>
                    <li><a href="home.aspx">Home</a></li>
                    <li><a href="../owners/login.aspx">Owner Login</a></li>
                    <li><a href="../user/login.aspx">User Login</a></li>
                    <li><a href="../owners/registration.aspx">Owner Signup</a></li>
                    <li><a href="../user/registration.aspx">User Signup</a></li>
                    <li><a href="complain.aspx">Complain</a></li>
               </ul>
            </div>
            <div class="content">
                <h1>Let's Find Your Dream Temporary Accomodation</h1>
                <p>Apartment searching can be exciting for tenants — it’s an opportunity for them to upgrade their life.<br /> Writing an engaging rental listing description is a way to sell a lifestyle you can provide.<br /> Tenants will be thrilled to find a better location, a better price, <br />better amenities, or even a better landlord.</p>
                <p>who are you ?<br />A room owner or a renter,</p>
                <div> 
                    <button type="button" onclick="window.location.href='../owners/login.aspx';"><span></span>ROOM OWNER</button>
                    <button type="button" onclick="window.location.href='../user/login.aspx';"><span></span>RENTER</button>
                </div>
            </div>
        </div>
        </section>
    <section class="services">
	      <div class="s-heading">
	        <h1>Services</h1>
	         <p>We Provide The Best In Class Servies For Our Customers</p>
	       </div>
	<div class="s-box-container">
	<div class="s-box">
	<div class="bar"></div>
	<img alt="1" src="images/mess.jpg" />
	<h1>Mess</h1>
		<p>Let's Find your mess and book it.</p>
	<a class="s-btn" href="../user/login.aspx">Book</a>
    <p>or</p>
    <a class="s-btn" href="../owners/login.aspx">List Now</a>
	</div>	
	<div class="s-box">
	<div class="bar"></div>
	<img alt="2" src="images/pg.jpg" />
	<h1>PG</h1>
		<p>Find a budget friendly PG room.</p>
	<a class="s-btn" href="../user/login.aspx">Book</a>
    <p>or</p>
    <a class="s-btn" href="../owners/login.aspx">List Now</a>
	</div>	
	<div class="s-box">
	<div class="bar"></div>
	<img alt="3" src="images/rental room.jpg" />
	<h1>Rental Room</h1>
		<p>Book your rental room according through your monthly expenses.</p>
	<a class="s-btn" href="../user/login.aspx">Book</a>
    <p>or</p>
    <a class="s-btn" href="../owners/login.aspx">List Now</a>
	</div>
	</div>
	</section>
    <section class="aboutus" id="aboutus">
        <div class="about-section">
            <h1>About Us</h1>
            <p>This site was developed to provides individuals their desired rental rooms.</p>
            <p>If you face any problem or you have any query then you can mail us.</p>
        </div>

        <h2 style="text-align:center">Our Team</h2>
        <div class="row">
            <div class="column">
                <div class="card">
                    <img src="images/profpicarnab.jpg" alt="arnab" style="width:45%">
                    <div class="container">
                    <h2>Arnab Mondal</h2>
                    <p class="title">Designer and Developer</p>
                    <p>description</p>
                    <p>www.mondalarnab347.com@gmail.com</p>
                    <p><button class="button" onclick="window.location.href='https://www.linkedin.com/in/arnab-mondal-b025a2163';">Contact</button></p>
                 </div>
                </div>
               </div>

        <div class="column">
            <div class="card">
                <img src="images/profpicanimesh.jpg" alt="animesh" style="width:45%">
                    <div class="container">
                        <h2>Animesh Bhowmik</h2>
                            <p class="title">Designer and Developer</p>
                            <p>describes</p>
                            <p>anibhowmik01@gmail.com</p>
                             <p><button class="button" onclick="window.location.href='https://www.linkedin.com/in/animesh-bhowmik-037a13259';">Contact</button></p>
                      </div>
                    </div>
                </div>

            <div class="column">
                 <div class="card">
                    <img src="images/IMG_20220924_184223.jpg" alt="biltu" style="width:65%">
                        <div class="container">
                            <h2>Biltu Basuri</h2>
                            <p class="title">Developer</p>
                            <p>Describes</p>
                            <p>biltubasuri@gmail.com</p>
                            <p><button class="button" onclick="window.location.href='https://www.linkedin.com/in/biltu-basuri-56170a251';">Contact</button></p>
                          </div>
                        </div>
                       </div>
            </div>
    </section>
   
    <br />
    <%
        string footerpath = HttpContext.Current.Server.MapPath("html/Footer.htm");
        string footercontent = System.IO.File.ReadAllText(footerpath);
        Response.Write(footercontent);
    %>
</body>
</html>
