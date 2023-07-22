using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        string aadhaarno = txtaadhaarno.Text.Trim();
        string password = txtpassword.Text.Trim();
        Session["aadhaarno"] = txtaadhaarno.Text.Trim();
        Session["password"]= txtpassword.Text.Trim();
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select password from users_registration where aadhaarno=@aadhaarno and password=@password";
            cmd.Parameters.AddWithValue("@aadhaarno", aadhaarno);
            cmd.Parameters.AddWithValue("@password", password);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
            
        }
        if (dt.Rows.Count == 1)
        {
            Response.Redirect("allrooms.aspx");
            
        }
        else 
        {
            lblresponse.Text = "Please check your login details!!";
        }
    }
}