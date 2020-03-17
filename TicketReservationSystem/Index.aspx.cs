using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TicketReservationSystem
{
    public partial class Index : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Request.QueryString["role"] == "User")
            {
                this.MasterPageFile = Page.ResolveUrl("~/UserMsater.master");
            }
            else if (Request.QueryString["role"] == "Admin")
            {
                this.MasterPageFile = Page.ResolveUrl("~/AdminMsater.master");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["LoginEmail"]) == "" || Convert.ToString(Session["LoginEmail"]) == null)
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

        private async void BindDetails()
        {
            using (con = new SqlConnection(ConfigurationManager.AppSettings["Connstr"]))
            {
                con.Open();
                cmd = new SqlCommand($"Select * From REGISTER_DETAILS where Upper(Email) = {Session["LoginEmail"].ToString()}", con);
                SqlDataReader dr = await cmd.ExecuteReaderAsync();
                if (await dr.ReadAsync())
                {
                    lblName.Text = dr["Name"].ToString();
                }
            }
        }
    }
}