using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TicketReservationSystem
{
    public partial class UserList : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRegiseredUser();
            }
        }

        private void BindRegiseredUser()
        {
            using (con = new SqlConnection(ConfigurationManager.AppSettings["Connstr"]))
            {
                con.Open();
                string query = "Select Name, Email, Phone, Gender, User_Role from LOGIN_DETAILS a join REGISTER_DETAILS b on a.Login_Id = b.Email";
                cmd = new SqlCommand(query, con);
                da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    UsersRepeater.DataSource = dt;
                    UsersRepeater.DataBind();
                }
                else
                {
                    UsersRepeater.DataSource = dt;
                    UsersRepeater.DataBind();
                }
            }
        }
    }
}