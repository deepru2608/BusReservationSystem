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
    public partial class AdminHome : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;

        protected void Page_PreInit(object sender, EventArgs e)
        {
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginEmail"] == null || Session["LoginEmail"].ToString() == "")
            {
                Response.Redirect(Page.ResolveUrl("~/Login.aspx"));
            }
            else
            {
                if (!IsPostBack)
                {
                    BindDetails();
                }
            }
        }

        private void BindDetails()
        {
            using (con = new SqlConnection(ConfigurationManager.AppSettings["Connstr"]))
            {
                string email = Session["LoginEmail"].ToString();
                con.Open();
                cmd = new SqlCommand("Select * From REGISTER_DETAILS where Upper(Email) = @loginEmail", con);
                cmd.Parameters.AddWithValue("loginEmail", email.ToUpper());
                da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    lblName.Text = dt.Rows[0]["Name"].ToString();
                }
            }
        }
    }
}