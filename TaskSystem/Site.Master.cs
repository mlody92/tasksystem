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
                
                if (!Page.IsPostBack)
                {
                    dataProject();
                }
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

            DataTable dt5 = TaskSystem.tools.GetData("SELECT [id], [name] FROM [sprint] WHERE status='open' OR sprint.status='active' ORDER BY [id]");
            DropDownList4.DataTextField = "name";
            DropDownList4.DataValueField = "id";
            DropDownList4.DataSource = dt5;
            DropDownList4.DataBind();

            DataTable dt6 = TaskSystem.tools.GetData("SELECT [id], [version] FROM [project_version] WHERE [status]='released' ORDER BY [id]");
            DropDownList5.Items.Clear();
            DropDownList5.DataTextField = "version";
            DropDownList5.DataValueField = "id";
            DropDownList5.DataSource = dt6;
            DropDownList5.DataBind();
            DropDownList5.Items.Insert(0, new ListItem("", ""));

            DataTable dt7 = TaskSystem.tools.GetData("SELECT [id], [version] FROM [project_version] WHERE [status]='open' ORDER BY [id]");
            DropDownList6.Items.Clear();
            DropDownList6.DataTextField = "version";
            DropDownList6.DataValueField = "id";
            DropDownList6.DataSource = dt7;
            DropDownList6.DataBind();
            DropDownList6.Items.Insert(0, new ListItem("", ""));
        }

        protected void SelectedChange(object sender, EventArgs e)
        {
            dataProject(DropDownList1.SelectedItem.Value);
        }

        private void dataProject(String project_id)
        {
            DataTable dt6 = TaskSystem.tools.GetData("SELECT [id], [version] FROM [project_version] WHERE [status]='released' AND [project_id]='" + project_id + "' ORDER BY [id]");
            DropDownList5.Items.Clear();
            DropDownList5.DataTextField = "version";
            DropDownList5.DataValueField = "id";
            DropDownList5.DataSource = dt6;
            DropDownList5.DataBind();
            DropDownList5.Items.Insert(0, new ListItem("", ""));

            DataTable dt7 = TaskSystem.tools.GetData("SELECT [id], [version] FROM [project_version] WHERE [status]='open' AND [project_id]='" + project_id + "' ORDER BY [id]");
            DropDownList6.Items.Clear();
            DropDownList6.DataTextField = "version";
            DropDownList6.DataValueField = "id";
            DropDownList6.DataSource = dt7;
            DropDownList6.DataBind();
            DropDownList6.Items.Insert(0, new ListItem("", ""));

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

        protected void saveIssue_Click(object sender, EventArgs e)
        {
            insertData(Text3.Value, DropDownList1.SelectedValue, DropDownList2.SelectedItem.Value, DropDownList3.SelectedItem.Value, DropDownList4.SelectedItem.Value, DropDownList5.SelectedItem.Value, DropDownList6.SelectedItem.Value, DropDownList7.SelectedItem.Value, TextArea1.InnerText, getNextProjectIndex(DropDownList1.SelectedItem.Value));
            ShowMessage();
        }

        private void insertData(String title, String projectId, String typeId, String priorityId, String sprintId, String affectVersionId, String fixVersionId, String assigneId, String description, String issueIndex)
        {
            SqlCommand xp = new SqlCommand("Insert Into issue (title, project_id, type_id, priority_id,sprint_id,affect_version_id, fix_version_id, assigne_id, summary, issueIndex, status) Values (@title,@projectId,@typeId,@priorityId, @sprintId, @affectVersionId, @fixVersionId, @assigneId, @description, @issueIndex,'open')");
            xp.Parameters.AddWithValue("@title", title);
            xp.Parameters.AddWithValue("@projectId", projectId);
            xp.Parameters.AddWithValue("@typeId", typeId);
            xp.Parameters.AddWithValue("@priorityId", priorityId);
            xp.Parameters.AddWithValue("@sprintId", sprintId);
            xp.Parameters.AddWithValue("@affectVersionId", affectVersionId);
            xp.Parameters.AddWithValue("@fixVersionId", fixVersionId);
            xp.Parameters.AddWithValue("@assigneId", assigneId);
            xp.Parameters.AddWithValue("@description", description);
            xp.Parameters.AddWithValue("@issueIndex", issueIndex);
            TaskSystem.tools.InsertUpdateData(xp);
        }

        private void ShowMessage()
        {

            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("swal(\"Good job!\", \"You add new issue\",\"success\")");
            sb.Append("</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(),
                            "script", sb.ToString());
        }

        public String getNextProjectIndex(string id)
        {
            SqlConnection vid = TaskSystem.tools.GetConnection();
            int index=0;
            {
                SqlCommand xp = new SqlCommand("SELECT isNull(Max(issueIndex),0) as number FROM issue WHERE project_id=@id;", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                DataSet dataSet = new DataSet();
                SqlDataAdapter datauser = new SqlDataAdapter(xp);
                datauser.Fill(dataSet);
                bool flagaSql = dataSet.Tables[0].Rows.Count > 0;
                if (flagaSql.Equals(true))
                {
                    index = Int32.Parse(dataSet.Tables[0].Rows[0]["number"].ToString());
                }
                vid.Close();
            }
            index=index+1;
            return index.ToString();
        }
    }
}