using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null)
        {
                string id = Session["id"].ToString();
                lblname.Text = "welcome " + id.ToString().Trim() + ",";

                string cs1 = ConfigurationManager.ConnectionStrings["DBCS1"].ConnectionString;

                DataTable dt1 = new DataTable();
                using (SqlConnection con = new SqlConnection(cs1))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "select * from temp_roomlisting";
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    da.Fill(dt1);
                    con.Close();
                    lblsales.Text = dt1.Rows.Count.ToString();
                }
                string cs2 = ConfigurationManager.ConnectionStrings["DBCS2"].ConnectionString;

                DataTable dt2 = new DataTable();
                using (SqlConnection con = new SqlConnection(cs2))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "select * from users_registration";
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    da.Fill(dt2);
                    con.Close();
                    lblliving.Text = dt2.Rows.Count.ToString();
                }
                string cs3 = ConfigurationManager.ConnectionStrings["DBCS3"].ConnectionString;

                DataTable dt3 = new DataTable();
                using (SqlConnection con = new SqlConnection(cs3))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "select * from owners_registration";
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    da.Fill(dt3);
                    con.Close();
                    lblavl.Text = dt3.Rows.Count.ToString();
                }
            
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }
}