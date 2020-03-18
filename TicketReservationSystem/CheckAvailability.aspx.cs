using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TicketReservationSystem.Data;

namespace TicketReservationSystem
{
    public partial class CheckAvailability : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataAccess dataAccess = new DataAccess();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBusDetails();
                PanelAvailableStatus.Visible = false;
            }
        }

        private void BindBusDetails()
        {
            using (con = new SqlConnection(ConfigurationManager.AppSettings["Connstr"]))
            {
                con.Open();
                cmd = new SqlCommand("Select * From  BUS_MASTER", con);
                da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ddlBusDetails.DataSource = dt;
                    ddlBusDetails.DataTextField = "Bus_Name";
                    ddlBusDetails.DataValueField = "Bus_Id";
                    ddlBusDetails.DataBind();
                    ddlBusDetails.Items.Insert(0, "Select Bus");
                }
            }
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            string BusId = ddlBusDetails.SelectedValue;
            DateTime JourneyDate = Convert.ToDateTime(txtJourneyDate.Text);

            using (con = new SqlConnection(ConfigurationManager.AppSettings["Connstr"]))
            {
                con.Open();
                string query = "Select count(*) From CHECK_AVAILABILITY where Bus_Id = @busId and Booking_Date = @date " +
                    "and Booking_Status = @status";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("busId", BusId);
                cmd.Parameters.AddWithValue("date", JourneyDate.ToString("dd-MMM-yyyy"));
                cmd.Parameters.AddWithValue("status", 2);
                int bookedCountJourney = int.Parse(cmd.ExecuteScalar().ToString());

                DataSet dsBusDetails = dataAccess.GetBusDetails(int.Parse(BusId));
                if (dsBusDetails.Tables[0].Rows.Count > 0)
                {
                    int TotalSeats = int.Parse(dsBusDetails.Tables[0].Rows[0]["Seats"].ToString());
                    int AvailableSeats = TotalSeats - bookedCountJourney;
                    lblTotalSeats.Text = TotalSeats.ToString();
                    lblBookedSeats.Text = bookedCountJourney.ToString();
                    lblAvailableSeats.Text = AvailableSeats.ToString();
                }
            }
            lblDateStatus.Text = JourneyDate.ToString("dd-MMM-yyyy");
            PanelAvailableStatus.Visible = true;
        }
    }
}