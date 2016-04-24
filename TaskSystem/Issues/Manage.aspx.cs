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
            refresh();
        }


        private void refresh()
        {
            DataTable dt = TaskSystem.tools.GetData("select issue.id,issue.issueIndex, issue.title, project.project, project.short,priority.name as priority, type.name as type, sprint.name as sprint, users.username,issue.affect_version_id as aff,issue.fix_version_id as fi, (select version from project_version where id=issue.affect_version_id) as affect,(select version from project_version where id=issue.fix_version_id) as fix from issue join project on issue.project_id=project.id join type on type.id=issue.type_id join priority on priority.id = issue.priority_id join sprint on sprint.id=issue.sprint_id join users on users.id = issue.assigne_id;");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void insertData(String project)
        {
            SqlCommand xp = new SqlCommand("Insert Into type(name) Values (@name)");
            xp.Parameters.AddWithValue("@name", project);
            TaskSystem.tools.InsertUpdateData(xp);
        }

        private void updateData(String id, String project)
        {
            SqlCommand xp = new SqlCommand("Update type set name=@name where id=@id;");
            xp.Parameters.AddWithValue("@id", id);
            xp.Parameters.AddWithValue("@name", project);
            TaskSystem.tools.InsertUpdateData(xp);
        }

        private void DeleteRecord(string id)
        {
            SqlCommand xp = new SqlCommand("Delete From type where id=@id");
            xp.Parameters.AddWithValue("@id", id);
            TaskSystem.tools.InsertUpdateData(xp);
            refresh();
            ShowMessage(1);
        }

        private void ShowMessage(int count)
        {

            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("swal(\"Good job!\", \"You deleted " + count.ToString() + " type\",\"success\")");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(),
                            "script", sb.ToString());
        }

        private void ShowMessageAdd(String name)
        {

            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("swal(\"Good job!\", \"You add new " + name + "\",\"success\")");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(),
                            "script", sb.ToString());
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
            int index = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName.Equals("editRecord"))
            {
                dataProject();
                GridViewRow gvrow = GridView1.Rows[index];
                hfCount.Value = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                Text3.Value = HttpUtility.HtmlDecode(gvrow.Cells[1].Text).ToString();
                DropDownList1.SelectedItem.Text = HttpUtility.HtmlDecode(gvrow.Cells[2].Text).ToString();
                DropDownList2.SelectedItem.Text = HttpUtility.HtmlDecode(gvrow.Cells[6].Text).ToString();
                DropDownList3.SelectedItem.Text = HttpUtility.HtmlDecode(gvrow.Cells[5].Text).ToString();
                DropDownList4.SelectedItem.Text = HttpUtility.HtmlDecode(gvrow.Cells[7].Text).ToString();
                DropDownList5.SelectedItem.Text = HttpUtility.HtmlDecode(gvrow.Cells[9].Text).ToString();
                DropDownList6.SelectedItem.Text = HttpUtility.HtmlDecode(gvrow.Cells[10].Text).ToString();
                DropDownList7.SelectedItem.Text = HttpUtility.HtmlDecode(gvrow.Cells[8].Text).ToString();
                TextArea1.Value = getSummary(HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString());


                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#editModal').modal('show');");
                sb.Append(@"</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "editScript2", sb.ToString());
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            DeleteRecord(hfCount.Value);
        }

        private String getSummary(String id)
        {
            String summ = "";
            SqlConnection vid = TaskSystem.tools.GetConnection();
            {
                SqlCommand xp = new SqlCommand("SELECT summary FROM issue WHERE id=@id;", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                DataSet dataSet = new DataSet();
                SqlDataAdapter datauser = new SqlDataAdapter(xp);
                datauser.Fill(dataSet);
                bool flagaSql = dataSet.Tables[0].Rows.Count > 0;
                if (flagaSql.Equals(true))
                {
                    summ = dataSet.Tables[0].Rows[0]["summary"].ToString();
                }
                vid.Close();
            }
            return summ;
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
    }
}