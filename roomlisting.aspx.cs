using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class user_profiledetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["aadhaarno"] != null)
        {
            string aadhaarno = Session["aadhaarno"].ToString();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select * from owners_registration where aadhaarno = @aadhaarno";
                cmd.Parameters.AddWithValue("@aadhaarno", aadhaarno);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(dt);
                con.Close();
                lblname.Text = "welcome " + dt.Rows[0]["name"].ToString().Trim() + ",";
            }
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (txtname.Text.Trim() != "")
        {
            if (txtroomtype.SelectedItem.Text.Trim() == "Rental Room" || txtroomtype.SelectedItem.Text.Trim() == "PG" || txtroomtype.SelectedItem.Text.Trim() == "Mess")
            {
                if (txtphno.Text.Trim().Length == 10)
                {
                    if (txtprice.Text.Trim() != "")
                    {
                        if (txtfacilities.Text.Trim() != "")
                        {
                            if (txtdescription.Text.Trim() != "")
                            {
                                if (txtlocation.Text.Trim() != "")
                                {
                                    if (txtid.Text.Trim() != "")
                                    {
                                        if (FileUpload1.HasFile)
                                        {
                                            string name = txtname.Text.Trim();
                                            string roomtype = txtroomtype.SelectedItem.Text.Trim();
                                            string ph_no = txtphno.Text.Trim();
                                            string price = txtprice.Text.Trim();
                                            string facilities = txtfacilities.Text.Trim(); ;
                                            string description = txtdescription.Text.Trim();
                                            string location = txtlocation.Text.Trim();
                                            byte[] bytes1;
                                            byte[] bytes2;
                                            byte[] bytes3;
                                            byte[] bytes4;
                                            byte[] bytes5;
                                            string aadhaarno = Session["aadhaarno"].ToString();
                                            string booking_status = "notbooked";
                                            string status = "not live";
                                            string id = txtid.Text.Trim();
                                            using (BinaryReader br = new BinaryReader(FileUpload1.PostedFile.InputStream))
                                            {
                                                bytes1 = br.ReadBytes(FileUpload1.PostedFile.ContentLength);
                                            }
                                            using (BinaryReader br = new BinaryReader(FileUpload2.PostedFile.InputStream))
                                            {
                                                bytes2 = br.ReadBytes(FileUpload2.PostedFile.ContentLength);
                                            }
                                            using (BinaryReader br = new BinaryReader(FileUpload3.PostedFile.InputStream))
                                            {
                                                bytes3 = br.ReadBytes(FileUpload3.PostedFile.ContentLength);
                                            }
                                            using (BinaryReader br = new BinaryReader(FileUpload4.PostedFile.InputStream))
                                            {
                                                bytes4 = br.ReadBytes(FileUpload4.PostedFile.ContentLength);
                                            }
                                            using (BinaryReader br = new BinaryReader(FileUpload5.PostedFile.InputStream))
                                            {
                                                bytes5 = br.ReadBytes(FileUpload5.PostedFile.ContentLength);
                                            }
                                            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                                            using (SqlConnection con = new SqlConnection(cs))
                                            {

                                                SqlCommand cmdinsert = new SqlCommand();
                                                cmdinsert.Connection = con;
                                                cmdinsert.CommandText = "insert into temp_roomlisting values(@accommodation_name,@roomtype,@ph_no,@price,@facilities,@description,@location,@image1,@image2,@image3,@image4,@image5,@aadhaarno,@status,@booking_status,@id)";
                                                cmdinsert.Parameters.AddWithValue("@accommodation_name", name);
                                                cmdinsert.Parameters.AddWithValue("@roomtype", roomtype);
                                                cmdinsert.Parameters.AddWithValue("@ph_no", ph_no);
                                                cmdinsert.Parameters.AddWithValue("@price", price);
                                                cmdinsert.Parameters.AddWithValue("@facilities", facilities);
                                                cmdinsert.Parameters.AddWithValue("@description", description);
                                                cmdinsert.Parameters.AddWithValue("@location", location);
                                                cmdinsert.Parameters.AddWithValue("@image1", bytes1);
                                                cmdinsert.Parameters.AddWithValue("@image2", bytes2);
                                                cmdinsert.Parameters.AddWithValue("@image3", bytes3);
                                                cmdinsert.Parameters.AddWithValue("@image4", bytes4);
                                                cmdinsert.Parameters.AddWithValue("@image5", bytes5);
                                                cmdinsert.Parameters.AddWithValue("@aadhaarno", aadhaarno);
                                                cmdinsert.Parameters.AddWithValue("@status", status);
                                                cmdinsert.Parameters.AddWithValue("@booking_status", booking_status);
                                                cmdinsert.Parameters.AddWithValue("@id", id);
                                                con.Open();
                                                cmdinsert.ExecuteNonQuery();
                                                con.Close();
                                                lblresponse.Text = "Your room details have been submitted successfully. Now the room details will be reviewed by our team. Once it is done, your room will be live.";


                                            }
                                        }
                                        else
                                        {
                                            lblresponse.Text = "You must have to provide at least one image of the accommodation !";
                                        }
                                    }
                                
                                else
                                {
                                    lblresponse.Text = "Please enter your id !";
                                }
                            }
                                else
                                {
                                    lblresponse.Text = "Please enter the location of the room !";
                                }
                                }
                                else
                                {
                                    lblresponse.Text = "Please enter a description !";
                                }
                            }
                            else
                            {
                                lblresponse.Text = "Please enter the facilities which you are going to provide !";
                            }
                        }
                        else
                        {
                            lblresponse.Text = "Please enter the price of your room !";
                        }
                    }
                    else
                    {
                        lblresponse.Text = "Please enter your ph no !";
                    }
                }
                else
                {
                    lblresponse.Text = "Please choose the room type !";
                }
            }
            else
            {
                lblresponse.Text = "Please enter accommodation name !";
            }

}
}