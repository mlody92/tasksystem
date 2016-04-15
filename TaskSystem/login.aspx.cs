using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskSystem
{
    public partial class login : System.Web.UI.Page
    {
        TaskSystem.tools tools = new TaskSystem.tools();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Boolean fl = true;
            if (TextBox1.Text == "")
            {
                Label1.Visible = true;
                Label1.Text = "Pole nazwa użytkownika nie może być puste.";
                fl = false;
            }
            else if (TextBox2.Text == "")
            {
                Label1.Visible = true;
                Label1.Text = "Pole haslo nie może być puste.";
                fl = false;
            }
            if (fl == true)
            {
                if (tools.checkLoginAndPassword(TextBox1.Text, TextBox2.Text))
                {
                    Response.Redirect("~/index.aspx");
                }
                else
                {
                    //Response.Redirect(Request.RawUrl);
                    Label1.Visible = true;
                    Label1.Text = "Niepoprawny login lub hasło. Spróbuj ponownie.";
                }
            }
        }
    }
}