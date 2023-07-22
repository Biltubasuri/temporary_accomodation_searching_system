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
        if (Session["aadhaarno"] != "")
        {
            if (!this.IsPostBack)
            {
                string cs1 = ConfigurationManager.ConnectionStrings["DBCS1"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(cs1))
                {
                    using (SqlDataAdapter sda1 = new SqlDataAdapter("select * from temp_roomlisting where status = 'live'", conn))
                    {
                        DataTable dt1 = new DataTable();
                        sda1.Fill(dt1);
                        listdata1.DataSource = dt1;
                        listdata1.DataBind();
                    }
                }
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