using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace TaskSystem.Issues
{
    public partial class Manage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                refresh();
            }
        }

        protected void SelectedChange(object sender, EventArgs e)
        {
            dataProject(DropDownList1.SelectedItem.Value);
        }

        

        public String getNextProjectIndex(string id)
        {
            SqlConnection vid = TaskSystem.tools.GetConnection();
            int index = 0;
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
            index = index + 1;
            return index.ToString();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            refreshWithFilter(txtSearch.Text);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkProjectId(hfCount.Value) != DropDownList1.SelectedItem.Value)
            {
                updateData(hfCount.Value, Text3.Value, DropDownList1.SelectedItem.Value, DropDownList2.SelectedItem.Value, DropDownList3.SelectedItem.Value, DropDownList4.SelectedItem.Value, DropDownList5.SelectedItem.Value, DropDownList6.SelectedItem.Value, DropDownList7.SelectedItem.Value, TextArea1.InnerText, getNextProjectIndex(DropDownList1.SelectedValue), DropDownList8.SelectedItem.Value);
            }
            else
            {
                updateDataBezZmianyProjektu(hfCount.Value, Text3.Value, DropDownList2.SelectedItem.Value, DropDownList3.SelectedItem.Value, DropDownList4.SelectedItem.Value, DropDownList5.SelectedItem.Value, DropDownList6.SelectedItem.Value, DropDownList7.SelectedItem.Value, TextArea1.InnerText, DropDownList8.SelectedItem.Value);
            }
                refresh();
            ShowMessageEdit("Issue");
        }

        private String checkProjectId(String id)
        {
            DataTable dt = TaskSystem.tools.GetData("select project.id from issue join project on issue.project_id=project.id join type on type.id=issue.type_id join priority on priority.id = issue.priority_id join sprint on sprint.id=issue.sprint_id join users on users.id = issue.assigne_id where issue.id='" + id + "';");
            return dt.Rows[0][0].ToString();
        }

        private void updateData(String id, String title, String projectId, String typeId, String priorityId, String sprintId, String affectVersionId, String fixVersionId, String assigneId, String summary, String issueIndex, String status)
        {
            SqlCommand xp = new SqlCommand("Update issue set title=@title,project_id=@project_id,type_id=@type_id, priority_id=@priority_id, sprint_id=@sprint_id,affect_version_id=@affect_version_id, fix_version_id=@fix_version_id, assigne_id=@assigne_id, summary=@summary,issueIndex=@issueIndex, status=@status where id=@id;");
            xp.Parameters.AddWithValue("@id", id);
            xp.Parameters.AddWithValue("@title", title);
            xp.Parameters.AddWithValue("@project_id", projectId);
            xp.Parameters.AddWithValue("@type_id", typeId);
            xp.Parameters.AddWithValue("@priority_id", priorityId);
            xp.Parameters.AddWithValue("@sprint_id", sprintId);
            xp.Parameters.AddWithValue("@affect_version_id", affectVersionId);
            xp.Parameters.AddWithValue("@fix_version_id", fixVersionId);
            xp.Parameters.AddWithValue("@assigne_id", assigneId);
            xp.Parameters.AddWithValue("@summary", summary);
            xp.Parameters.AddWithValue("@issueIndex", issueIndex);
            xp.Parameters.AddWithValue("@status", status);
            TaskSystem.tools.InsertUpdateData(xp);
        }

        private void updateDataBezZmianyProjektu(String id, String title,  String typeId, String priorityId, String sprintId, String affectVersionId, String fixVersionId, String assigneId, String summary, String status)
        {
            SqlCommand xp = new SqlCommand("Update issue set title=@title,type_id=@type_id, priority_id=@priority_id, sprint_id=@sprint_id,affect_version_id=@affect_version_id, fix_version_id=@fix_version_id, assigne_id=@assigne_id, summary=@summary, status=@status where id=@id;");
            xp.Parameters.AddWithValue("@id", id);
            xp.Parameters.AddWithValue("@title", title);
            xp.Parameters.AddWithValue("@type_id", typeId);
            xp.Parameters.AddWithValue("@priority_id", priorityId);
            xp.Parameters.AddWithValue("@sprint_id", sprintId);
            xp.Parameters.AddWithValue("@affect_version_id", affectVersionId);
            xp.Parameters.AddWithValue("@fix_version_id", fixVersionId);
            xp.Parameters.AddWithValue("@assigne_id", assigneId);
            xp.Parameters.AddWithValue("@summary", summary);
            xp.Parameters.AddWithValue("@status", status);
            TaskSystem.tools.InsertUpdateData(xp);
        }

        private void refresh()
        {
            DataTable dt = TaskSystem.tools.GetData("select issue.id,issue.status,issue.issueIndex, issue.title, project.project, project.short,priority.name as priority, type.name as type, sprint.name as sprint, users.username,issue.affect_version_id as aff,issue.fix_version_id as fi, (select version from project_version where id=issue.affect_version_id) as affect,(select version from project_version where id=issue.fix_version_id) as fix from issue join project on issue.project_id=project.id join type on type.id=issue.type_id join priority on priority.id = issue.priority_id join sprint on sprint.id=issue.sprint_id join users on users.id = issue.assigne_id;");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void refreshWithFilter(String text)
        {
            DataTable dt = TaskSystem.tools.GetData("select issue.id,issue.status,issue.issueIndex, issue.title, project.project, project.short,priority.name as priority, type.name as type, sprint.name as sprint, users.username,issue.affect_version_id as aff,issue.fix_version_id as fi, (select version from project_version where id=issue.affect_version_id) as affect,(select version from project_version where id=issue.fix_version_id) as fix from issue join project on issue.project_id=project.id join type on type.id=issue.type_id join priority on priority.id = issue.priority_id join sprint on sprint.id=issue.sprint_id join users on users.id = issue.assigne_id WHERE issue.title like '%" + text + "%' OR project.project like '%" + text + "%' OR priority.name like '%" + text + "%' OR issue.summary like '%" + text + "%';");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void ShowMessageEdit(String name)
        {

            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("swal(\"Good job!\", \"You edit " + name + "\",\"success\")");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(),
                            "script", sb.ToString());
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("editRecord"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow gvrow = GridView1.Rows[index];

                hfCount.Value = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                dataProject();
                refreshProject(HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString());
                dataProject(DropDownList1.SelectedItem.Value);
                Text3.Value = HttpUtility.HtmlDecode(gvrow.Cells[1].Text).ToString();

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#editModal').modal('show');");
                sb.Append(@"</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "editScript2", sb.ToString());
            }
            if (e.CommandName.Equals("view"))
            {
                string[] data = e.CommandArgument.ToString().Split('-');
                Response.Redirect("~/Issues/View.aspx?" + data[0] + "-" + data[1]);
            }
        }

        private void refreshProject(String id)
        {
            DataTable dt = TaskSystem.tools.GetData("select project.id,type.id, priority.id,sprint.id, issue.affect_version_id,issue.fix_version_id,users.id,issue.summary, issue.status from issue join project on issue.project_id=project.id join type on type.id=issue.type_id join priority on priority.id = issue.priority_id join sprint on sprint.id=issue.sprint_id join users on users.id = issue.assigne_id where issue.id='" + id + "';");
            DropDownList1.SelectedValue = dt.Rows[0][0].ToString();
            DropDownList2.SelectedValue = dt.Rows[0][1].ToString();
            DropDownList3.SelectedValue = dt.Rows[0][2].ToString();
            DropDownList4.SelectedValue = dt.Rows[0][3].ToString();
            if (dt.Rows[0][4].ToString() != "0")
            {
                DropDownList5.SelectedValue = dt.Rows[0][4].ToString();
            } 
            if (dt.Rows[0][5].ToString() != "0")
            {
                DropDownList6.SelectedValue = dt.Rows[0][5].ToString();
            }
            DropDownList7.SelectedValue = dt.Rows[0][6].ToString();
            TextArea1.Value = dt.Rows[0][7].ToString();
            DropDownList8.SelectedValue = dt.Rows[0][8].ToString();
        }

        private void dataProject()
        {
            DataTable dt = TaskSystem.tools.GetData("SELECT [id], [project] FROM [project] ORDER BY [id]");
            DropDownList1.Items.Clear();
            DropDownList1.DataTextField = "project";
            DropDownList1.DataValueField = "id";
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();


            DataTable dt2 = TaskSystem.tools.GetData("SELECT [id], [username] FROM [users] ORDER BY [id]");
            DropDownList7.Items.Clear();
            DropDownList7.DataTextField = "username";
            DropDownList7.DataValueField = "id";
            DropDownList7.DataSource = dt2;
            DropDownList7.DataBind();

            DataTable dt3 = TaskSystem.tools.GetData("SELECT [id], [name] FROM [type] ORDER BY [id]");
            DropDownList2.Items.Clear();
            DropDownList2.DataTextField = "name";
            DropDownList2.DataValueField = "id";
            DropDownList2.DataSource = dt3;
            DropDownList2.DataBind();

            DataTable dt4 = TaskSystem.tools.GetData("SELECT [id], [name] FROM [priority] ORDER BY [id]");
            DropDownList3.Items.Clear();
            DropDownList3.DataTextField = "name";
            DropDownList3.DataValueField = "id";
            DropDownList3.DataSource = dt4;
            DropDownList3.DataBind();

            DataTable dt5 = TaskSystem.tools.GetData("SELECT distinct(sprint.id), sprint.name FROM [sprint], issue  WHERE (sprint.id=issue.sprint_id OR sprint.status='open' OR sprint.status='active') AND issue.id='" + hfCount.Value + "' ORDER BY sprint.id");
            DropDownList4.Items.Clear();
            DropDownList4.DataTextField = "name";
            DropDownList4.DataValueField = "id";
            DropDownList4.DataSource = dt5;
            DropDownList4.DataBind();
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
    }
}