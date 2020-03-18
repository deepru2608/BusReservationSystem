using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TicketReservationSystem
{
    public partial class UserHome1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;

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

            using (con = new SqlConnection(ConfigurationManager.AppSettings["Connstr"]))
            {
                string email = Session["LoginEmail"].ToString();
                con.Open();
                string query = "Select P_No, T_No, Source, Destination, JourneyDate, ReturnDate, Booking_Status, T_Amount, NoOfPassenger From BOOKING_MASTER " +
                    "where Upper(User_Mapping) = @loginEmail";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("loginEmail", email.ToUpper());
                da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    TicketRepeater.DataSource = dt;
                    TicketRepeater.DataBind();
                }
                else
                {
                    TicketRepeater.DataSource = dt;
                    TicketRepeater.DataBind();
                }
            }
        }

        protected void TicketRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label Status = e.Item.FindControl("lblStatus") as Label;
                if (Status.Text == "2")
                {
                    Status.Text = "Booked";
                    Status.ForeColor = Color.DarkGreen;
                }
                else if (Status.Text == "3")
                {
                    Status.Text = "Pending";
                    Status.ForeColor = Color.BlueViolet;
                }
                else if (Status.Text == "4")
                {
                    Status.Text = "Cancel";
                    Status.ForeColor = Color.Red;
                }

                Label JourneyDate = e.Item.FindControl("lblJourneyDate") as Label;
                Label ReturnDate = e.Item.FindControl("lblReturnDate") as Label;
                if (JourneyDate.Text != null || JourneyDate.Text != "")
                {
                    DateTime JourneyDateData = Convert.ToDateTime(JourneyDate.Text);
                    JourneyDate.Text = JourneyDateData.ToString("dd-MMM-yyyy");
                }

                if (ReturnDate.Text != null || ReturnDate.Text != "")
                {
                    DateTime ReturnDateData = Convert.ToDateTime(ReturnDate.Text);
                    ReturnDate.Text = ReturnDateData.ToString("dd-MMM-yyyy");
                }
                else
                {
                    ReturnDate.Text = "NA";
                }
            }
        }

        protected void TicketRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label TicketNo = e.Item.FindControl("lblTicketId") as Label;
            Label Status = e.Item.FindControl("lblStatus") as Label;
            string CmdName = e.CommandName;
            string CmdValue = e.CommandArgument.ToString();
            if (CmdName == "SingleProcess")
            {
                if (Status.Text == "Booked")
                {
                    Response.Redirect(string.Format("~/BookingReceipt.aspx?pNo={0}&tNo={1}", CmdValue, TicketNo.Text));
                }
                else if (Status.Text == "Cancel")
                {
                    Response.Redirect(string.Format("~/CancelReceipt.aspx?pNo={0}&tNo={1}", CmdValue, TicketNo.Text));
                }
            }
        }
    }
}