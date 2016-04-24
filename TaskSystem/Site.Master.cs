using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace TaskSystem
{
    public partial class SiteMaster : MasterPage
    {
        //private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        //private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        //private string _antiXsrfTokenValue;
        public TaskSystem.tools tools = new TaskSystem.tools();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_Id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            else
            {
                Label1.Text = Session["User_Fullname"].ToString();
                //Label2.Text = Session["User_Role"].ToString(); 
                Image1.ImageUrl = "data:image/jpg;base64," + Session["User_avatar"].ToString();
                dataProject();

            }
        }

        private void dataProject()
        {
            DataTable dt = TaskSystem.tools.GetData("SELECT [id], [project] FROM [project] ORDER BY [id]");
            DropDownList1.DataTextField = "project";
            DropDownList1.DataValueField = "id";
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();

            DataTable dt2 = TaskSystem.tools.GetData("SELECT [id], [username] FROM [users] ORDER BY [id]");
            DropDownList7.DataTextField = "username";
            DropDownList7.DataValueField = "id";
            DropDownList7.DataSource = dt2;
            DropDownList7.DataBind();

            DataTable dt3 = TaskSystem.tools.GetData("SELECT [id], [name] FROM [type] ORDER BY [id]");
            DropDownList2.DataTextField = "name";
            DropDownList2.DataValueField = "id";
            DropDownList2.DataSource = dt3;
            DropDownList2.DataBind();

            DataTable dt4 = TaskSystem.tools.GetData("SELECT [id], [name] FROM [priority] ORDER BY [id]");
            DropDownList3.DataTextField = "name";
            DropDownList3.DataValueField = "id";
            DropDownList3.DataSource = dt4;
            DropDownList3.DataBind();

            DataTable dt5 = TaskSystem.tools.GetData("SELECT [id], [name] FROM [sprint] ORDER BY [id]");
            DropDownList4.DataTextField = "name";
            DropDownList4.DataValueField = "id";
            DropDownList4.DataSource = dt5;
            DropDownList4.DataBind();

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/Profile.aspx");
        }
    }
}