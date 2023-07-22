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
    public void listLoad()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from owners_registration", con);
            da.Fill(dt);
        }
        listdata.DataSource = dt;
        listdata.DataBind();
    }

    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null)
        {
            if (!IsPostBack)
            {
                listLoad();
            }
            string id = Session["id"].ToString();
            lblname.Text = "welcome " + id.ToString().Trim() + ",";
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void listdata_ItemEditing(object sender, ListViewEditEventArgs e)
    {
        listdata.EditIndex = e.NewEditIndex;
        listLoad();
    }
    protected void listdata_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        string aadhaarno = (string)listdata.DataKeys[e.ItemIndex].Value.ToString();
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        string name = (listdata.Items[e.ItemIndex].FindControl("txtname") as TextBox).Text.Trim();
        string mail = (listdata.Items[e.ItemIndex].FindControl("txtmail") as TextBox).Text.Trim();
        string phno = (listdata.Items[e.ItemIndex].FindControl("txtphno") as TextBox).Text.Trim();
        string address = (listdata.Items[e.ItemIndex].FindControl("txtaddress") as TextBox).Text.Trim();
        string pin = (listdata.Items[e.ItemIndex].FindControl("txtpin") as TextBox).Text.Trim();
        if (name != "" && mail != "" && phno != "" && address != "" && pin != "")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlTransaction transaction = con.BeginTransaction();
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.Transaction = transaction;
                    cmd.CommandText = "update owners_registration set name = @name, mail = @mail, phno = @phno, address=@address, pin=@pin where aadhaarno = @aadhaarno";
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@mail", mail);
                    cmd.Parameters.AddWithValue("@phno", phno);
                    cmd.Parameters.AddWithValue("@aadhaarno", aadhaarno);
                    cmd.Parameters.AddWithValue("@address", address);
                    cmd.Parameters.AddWithValue("@pin", pin);
                    cmd.ExecuteNonQuery();
                    transaction.Commit();
                    listdata.EditIndex = -1;
                    listLoad();
                    Alert("Data updated successfully.");
                }
                catch
                {
                    transaction.Rollback();
                }
            }
        }
        else
        {
            Alert("Please fill all fields.");
        }
    }
    protected void listdata_ItemCanceling(object sender, ListViewCancelEventArgs e)
    {
        listdata.EditIndex = -1;
        listLoad();
    }
    protected void listdata_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        string aadhaarno = (string)listdata.DataKeys[e.ItemIndex].Value;
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from owners_registration where aadhaarno=@aadhaarno";
            cmd.Parameters.AddWithValue("@aadhaarno",aadhaarno);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        Response.Redirect("manageroomowner.aspx");
    }
    protected void txtsearch_TextChanged(object sender, EventArgs e)
    {
        Response.Write("ok");
    }
}