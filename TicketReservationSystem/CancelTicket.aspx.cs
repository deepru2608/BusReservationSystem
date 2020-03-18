using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TicketReservationSystem.Data;

namespace TicketReservationSystem
{
    public partial class CancelTicket : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataAccess dataAccess = new DataAccess();
        static string TicketNo;
        static string PassNo;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PanelCancel.Visible = false;
            }
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            TicketNo = txtTicketId.Text.ToUpper();
            PassNo = txtPassId.Text.ToUpper();
            string query = "Select a.T_No, a.P_No, Source, Destination, a.JourneyDate, a.ReturnDate, a.Time_Stamp, b.P_Name, b.P_Age, " +
                "b.P_Address, b.P_Mobile, b.Gender, a.T_Amount from BOOKING_MASTER a join PASSENGER_MASTER b on a.P_No = b.P_No where " +
                "a.T_No = '" + TicketNo + "' and a.P_No = '" + PassNo + "'";
            DataSet ds = dataAccess.GetDataFromDB(query);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblTicketNoAgain.Text = ds.Tables[0].Rows[0]["T_No"].ToString();
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

            PanelCancel.Visible = true;
        }

        protected void btnCancelNow_Click(object sender, EventArgs e)
        {
            string query1 = "Update BOOKING_MASTER set Booking_Status = 4 where T_No = '" + TicketNo + "' and P_No = '" + PassNo + "'";
            string query2 = "Update CHECK_AVAILABILITY set Booking_Status = 4 where T_No = '" + TicketNo + "' and P_No = '" + PassNo + "'";
            string CancelId = "C_" + TicketNo;
            string query3 = "Insert into CANCEL_MASTER(Cancel_Id, Cancel_TimeStamp, P_No, T_No) values('" + CancelId + "', GETDATE(), " +
                "'" + PassNo + "', '" + TicketNo + "')";
            int result = dataAccess.Insert_Booking_Table(query1, query2, query3);
            if (result > 0)
            {
                Response.Redirect(string.Format("~/CancelReceipt.aspx?pNo={0}&tNo={1}", PassNo, TicketNo));
            }
            else
            {
                dataAccess.MessageBox(Page, "Something goes wrong, Please try again later!");
            }
        }
    }
}