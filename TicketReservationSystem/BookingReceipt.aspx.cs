using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TicketReservationSystem.Data;

namespace TicketReservationSystem
{
    public partial class BookingReceipt : System.Web.UI.Page
    {
        static string PassNo;
        static string TicketNo;
        DataAccess dataAccess = new DataAccess();

        protected void Page_Load(object sender, EventArgs e)
        {
            PassNo = Request.QueryString["pNo"];
            TicketNo = Request.QueryString["tNo"];
            if (!IsPostBack)
            {
                BindPrintData();
            }
        }

        private void BindPrintData()
        {
            string query = "Select a.T_No, a.P_No, Source, Destination, a.JourneyDate, a.ReturnDate, a.Time_Stamp, b.P_Name, b.P_Age, " +
                "b.P_Address, b.P_Mobile, b.Gender, a.T_Amount from BOOKING_MASTER a join PASSENGER_MASTER b on a.P_No = b.P_No where " +
                "a.T_No = '" + TicketNo + "' and a.P_No = '"+ PassNo + "' and Booking_Status = 2";
            DataSet ds = dataAccess.GetDataFromDB(query);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblTicketNo.Text = ds.Tables[0].Rows[0]["T_No"].ToString();
                lblTicketNoAgain.Text = ds.Tables[0].Rows[0]["T_No"].ToString();
                lblPassNo.Text = ds.Tables[0].Rows[0]["P_No"].ToString();
                lblSource.Text = ds.Tables[0].Rows[0]["Source"].ToString();
                lblDestination.Text = ds.Tables[0].Rows[0]["Destination"].ToString();
                DateTime JourneyDate = Convert.ToDateTime(ds.Tables[0].Rows[0]["JourneyDate"].ToString());
                DateTime ReturnDate = Convert.ToDateTime(ds.Tables[0].Rows[0]["ReturnDate"].ToString());
                DateTime ProcessDate = Convert.ToDateTime(ds.Tables[0].Rows[0]["Time_Stamp"].ToString());
                lblJourneyDate.Text = JourneyDate.ToString("dd-MMM-yyyy");
                lblReturnDate.Text = ReturnDate.ToString("dd-MMM-yyyy");
                lblProcessDate.Text = ProcessDate.ToString("dd-MMM-yyyy");
                lblPassengerName.Text = ds.Tables[0].Rows[0]["P_Name"].ToString();
                lblAge.Text = ds.Tables[0].Rows[0]["P_Age"].ToString();
                lblAddress.Text = ds.Tables[0].Rows[0]["P_Address"].ToString();
                lblMobile.Text = ds.Tables[0].Rows[0]["P_Mobile"].ToString();
                lblGender.Text = ds.Tables[0].Rows[0]["Gender"].ToString();
                lblAmount.Text = ds.Tables[0].Rows[0]["T_Amount"].ToString();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserHome.aspx");
        }
    }
}