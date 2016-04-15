using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;

namespace TaskSystem
{
    public class tools : Page
    {
        public bool checkLoginAndPassword(string username, string password)
        {
            bool flaga = false;

            SqlConnection vid = GetConnection();
            {
                SqlCommand xp = new SqlCommand("SELECT * FROM users WHERE username=@username and password=@password;", vid);
                xp.Parameters.AddWithValue("@username", username);
                xp.Parameters.AddWithValue("@password", CreateMD5(password));
                vid.Open();
                DataSet dataSet = new DataSet();
                SqlDataAdapter datauser = new SqlDataAdapter(xp);
                datauser.Fill(dataSet);
                bool flagaSql = dataSet.Tables[0].Rows.Count > 0;
                if (flagaSql.Equals(true))
                {
                        Session["User_Id"] = dataSet.Tables[0].Rows[0]["id"].ToString();
                        Session["User_Username"] = dataSet.Tables[0].Rows[0]["username"].ToString();
                        Session["User_Fullname"] = dataSet.Tables[0].Rows[0]["fullname"].ToString();
                        Session["User_Role"] = dataSet.Tables[0].Rows[0]["role"].ToString();
                        Session["User_Email"] = dataSet.Tables[0].Rows[0]["email"].ToString();

                        byte[] bytes = (byte[])dataSet.Tables[0].Rows[0]["avatar"];
                        Session["User_avatar"] = Convert.ToBase64String(bytes, 0, bytes.Length);
                       
                        flaga = true;
                }
                vid.Close();
            }
            return flaga;
        }

        public static DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                    }
                }
                return dt;
            }
        }


        public static SqlConnection GetConnection()
        {
            //create the connection object
            return new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        }

        public static Boolean InsertUpdateData(SqlCommand cmd)
        {
            SqlConnection con = GetConnection();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                System.Web.HttpContext.Current.Response.Write(ex.Message);
                return false;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }

        public string CreateMD5(string input)
        {
            MD5 md5 = System.Security.Cryptography.MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
            byte[] hashBytes = md5.ComputeHash(inputBytes);

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hashBytes.Length; i++)
            {
                sb.Append(hashBytes[i].ToString("X2"));
            }
            return sb.ToString();
        }
    }
}