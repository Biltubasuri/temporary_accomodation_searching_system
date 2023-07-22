using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions; 

public partial class user_registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (txtname.Text.Trim() != "")
        {
            string email = txtemail.Text;
            Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
            Match match = regex.Match(email);
            if (match.Success)
            {
                if (txtphno.Text.Trim().Length == 10)
                {
                    string password1 = txtpassword.Text;
                    if (Regex.IsMatch(password1, @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"))
                    {
                        if (txtpassword.Text.Trim() == txtconfirmpassword.Text.Trim())
                        {
                            if (txtaddharno.Text.Trim().Length == 12)
                            {
                                if (txtque.SelectedItem.Text.Trim() != "")
                                {
                                    if (txtans.Text.Trim() != "")
                                    {
                                        if (txtcaptcha.Text.ToLower() == Session["CaptchaVerify"].ToString())
                                        {
                                            string name = txtname.Text.Trim();
                                            string fathername = txtfathername.Text.Trim();
                                            string mail = txtemail.Text.Trim();
                                            string phno = txtphno.Text.Trim();
                                            string password = txtpassword.Text.Trim();
                                            string confirmpassword = txtconfirmpassword.Text.Trim(); ;
                                            string aadhaarno = txtaddharno.Text.Trim();
                                            string address = txtaddress.Text.Trim();
                                            string pin = txtpin.Text.Trim();
                                            string question = txtque.Text.Trim();
                                            string answer = txtans.Text.Trim();

                                            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                                            using (SqlConnection con = new SqlConnection(cs))
                                            {
                                                con.Open();
                                                SqlCommand cmdinsert = new SqlCommand();
                                                cmdinsert.Connection = con;
                                                cmdinsert.CommandText = "insert into users_registration values(@name,@fathername,@mail,@phno,@password,@confirmpassword,@aadhaarno,@address,@pin,@question,@answer)";
                                                cmdinsert.Parameters.AddWithValue("@name", name);
                                                cmdinsert.Parameters.AddWithValue("@fathername", fathername);
                                                cmdinsert.Parameters.AddWithValue("@mail", mail);
                                                cmdinsert.Parameters.AddWithValue("@phno", phno);
                                                cmdinsert.Parameters.AddWithValue("@password", password);
                                                cmdinsert.Parameters.AddWithValue("@confirmpassword", confirmpassword);
                                                cmdinsert.Parameters.AddWithValue("@aadhaarno", aadhaarno);
                                                cmdinsert.Parameters.AddWithValue("@address", address);
                                                cmdinsert.Parameters.AddWithValue("@pin", pin);
                                                cmdinsert.Parameters.AddWithValue("@question", question);
                                                cmdinsert.Parameters.AddWithValue("@answer", answer);
                                                cmdinsert.ExecuteNonQuery();
                                                con.Close();
                                                Response.Redirect("login.aspx");


                                            }
                                        }
                                        else
                                        {
                                            lblerror.Text = "Please enter the correct captcha !";
                                        }
                                    }
                                    else
                                    {
                                        lblerror.Text = "Please choose your security question !";
                                    }
                                }
                                else
                                {
                                    lblerror.Text = "Please enter a answer for your question !";
                                }
                            }
                            else
                            {
                                lblerror.Text = "Please enter correct aadhaar no !";
                            }
                        }
                        else
                        {
                            lblerror.Text = "Password and confirm password must be same !";
                        }
                    }
                    else
                    {
                        lblerror.Text = "Please enter correct password !";
                    }
                }
                else
                {
                    lblerror.Text = "Please enter correct ph no !";
                }
            }
            else
            {
                lblerror.Text = "Please enter correct mail !";
            }

        }
        else
        {
            lblerror.Text = "Please enter your name first !";
        }
    }
}