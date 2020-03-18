using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TicketReservationSystem.Data;

namespace TicketReservationSystem
{
    public partial class Login : System.Web.UI.Page
    {
        Logger logger = new Logger();
        DataAccess dataAccess = new DataAccess();
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string Connstr = ConfigurationManager.AppSettings["Connstr"];

            // SqlConnection is in System.Data.SqlClient namespace
            using (con = new SqlConnection(Connstr))
            {
                cmd = new SqlCommand("SP_AuthenticateUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //sqlparameter is in System.Data namespace
                SqlParameter paramUsername = new SqlParameter("@UserName", txtLoginEmail.Text.ToUpper());
                SqlParameter paramPassword = new SqlParameter("@Password", txtPassword.Text.ToUpper());

                cmd.Parameters.Add(paramUsername);
                cmd.Parameters.Add(paramPassword);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                string email = string.Empty;
                string Role = string.Empty;
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Role = ds.Tables[0].Rows[0]["User_Role"].ToString();
                    email = ds.Tables[0].Rows[0]["Login_Id"].ToString();
                }

                Session["LoginEmail"] = email;
                Session["Role"] = Role;
                if (!string.IsNullOrEmpty(email))
                {
                    if (Role == "User")
                    {
                        Response.Redirect("~/UserHome.aspx");
                    }
                    else if (Role == "Admin")
                    {
                        Response.Redirect("~/AdminHome.aspx");
                    }
                }
                else
                {
                    Response.Redirect(Page.ResolveUrl("~/Login.aspx"));
                }
            }
        }

        protected async void btnRegister_Click(object sender, EventArgs e)
        {
            int Count = await dataAccess.CheckEmailDb(txtEmail.Text.Trim());
            int Count1 = await dataAccess.CheckPhoneDb(txtPhone.Text.Trim());
            if (Count == 0 && Count1 == 0)
            {
                try
                {
                    string EncryptPassword = txtPasswordReg.Text;
                    int result = await dataAccess.RegisterUser(txtName.Text.Trim(), txtEmail.Text.Trim(), txtPhone.Text.Trim(), rbtnGender.SelectedItem.Text, EncryptPassword);
                    if (result > 0)
                    {
                        dataAccess.MessageBox(Page, "You have successfully registered with us, Please go to the login page");
                    }
                    else
                    {
                        dataAccess.MessageBox(Page, "You don't have the permission");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowPopup", "$('#modalRegisterForm').modal('show');", true);
                    }
                }
                catch (Exception ex)
                {
                    logger.Log(ex);
                    dataAccess.MessageBox(Page, "Something suspicious");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowPopup", "$('#modalRegisterForm').modal('show');", true);
                }
            }
            else
            {
                dataAccess.MessageBox(Page, "This Email id or phone is already exist");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowPopup", "$('#modalRegisterForm').modal('show');", true);
            }
        }
    }

    public static class ValidateEmail
    {
        public static bool IsValidEmail(this string email)
        {
            var r = new Regex(@"^(?("")("".+?(?<!\\)""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
                    @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-0-9a-z]*[0-9a-z]*\.)+[a-z0-9][\-a-z0-9]{0,22}[a-z0-9]))$");

            return !string.IsNullOrEmpty(email) && r.IsMatch(email);
        }
        public static bool IsValidNumber(this string Pass)
        {
            var r = new Regex(@"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$");

            return !string.IsNullOrEmpty(Pass) && r.IsMatch(Pass);
        }

    }
}