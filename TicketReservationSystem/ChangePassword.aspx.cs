using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TicketReservationSystem.Data;

namespace TicketReservationSystem
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();

        protected void Page_Load(object sender, EventArgs e)
        {
            string Role = Session["LoginEmail"].ToString();
            if (Role == "User")
            {
                this.MasterPageFile = Page.ResolveUrl("~/UserMaster.master");
            }
            else if (Role == "Admin")
            {
                this.MasterPageFile = Page.ResolveUrl("~/AdminMaster.master");
            }
            else if (Role == "Vendor")
            {
                this.MasterPageFile = Page.ResolveUrl("~/VendorMaster.master");
            }
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            string Email = Session["LoginEmail"].ToString();
            string queryCheck = "Select count(*) From LOGIN_DETAILS where Login_Id = '" + Email + "' and Password = '" + txtCurrentPassword.Text + "'";
            string count = dataAccess.CheckOldPassword(queryCheck);
            if (count != "0")
            {
                string query = "Update LOGIN_DETAILS set Password = '" + txtNewPassword.Text + "' where Login_Id = '" + Email + "'";
                string query1 = "Update REGISTER_DETAILS set Password = '" + txtNewPassword.Text + "' where Email = '" + Email + "'";
                int result = dataAccess.Insert_Booking_Table(query, query1);
                if (result > 0)
                {
                    dataAccess.MessageBox(Page, "Password has been changed successfullt.");
                    txtConfirmPassword.Text = "";
                    txtCurrentPassword.Text = "";
                    txtNewPassword.Text = "";
                }
                else
                {
                    dataAccess.MessageBox(Page, "Something goes wrong, please try again later!");
                }
            }
            else
            {
                dataAccess.MessageBox(Page, "Old password is incorrect!");
            }
        }
    }
}