using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class forget_password_forgetpassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnshow_Click(object sender, EventArgs e)
    {
        if (txtname.Text.Trim() != "")
        {
            if (txtmail.Text.Trim() != "")
            {
                if (txtphone.Text.Trim() != "")
                {
                    if (txtaadhaarno.Text.Trim() != "")
                    {
                        if (txtque.Text.Trim() != "")
                        {
                            if (txtans.Text.Trim() != "")
                            {
                                if (txtcaptcha.Text.ToLower() == Session["CaptchaVerify"].ToString())
                                {
                                    string name = txtname.Text.Trim();
                                    string mail = txtmail.Text.Trim();
                                    string phno = txtphone.Text.Trim();
                                    string aadhaarno = txtaadhaarno.Text.Trim();
                                    string que = txtque.Text.Trim();
                                    string ans = txtans.Text.Trim();
                                    string captcha = txtcaptcha.Text.Trim();
                                    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                                    DataTable dt = new DataTable();
                                    using (SqlConnection con = new SqlConnection(cs))
                                    {
                                        con.Open();
                                        SqlCommand cmd = new SqlCommand();
                                        cmd.Connection = con;
                                        cmd.CommandText = "select * from users_registration where aadhaarno=@aadhaarno";
                                        cmd.Parameters.AddWithValue("@aadhaarno", aadhaarno);
                                        SqlDataAdapter da = new SqlDataAdapter();
                                        da.SelectCommand = cmd;
                                        da.Fill(dt);
                                        con.Close();
                                    }
                                    if (dt.Rows[0]["name"].ToString().Trim() == name || dt.Rows[0]["mail"].ToString().Trim() == mail || dt.Rows[0]["ph_no"].ToString().Trim() == phno || dt.Rows[0]["aadhaarno"].ToString().Trim() == aadhaarno || dt.Rows[0]["question"].ToString().Trim() == que || dt.Rows[0]["answer"].ToString().Trim() == ans)
                                    {
                                        lblresponse.Text = "Your password is " + dt.Rows[0]["password"].ToString().Trim();
                                    }
                                    else
                                    {
                                        lblresponse.Text = "Plese check your details and try again !!";
                                    }
                                }
                                else
                                {
                                    lblresponse.Text = "Please enter the correct captcha !";
                                }
                            }
                            else
                            {
                                lblresponse.Text = "Please enter your answer !";
                            }
                        }
                        else
                        {
                            lblresponse.Text = "Choose your security question !";
                        }
                    }
                    else
                    {
                        lblresponse.Text = "Fill your aadhaarno !";
                    }
                }
                else
                {
                    lblresponse.Text = "Please enter your phone number !";
                }
            }
            else
            {
                lblresponse.Text = "Please enter your mail id !";
            }
        }
        else
        {
            lblresponse.Text = "Please enter your name !";
        }
    }
}
