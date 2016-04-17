using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TaskSystem.Account
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_Id"] != null)
            {
                Image1.ImageUrl = "data:image/jpg;base64," + Session["User_avatar"].ToString();
                Text1.Value = Session["User_Username"].ToString();
                Text2.Attributes.Add("placeholder", Session["User_Fullname"].ToString());
                Text3.Attributes.Add("placeholder", Session["User_Email"].ToString());
                Text4.Value = Session["User_Role"].ToString();

            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            // Read the file and convert it to Byte Array
            string filePath = FileUpload1.PostedFile.FileName;
            string filename = Path.GetFileName(filePath);
            string ext = Path.GetExtension(filename);

            if (ext == ".jpg")
            {
                //dalej
                Stream fs = FileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                //insert the file into database
                string strQuery = "Update users SET avatar=@avatar WHERE id=" + Session["User_Id"].ToString();
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.Add("@avatar", SqlDbType.Binary).Value = bytes;
                TaskSystem.tools.InsertUpdateData(cmd);
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "File Uploaded Successfully";
                Session["User_avatar"] = Convert.ToBase64String(bytes, 0, bytes.Length);
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "File format not recognised." +
                  " Available .jpg formats";
            }
        }


        private void changeProfile(String fullname, String email)
        {
            SqlCommand cmd = new SqlCommand("Update users SET fullname=@fullname, email=@email WHERE id=" + Session["User_Id"].ToString());
            cmd.Parameters.AddWithValue("@fullname", fullname);
            cmd.Parameters.AddWithValue("@email", email);
            TaskSystem.tools.InsertUpdateData(cmd);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            changePassword(Text5.Value, Text6.Value, Text7.Value);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        private void changePassword(String old, String newPass, String conNewPass)
        {
            if (checkBox(old, newPass, conNewPass) == true)
            {
                if (checkCurrentPassword(old) == true)
                {
                    changePass(newPass);
                    errorId.Visible = false;
                }
                else
                {
                    Label2.Text = "Actual password are not correct!";
                    errorId.Visible = true;
                    succesId.Visible = false;
                }
            }
            else {
                succesId.Visible = false;
            }
            changeProfile(Text2.Value, Text3.Value);
        }

        private void changePass(String newPassword)
        {
                SqlCommand xp = new SqlCommand("UPDATE users SET password=@password WHERE id=" + Session["User_Id"].ToString());
                xp.Parameters.AddWithValue("@password", new TaskSystem.tools().CreateMD5(newPassword));
                TaskSystem.tools.InsertUpdateData(xp);

                if (IsPostBack)
                {
                    Label1.Text = ("Poprawnie zmieniono hasło.");
                    succesId.Visible = true;
                }
        }

        private bool checkCurrentPassword(string password)
        {
            bool flaga = false;
            bool flagaLogin = false;
            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT password FROM users WHERE id=@id", user);

            sql.Parameters.AddWithValue("@id", Session["User_Id"].ToString());
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flagaLogin = dataSet.Tables[0].Rows.Count > 0;
            if (flagaLogin.Equals(true))
            {
                if (dataSet.Tables[0].Rows[0]["password"].ToString() == new TaskSystem.tools().CreateMD5(password))
                {
                    flaga = true;
                }
            }
            return flaga;
        }

        private Boolean checkBox(String old, String newPass, String conNewPass)
        {
            Boolean flaga = true;
            if (old == "")
            {
                Label2.Text = "Field actual password cannot be empty!";
                errorId.Visible = true;
                flaga = false;
            }
            else errorId.Visible = false;

            if (newPass == "")
            {
                Label2.Text = "Field new password cannot be empty!";
                errorId.Visible = true;
                flaga = false;
            }
            else errorId.Visible = false;

            if (conNewPass == "")
            {
                Label2.Text = "Field confirm new password cannot be empty!";
                errorId.Visible = true;
                flaga = false;
            }
            else errorId.Visible = false;

            if (newPass != conNewPass)
            {
                Label2.Text = "Passwords are not the same.";
                errorId.Visible = true;
                flaga = false;
            }
            else errorId.Visible = false;

            if (Text2.Value == "")
            {
                Text2.Value = Session["User_Fullname"].ToString();
            }

            if (Text3.Value == "")
            {
                Text3.Value = Session["User_Email"].ToString();

            }

            return flaga;
        }
    }
}