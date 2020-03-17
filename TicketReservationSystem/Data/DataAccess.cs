using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Security;
using System.Web.UI;

namespace TicketReservationSystem.Data
{
    public class DataAccess
    {
        Logger logger = new Logger();
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;

        public async Task<int> RegisterUser(string Name, string Email, string Mobile, string Gender, string PassWord)
        {
            string Connstr = ConfigurationManager.AppSettings["Connstr"];
            SqlTransaction transaction = null;
            using (con = new SqlConnection(Connstr))
            {
                int result;
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    transaction = con.BeginTransaction();
                    cmd = new SqlCommand("SP_ACCOUNT_MODULE", con, transaction);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@User_Choice", "Register");
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@Email", Email);
                    cmd.Parameters.AddWithValue("@Mobile", Mobile);
                    cmd.Parameters.AddWithValue("@Password", PassWord);
                    cmd.Parameters.AddWithValue("@Gender", Gender);
                    result = await cmd.ExecuteNonQueryAsync();
                    transaction.Commit();
                }
                catch (Exception oraExp)
                {
                    transaction.Rollback();
                    result = 0;
                    logger.Log(oraExp);
                }
                finally
                {
                    cmd.Dispose();
                    if (con != null)
                    {
                        con.Close();
                    }
                }
                return result;
            }
        }

        #region Check Email Existance
        public async Task<int> CheckEmailDb(string Email)
        {
            string Connstr = ConfigurationManager.AppSettings["Connstr"];
            using (con = new SqlConnection(Connstr))
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd = new SqlCommand($"Select IsNull(count(Email), 0)as Email from REGISTER_DETAILS where Email = '{Email}'", con);
                var Temp = await cmd.ExecuteScalarAsync();
                return Convert.ToInt32(Temp);
            }
        }
        #endregion

        #region Check Phone Existance
        public async Task<int> CheckPhoneDb(string Phone)
        {
            string Connstr = ConfigurationManager.AppSettings["Connstr"];
            using (con = new SqlConnection(Connstr))
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd = new SqlCommand($"Select IsNull(count(Phone), 0)as Mobile from REGISTER_DETAILS where Phone = '{Phone}'", con);
                var Temp = await cmd.ExecuteScalarAsync();
                return Convert.ToInt32(Temp);
            }
        }
        #endregion

        #region Show Message Popup
        public void MessageBox(Page page, string msg)
        {
            ScriptManager.RegisterClientScriptBlock(page, page.GetType(), "Key", "<script language='javascript'>alert('" + msg + "');</script>", false);
        }
        #endregion
    }
}