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
    public void pageload()
    {
        string aadhaarno = Session["aadhaarno"].ToString();
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from users_registration where aadhaarno = @aadhaarno";
            cmd.Parameters.AddWithValue("@aadhaarno", aadhaarno);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
            con.Close();
            lblwelcome.Text = "Hello " + dt.Rows[0]["name"].ToString().Trim() + ",";
            txtname.Text = dt.Rows[0]["name"].ToString().Trim();
            txtfathername.Text = dt.Rows[0]["fathername"].ToString().Trim();
            txtemail.Text = dt.Rows[0]["mail"].ToString().Trim();
            txtphno.Text = dt.Rows[0]["phno"].ToString().Trim();
            txtpassword.Text = dt.Rows[0]["password"].ToString().Trim();
            txtpassword.Enabled = false;
            txtconfirmpassword.Text = dt.Rows[0]["confirmpassword"].ToString().Trim();
            txtconfirmpassword.Enabled = false;
            txtaadhaarno.Text = dt.Rows[0]["aadhaarno"].ToString().Trim();
            txtaadhaarno.Enabled = false;
            txtaddress.Text = dt.Rows[0]["address"].ToString().Trim();
            txtpin.Text = dt.Rows[0]["pin"].ToString().Trim();
            txtque.Text = dt.Rows[0]["question"].ToString().Trim();
            txtans.Text = dt.Rows[0]["answer"].ToString().Trim();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["aadhaarno"] != "")
        {
            if (!IsPostBack)
            {
                pageload();
            }
        }
        string aadhaarno = Session["aadhaarno"].ToString();
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from users_registration where aadhaarno = @aadhaarno";
            cmd.Parameters.AddWithValue("@aadhaarno", aadhaarno);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
            con.Close();
            lblname.Text = "welcome " + dt.Rows[0]["name"].ToString().Trim() + ",";
        }
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("allrooms.aspx");
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        string name = txtname.Text.Trim();
        string fathername = txtfathername.Text.Trim();
        string phno = txtphno.Text.Trim();
        string mail = txtemail.Text.Trim();
        string address = txtaddress.Text.Trim();
        string pin = txtpin.Text.Trim();
        string question = txtque.Text.Trim();
        string answer = txtans.Text.Trim();
        string aadhaarno = Session["aadhaarno"].ToString();
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            SqlCommand cmdUpdate = new SqlCommand();
            cmdUpdate.Connection = con;
            cmdUpdate.CommandText = "update users_registration set name=@name,mail=@mail,phno=@phno,fathername=@fathername,question=@question,answer=@answer,address=@address,pin=@pin where aadhaarno=@aadhaarno";
            cmdUpdate.Parameters.AddWithValue("@name", name);
            cmdUpdate.Parameters.AddWithValue("@aadhaarno", aadhaarno);
            cmdUpdate.Parameters.AddWithValue("@fathername", fathername);
            cmdUpdate.Parameters.AddWithValue("@phno", phno);
            cmdUpdate.Parameters.AddWithValue("@mail", mail);
            cmdUpdate.Parameters.AddWithValue("@address", address);
            cmdUpdate.Parameters.AddWithValue("@pin", pin);
            cmdUpdate.Parameters.AddWithValue("@question", question);
            cmdUpdate.Parameters.AddWithValue("@answer", answer);
            cmdUpdate.ExecuteNonQuery();
            lblresponse.Text="Data Update SuccessFully!";
        }
    }
}