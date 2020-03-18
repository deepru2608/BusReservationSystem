using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TicketReservationSystem.Data;

namespace TicketReservationSystem
{
    public partial class AddVendor : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PanelIdPassword.Visible = false;
            }
        }

        protected void btnAddNewVendor_Click(object sender, EventArgs e)
        {
            string Password = "Proton@123";
            string Role = "Vendor";
            int result = dataAccess.RegisterUser(txtVendorName.Text.Trim(), txtVendorEmail.Text.Trim(), txtVendorMobile.Text.Trim(), ddlGender.SelectedValue, Password, Role);
            if (result > 0)
            {
                lblShowEmail.Text = txtVendorEmail.Text;
                lblShowPassword.Text = Password;
                PanelIdPassword.Visible = true;
                dataAccess.MessageBox(Page, "Vendor added successfully.");
                txtVendorEmail.Text = "";
                txtVendorMobile.Text = "";
                txtVendorName.Text = "";
                ddlGender.SelectedIndex = 0;
            }
            else
            {
                dataAccess.MessageBox(Page, "Something goes wrong, Please try again later!");
            }
        }
    }
}