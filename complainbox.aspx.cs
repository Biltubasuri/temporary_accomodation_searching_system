using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_profiledetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null)
        {
            if (!IsPostBack)
            {
                string id = Session["id"].ToString();
                lblname.Text = "welcome " + id.ToString().Trim() + ","; 
            }
            
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }
}