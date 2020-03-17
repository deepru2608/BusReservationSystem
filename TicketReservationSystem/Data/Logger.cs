using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace TicketReservationSystem.Data
{
    public class Logger
    {
        public void Log(Exception exception)
        {
            StringBuilder sbExceptionMessage = new StringBuilder();
            do
            {
                sbExceptionMessage.Append("Exception Type" + Environment.NewLine);
                sbExceptionMessage.Append(exception.GetType().Name);
                sbExceptionMessage.Append(Environment.NewLine + Environment.NewLine);
                sbExceptionMessage.Append("Message" + Environment.NewLine);
                sbExceptionMessage.Append(exception.Message + Environment.NewLine + Environment.NewLine);
                sbExceptionMessage.Append("Stack Trace" + Environment.NewLine);
                sbExceptionMessage.Append(exception.StackTrace + Environment.NewLine + Environment.NewLine);

                exception = exception.InnerException;
            }
            while (exception != null);

            LogToDB(sbExceptionMessage.ToString());
        }

        private void LogToDB(string logData)
        {
            SqlConnection con;
            SqlDataAdapter da;
            SqlCommand cmd;

            string connectionString = ConfigurationManager.AppSettings["Connstr"];

            using (con = new SqlConnection(connectionString))
            {
                con.Open();
                cmd = new SqlCommand("SP_Some_OtherTask", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@LogData", logData);
                cmd.Parameters.AddWithValue("@UserChoice", "LogException");
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}