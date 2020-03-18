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
    public partial class PessengerDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DateTime DateFrom = Convert.ToDateTime(txtDateFrom.Text);
            DateTime DateTo = Convert.ToDateTime(txtDateTo.Text);
            using (con = new SqlConnection(ConfigurationManager.AppSettings["Connstr"]))
            {
                con.Open();
                string query = "Select a.P_No, a.T_No, Source, Destination, Booking_Date, a.Booking_Status, T_Amount, NoOfPassenger From BOOKING_MASTER a " +
                "join CHECK_AVAILABILITY b on a.P_No = b.P_No where Booking_Date between '" + DateFrom.ToString("dd-MMM-yyyy") + "' and '" + DateTo.ToString("dd-MMM-yyyy") + "'";
                cmd = new SqlCommand(query, con);
                da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    PassengerRepeater.DataSource = dt;
                    PassengerRepeater.DataBind();
                }
                else
                {
                    PassengerRepeater.DataSource = dt;
                    PassengerRepeater.DataBind();
                }
            }
        }

        protected void PassengerRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
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

                Label JourneyDate = e.Item.FindControl("lblBookingDate") as Label;
                if (JourneyDate.Text != null || JourneyDate.Text != "")
                {
                    DateTime JourneyDateData = Convert.ToDateTime(JourneyDate.Text);
                    JourneyDate.Text = JourneyDateData.ToString("dd-MMM-yyyy");
                }
                else
                {
                    JourneyDate.Text = "NA";
                }
            }
        }
    }
}