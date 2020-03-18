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
using System.IO;

namespace TicketReservationSystem.Data
{
    public class DataAccess
    {
        Logger logger = new Logger();
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;

        public int RegisterUser(string Name, string Email, string Mobile, string Gender, string PassWord, string Role)
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
                    cmd.Parameters.AddWithValue("@Role", Role);
                    result = cmd.ExecuteNonQuery();
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
        public int CheckEmailDb(string Email)
        {
            string Connstr = ConfigurationManager.AppSettings["Connstr"];
            using (con = new SqlConnection(Connstr))
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd = new SqlCommand($"Select IsNull(count(Email), 0)as Email from REGISTER_DETAILS where Email = '{Email}'", con);
                var Temp = cmd.ExecuteScalar();
                return Convert.ToInt32(Temp);
            }
        }
        #endregion

        #region Check Phone Existance
        public int CheckPhoneDb(string Phone)
        {
            string Connstr = ConfigurationManager.AppSettings["Connstr"];
            using (con = new SqlConnection(Connstr))
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd = new SqlCommand($"Select IsNull(count(Phone), 0)as Mobile from REGISTER_DETAILS where Phone = '{Phone}'", con);
                var Temp = cmd.ExecuteScalar();
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

        #region Get Bus Details
        public DataSet GetBusDetails(int BusId)
        {
            string Connstr = ConfigurationManager.AppSettings["Connstr"];
            using (con = new SqlConnection(Connstr))
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd = new SqlCommand("Select * From  BUS_MASTER where Bus_Id = @id", con);
                cmd.Parameters.AddWithValue("id", BusId);
                da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }
        #endregion

        #region Create Log File
        public void LogMessageToFile(string errorMessage, string errorDetails)//how to use log -utility.LogMessageToFile("log start", "108");
        {
            string directory = "~/Logs";
            if ((!Directory.Exists(System.Web.HttpContext.Current.Server.MapPath(directory))))
            {
                Directory.CreateDirectory(System.Web.HttpContext.Current.Server.MapPath(directory));
            }

            string file = "~/Logs/" + "Exception_Log" + "_" + DateTime.Now.Date.ToString("dd-MM-yyyy") + ".txt";
            if ((!File.Exists(System.Web.HttpContext.Current.Server.MapPath(file))))
            {
                File.Create(System.Web.HttpContext.Current.Server.MapPath(file)).Close();
            }

            using (StreamWriter w = File.AppendText(System.Web.HttpContext.Current.Server.MapPath(file)))
            {
                w.WriteLine("Log Entry : ");
                w.WriteLine("Team Name: " + "Deepak Sir And Deepasnhu Ruhela");
                w.WriteLine("Error Time: " + DateTime.Now);
                w.WriteLine("Error Message: " + errorMessage);
                w.WriteLine("Error Details: " + errorDetails);
                w.WriteLine("_____________________________________________________________________");
                w.Flush();
                w.Close();
            }
        }
        #endregion

        #region Create Log File
        public void LogMessageToFile(string errorMessage, string errorDetails, string errorSource)//how to use log -utility.LogMessageToFile("log start", "108");
        {
            string directory = "~/Logs";
            if ((!Directory.Exists(System.Web.HttpContext.Current.Server.MapPath(directory))))
            {
                Directory.CreateDirectory(System.Web.HttpContext.Current.Server.MapPath(directory));
            }

            string file = "~/Logs/" + "Exception_Log" + "_" + DateTime.Now.Date.ToString("dd-MM-yyyy") + ".txt";
            if ((!File.Exists(System.Web.HttpContext.Current.Server.MapPath(file))))
            {
                File.Create(System.Web.HttpContext.Current.Server.MapPath(file)).Close();
            }

            using (StreamWriter w = File.AppendText(System.Web.HttpContext.Current.Server.MapPath(file)))
            {
                w.WriteLine("Log Entry : ");
                w.WriteLine("Team Name: " + "Deepak Sir And Deepasnhu");
                w.WriteLine("Error Time: " + DateTime.Now);
                w.WriteLine("Error Message: " + errorMessage);
                w.WriteLine("Error Details: " + errorDetails);
                w.WriteLine("Error Source: " + errorSource);
                w.WriteLine("_____________________________________________________________________");
                w.Flush();
                w.Close();
            }
        }
        #endregion


        #region Insert Three Record at same time with 1 Parameter
        public int Insert_Booking_Table(string query1)
        {
            int result = 0;
            string conString = ConfigurationSettings.AppSettings["Connstr"];
            SqlConnection con = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlTransaction ot = null;
            try
            {
                con.ConnectionString = conString;
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                con.Open();

                ot = con.BeginTransaction();

                cmd.Connection = con;
                cmd.CommandText = query1;
                cmd.Transaction = ot;
                result = cmd.ExecuteNonQuery();

                ot.Commit();
            }
            catch (SqlException oraExp)
            {
                ot.Rollback();
                result = 0;
                LogMessageToFile(oraExp.Message, oraExp.StackTrace);

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
        #endregion

        #region Insert Three Record at same time with 2 Parameter
        public int Insert_Booking_Table(string query1, string query2)
        {
            int result = 0;
            string conString = ConfigurationSettings.AppSettings["Connstr"];
            SqlConnection con = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlTransaction ot = null;
            try
            {
                con.ConnectionString = conString;
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                con.Open();

                ot = con.BeginTransaction();

                cmd.Connection = con;
                cmd.CommandText = query1;
                cmd.Transaction = ot;
                result = cmd.ExecuteNonQuery();

                cmd.Connection = con;
                cmd.CommandText = query2;
                cmd.Transaction = ot;
                result = cmd.ExecuteNonQuery();

                ot.Commit();
            }
            catch (SqlException oraExp)
            {
                ot.Rollback();
                result = 0;
                LogMessageToFile(oraExp.Message, oraExp.StackTrace);

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
        #endregion

        #region Insert Three Record at same time with 3 Parameter
        public int Insert_Booking_Table(string query1, string query2, string query3)
        {
            int result = 0;
            string conString = ConfigurationSettings.AppSettings["Connstr"];
            SqlConnection con = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlTransaction ot = null;
            try
            {
                con.ConnectionString = conString;
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                con.Open();

                ot = con.BeginTransaction();

                cmd.Connection = con;
                cmd.CommandText = query1;
                cmd.Transaction = ot;
                result = cmd.ExecuteNonQuery();

                cmd.Connection = con;
                cmd.CommandText = query2;
                cmd.Transaction = ot;
                result = cmd.ExecuteNonQuery();

                cmd.Connection = con;
                cmd.CommandText = query3;
                cmd.Transaction = ot;
                result = cmd.ExecuteNonQuery();


                ot.Commit();
            }
            catch (SqlException oraExp)
            {
                ot.Rollback();
                result = 0;
                LogMessageToFile(oraExp.Message, oraExp.StackTrace);
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
        #endregion

        #region Insert Three Record at same time with 3 Parameter
        public int Insert_Booking_Table(string query1, string query2, string query3, string query4)
        {
            int result = 0;
            string conString = ConfigurationSettings.AppSettings["Connstr"];
            SqlConnection con = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlTransaction ot = null;
            try
            {
                con.ConnectionString = conString;
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                con.Open();

                ot = con.BeginTransaction();

                cmd.Connection = con;
                cmd.CommandText = query1;
                cmd.Transaction = ot;
                result = cmd.ExecuteNonQuery();

                cmd.Connection = con;
                cmd.CommandText = query2;
                cmd.Transaction = ot;
                result = cmd.ExecuteNonQuery();

                cmd.Connection = con;
                cmd.CommandText = query3;
                cmd.Transaction = ot;
                result = cmd.ExecuteNonQuery();

                cmd.Connection = con;
                cmd.CommandText = query4;
                cmd.Transaction = ot;
                result = cmd.ExecuteNonQuery();

                ot.Commit();
            }
            catch (SqlException oraExp)
            {
                ot.Rollback();
                result = 0;
                LogMessageToFile(oraExp.Message, oraExp.StackTrace);

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
        #endregion

        #region Generate Passenger No

        public string GeneratePassengerNo()
        {
            string Connstr = ConfigurationManager.AppSettings["Connstr"];
            using (con = new SqlConnection(Connstr))
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string PassNo = string.Empty;
                cmd = new SqlCommand("Insert into AutoIdGenerate values(GETDATE())", con);
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    cmd = new SqlCommand("Select MAX(Id) as ID From AutoIdGenerate", con);
                    da = new SqlDataAdapter(cmd);
                    int Id = int.Parse(cmd.ExecuteScalar().ToString());
                    PassNo = "P" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + "@" + Id;
                }

                return PassNo;
            }
        }
        #endregion

        #region Generate Passenger No

        public string GenerateTicketNo()
        {
            string Connstr = ConfigurationManager.AppSettings["Connstr"];
            using (con = new SqlConnection(Connstr))
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string TicketNo = string.Empty;
                cmd = new SqlCommand("Insert into AutoIdTicketGenerate values(GETDATE())", con);
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    cmd = new SqlCommand("Select MAX(Id) as ID From AutoIdTicketGenerate", con);
                    da = new SqlDataAdapter(cmd);
                    int Id = int.Parse(cmd.ExecuteScalar().ToString());
                    TicketNo = "T" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + "@" + Id;
                }

                return TicketNo;
            }
        }
        #endregion

        #region Get Data into DataSet
        public DataSet GetDataFromDB(string query)
        {
            DataSet result = new DataSet();
            string conString = ConfigurationSettings.AppSettings["Connstr"];
            using (con = new SqlConnection(conString))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    cmd = new SqlCommand(query, con);
                    da = new SqlDataAdapter(cmd);
                    da.Fill(result);
                }
                catch (SqlException oraExp)
                {
                    LogMessageToFile(oraExp.Message, oraExp.StackTrace);

                }
                finally
                {
                    cmd.Dispose();
                    if (con != null)
                    {
                        con.Close();
                    }
                }
            }
            return result;
        }
        #endregion
    }
}