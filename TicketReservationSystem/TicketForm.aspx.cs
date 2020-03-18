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
    public partial class TicketForm : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataAccess dataAccess = new DataAccess();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindLocation();
            }
        }

        private void BindLocation()
        {
            using (con = new SqlConnection(ConfigurationManager.AppSettings["Connstr"]))
            {
                con.Open();
                cmd = new SqlCommand("Select * From Location", con);
                da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ddlSource.DataSource = dt;
                    ddlSource.DataTextField = "LocationName";
                    ddlSource.DataValueField = "LocationName";
                    ddlSource.DataBind();
                    ddlSource.Items.Insert(0, "Select Location");

                    ddlDestination.DataSource = dt;
                    ddlDestination.DataTextField = "LocationName";
                    ddlDestination.DataValueField = "LocationName";
                    ddlDestination.DataBind();
                    ddlDestination.Items.Insert(0, "Select Location");
                }
            }
        }

        protected void btnPayNow_Click(object sender, EventArgs e)
        {
            int result = 0;
            int result1 = 0;
            string PassNo = dataAccess.GeneratePassengerNo();
            string TicketNo = dataAccess.GenerateTicketNo();
            DateTime JourneyDate = Convert.ToDateTime(Session["JourneyDate"].ToString());
            DateTime ReturnDate = Convert.ToDateTime(Session["ReturnDate"].ToString());
            string BusId = Session["BusId"].ToString();
            string Source = ddlSource.SelectedValue;
            string Destination = ddlDestination.SelectedValue;
            int NoOfPassenger = 0;
            if (txtNoOfPassenger.Text == "0")
            {
                NoOfPassenger = 1;
            }
            else
            {
                NoOfPassenger = int.Parse(txtNoOfPassenger.Text);
            }
            
            int Amount = 0;
            int ActualPayAmount = 0;
            DataSet dsBusDetails = dataAccess.GetBusDetails(int.Parse(BusId));
            if (dsBusDetails.Tables[0].Rows.Count > 0)
            {
                Amount = int.Parse(dsBusDetails.Tables[0].Rows[0]["Bus_Price"].ToString());
            }
            ActualPayAmount = Amount * NoOfPassenger;
            string query1 = "Insert into BOOKING_MASTER(P_No, T_No, Source, Destination, JourneyDate, ReturnDate, Time_Stamp, T_Amount, Bus_Id, NoOfPassenger, Booking_Status, Book_By_Id)" +
                "values('" + PassNo + "', '" + TicketNo + "', '" + Source + "', '" + Destination + "', " +
                "'" + JourneyDate.ToString("dd-MMM-yyyy") + "', '" + ReturnDate.ToString("dd-MMM-yyyy") + "', GETDATE(), '" + ActualPayAmount + "', " +
                "'" + BusId + "', '" + NoOfPassenger + "', 2, '" + Session["LoginEmail"].ToString() + "')";

            string query2 = "Insert into CHECK_AVAILABILITY(P_No, T_No, Booking_Date, Booking_Status, Bus_Id) values('" + PassNo + "', '" + TicketNo + "', " +
                "'" + JourneyDate.ToString("dd-MMM-yyyy") + "', 2, '" + BusId + "')";

            
            if (Session["ReturnDate"] == null || Session["ReturnDate"].ToString() == null || Session["ReturnDate"].ToString() == "")
            {

            }
            else
            {
                string query3 = "Insert into CHECK_AVAILABILITY(P_No, T_No, Booking_Date, Booking_Status, Bus_Id) values('" + PassNo + "', '" + TicketNo + "', " +
                "'" + ReturnDate.ToString("dd-MMM-yyyy") + "', 2, '" + BusId + "')";
                result1 = dataAccess.Insert_Booking_Table(query3);
            }
            string query4 = "Insert into PASSENGER_MASTER(P_No, P_Name, P_Age, T_No, P_Address, P_Mobile, Gender, Time_Stamp) values('" + PassNo + "', " +
                "'" + txtPName.Text + "', '" + txtPAge.Text + "', '" + TicketNo + "', '" + txtPAddress.Text + "', '" + txtPMobile.Text + "', " +
                "'" + ddlGender.SelectedValue + "', GETDATE())";

            string query5 = "Insert into TICKET_MASTER(T_No, P_No, T_Amount, Source, Destination, JourneyDate, ReturnDate, Time_Stamp) " +
                "values('" + TicketNo + "', '" + PassNo + "', '" + ActualPayAmount + "', '" + Source + "', '" + Destination + "', '" + JourneyDate.ToString("dd-MMM-yyyy") + "', " +
                "'" + ReturnDate.ToString("dd-MMM-yyyy") + "', GETDATE())";

            result = dataAccess.Insert_Booking_Table(query1, query2, query4, query5);

            string CommonPassword = "Booking@123";
            string Role = "User";
            int resultUser = dataAccess.RegisterUser(txtPName.Text.Trim(), txtEmail.Text.Trim(), txtPMobile.Text.Trim(), ddlGender.SelectedValue, CommonPassword, Role);
            if (result > 0)
            {
                Response.Redirect(string.Format("~/BookingReceipt.aspx?pNo={0}&tNo={1}", PassNo, TicketNo));
            }
            else
            {
                dataAccess.MessageBox(Page, "Something goes wrong, Please try again later!");
            }
        }
    }
}