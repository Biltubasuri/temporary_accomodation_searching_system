using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions; 

public partial class contact_us_contactus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["aadhaarno"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void btnsendnow_Click(object sender, EventArgs e)
    {
        if (txtname.Text != "")
        {
            if (txtmail.Text != "")
            {
                if (txtmessage.Text != "")
                {
                    string name = txtname.Text.Trim();
                    string mail = txtmail.Text.Trim();
                    string message = txtmessage.Text.Trim();
                    string aadhaarno = Session["aadhaarno"].ToString();
                    string user_type = "user";
                    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        con.Open();
                        SqlCommand cmdinsert = new SqlCommand();
                        cmdinsert.Connection = con;
                        cmdinsert.CommandText = "insert into complain_box values(@name,@mail,@message,@aadhaarno,@user_type)";
                        cmdinsert.Parameters.AddWithValue("@name", name);
                        cmdinsert.Parameters.AddWithValue("@mail", mail);
                        cmdinsert.Parameters.AddWithValue("@message", message);
                        cmdinsert.Parameters.AddWithValue("@aadhaarno", aadhaarno);
                        cmdinsert.Parameters.AddWithValue("@user_type", user_type);
                        cmdinsert.ExecuteNonQuery();
                        con.Close();
                        lblresponse.Text = "Your complain has been successfully submitted!!";
                    }
                }
                else
                {
                    lblresponse.Text = "Please enter your query!!";
                }
            }
            else
            {
                lblresponse.Text = "Please enter your mail!!";
            }
        }
        else
        {
            lblresponse.Text = "Please enter your name!!";
        }
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("allrooms.aspx");
    }
}