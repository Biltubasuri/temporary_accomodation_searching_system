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

public partial class user_dashboard : System.Web.UI.Page
{
    public void listLoad1()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS1"].ConnectionString;
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from temp_roomlisting", con);
            da.Fill(dt);
        }
        listdata1.DataSource = dt;
        listdata1.DataBind();      
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
                listLoad1();
            }
            string id = Session["id"].ToString();
            lblname.Text = "welcome " + id.ToString().Trim() + ",";
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void listdata1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        string id = (string)listdata1.DataKeys[e.ItemIndex].Value;
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from temp_roomlisting where id=@id";
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        Response.Redirect("managerooms.aspx");
    }
    protected void listdata1_ItemEditing(object sender, ListViewEditEventArgs e)
    {
        listdata1.EditIndex = e.NewEditIndex;
        listLoad1();
    }
    protected void listdata1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        string id = (string)listdata1.DataKeys[e.ItemIndex].Value.ToString();
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        string accommodation_name = (listdata1.Items[e.ItemIndex].FindControl("txtname") as TextBox).Text.Trim();
        string room_type = (listdata1.Items[e.ItemIndex].FindControl("txtaccommodationtype") as TextBox).Text.Trim();
        string ph_no = (listdata1.Items[e.ItemIndex].FindControl("txtphno") as TextBox).Text.Trim();
        string price = (listdata1.Items[e.ItemIndex].FindControl("txtPrice") as TextBox).Text.Trim();
        string facilities = (listdata1.Items[e.ItemIndex].FindControl("txtFacilities") as TextBox).Text.Trim();
        string description = (listdata1.Items[e.ItemIndex].FindControl("txtDescription") as TextBox).Text.Trim();
        string location = (listdata1.Items[e.ItemIndex].FindControl("txtLocation") as TextBox).Text.Trim();
        string status = (listdata1.Items[e.ItemIndex].FindControl("txtStatus") as TextBox).Text.Trim();
        if (accommodation_name != "" && room_type != "" && ph_no != "" && price != "" && facilities != "" && description != "" && location != "" && status != "")
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
                    cmd.CommandText = "update temp_roomlisting set accommodation_name = @accommodation_name, room_type = @room_type, ph_no = @ph_no, price=@price, facilities=@facilities, description=@description, location=@location, status=@status where id = @id";
                    cmd.Parameters.AddWithValue("@accommodation_name", accommodation_name);
                    cmd.Parameters.AddWithValue("@room_type", room_type);
                    cmd.Parameters.AddWithValue("@ph_no", ph_no);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@location", location);
                    cmd.Parameters.AddWithValue("@price", price);
                    cmd.Parameters.AddWithValue("@facilities", facilities);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.ExecuteNonQuery();
                    transaction.Commit();
                    listdata1.EditIndex = -1;
                    listLoad1();
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
    protected void listdata1_ItemCanceling(object sender, ListViewCancelEventArgs e)
    {
        listdata1.EditIndex = -1;
        listLoad1();
    }
    protected void OnDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            DataRowView dr = (DataRowView)e.Item.DataItem;
            string imageUrl1 = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["image1"]);
            string imageUrl2 = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["image2"]);
            string imageUrl3 = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["image3"]);
            string imageUrl4 = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["image4"]);
            string imageUrl5 = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["image5"]);
            (e.Item.FindControl("image1") as Image).ImageUrl = imageUrl1;
            (e.Item.FindControl("image2") as Image).ImageUrl = imageUrl2;
            (e.Item.FindControl("image3") as Image).ImageUrl = imageUrl3;
            (e.Item.FindControl("image4") as Image).ImageUrl = imageUrl4;
            (e.Item.FindControl("image5") as Image).ImageUrl = imageUrl5;
        }
    }
}