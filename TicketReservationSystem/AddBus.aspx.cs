using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TicketReservationSystem.Data;

namespace TicketReservationSystem
{
    public partial class AddBus : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddNewBus_Click(object sender, EventArgs e)
        {
            string query = "Insert into [BUS_MASTER] values('"+ txtBusName.Text + "', '" + txtBusPrice.Text + "', '" + txtSeats.Text + "')";
            int result = dataAccess.Insert_Booking_Table(query);
            if (result > 0)
            {
                dataAccess.MessageBox(Page, "Bus added successfully.");
                txtBusName.Text = "";
                txtBusPrice.Text = "";
                txtSeats.Text = "";
            }
            else
            {
                dataAccess.MessageBox(Page, "Something goes wrong, Please try again later!");
            }
        }
    }
}