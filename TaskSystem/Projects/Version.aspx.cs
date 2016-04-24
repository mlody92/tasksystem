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

namespace TaskSystem.Projects
{
    public partial class Version : System.Web.UI.Page
    {
        String projectId="";
        protected void Page_Load(object sender, EventArgs e)
        {
            projectId = Request.QueryString["projectId"];
            refresh();
            if (projectId != null)
            {
                Label1.Text = getProjectName(projectId);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            insertData(Text1.Value, projectId);
            refresh();
            ShowMessageAdd("version");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            updateData(hfCount.Value, Text2.Value);
            refresh();
            ShowMessageEdit("version");
        }

        protected void btnOpen_Click(object sender, EventArgs e)
        {
            updateStatusData(hfCount.Value, "open");
            refresh();
            ShowMessageStatus("open");
        }

        protected void btnRelease_Click(object sender, EventArgs e)
        {
            updateStatusData(hfCount.Value, "released");
            refresh();
            ShowMessageStatus("released");
        }

        private void refresh()
        {
            DataTable dt = TaskSystem.tools.GetData("SELECT [id], [version] FROM [project_version] WHERE [project_id]='" + projectId + "' AND [Status]='open' ORDER BY [id]");
            GridView1.DataSource = dt;
            GridView1.DataBind();

            DataTable dt2 = TaskSystem.tools.GetData("SELECT [id], [version] FROM [project_version] WHERE [project_id]='" + projectId + "' AND [Status]='released' ORDER BY [id]");
            GridView2.DataSource = dt2;
            GridView2.DataBind();
        }

        private void insertData(String project, String project_id)
        {
            SqlCommand xp = new SqlCommand("Insert Into project_version(version, project_id, status) Values (@version,@project_id,'open')");
            xp.Parameters.AddWithValue("@version", project);
            xp.Parameters.AddWithValue("@project_id", project_id);
            TaskSystem.tools.InsertUpdateData(xp);
        }

        private void updateData(String id, String project)
        {
            SqlCommand xp = new SqlCommand("Update project_version set version=@version where id=@id;");
            xp.Parameters.AddWithValue("@id", id);
            xp.Parameters.AddWithValue("@name", project);
            TaskSystem.tools.InsertUpdateData(xp);
        }

        private void updateStatusData(String id, String status)
        {
            SqlCommand xp = new SqlCommand("Update project_version set status=@status where id=@id;");
            xp.Parameters.AddWithValue("@id", id);
            xp.Parameters.AddWithValue("@status", status);
            TaskSystem.tools.InsertUpdateData(xp);
        }

        private void DeleteRecord(string id)
        {
            SqlCommand xp = new SqlCommand("Delete From project_version where id=@id");
            xp.Parameters.AddWithValue("@id", id);
            TaskSystem.tools.InsertUpdateData(xp);
            refresh();
            ShowMessage(1);
        }

        private void ShowMessage(int count)
        {

            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("swal(\"Good job!\", \"You deleted " + count.ToString() + " version\",\"success\")");
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

        private void ShowMessageStatus(String name)
        {

            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("swal(\"Good job!\", \"You " + name + " choosed version\",\"success\")");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(),
                            "script", sb.ToString());
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName.Equals("editRecord"))
            {
                GridViewRow gvrow = GridView1.Rows[index];
                hfCount.Value = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                Text2.Value = HttpUtility.HtmlDecode(gvrow.Cells[1].Text).ToString();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#editModal').modal('show');");
                sb.Append(@"</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "editScript", sb.ToString());
            }

            if (e.CommandName.Equals("deleteRecord"))
            {
                string code = GridView1.DataKeys[index].Value.ToString();
                hfCount.Value = code.ToString();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#deleteModal').modal('show');");
                sb.Append(@"</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "DeleteModalScript", sb.ToString());
            }

            if (e.CommandName.Equals("releaseRecord"))
            {
                string code = GridView1.DataKeys[index].Value.ToString();
                hfCount.Value = code.ToString();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#releaseModal').modal('show');");
                sb.Append(@"</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "ReleaseModalScript", sb.ToString());
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName.Equals("openRecord"))
            {
                string code = GridView2.DataKeys[index].Value.ToString();
                hfCount.Value = code.ToString();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#openModal').modal('show');");
                sb.Append(@"</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "OpenModalScript", sb.ToString());
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            DeleteRecord(hfCount.Value);
        }

        public String getProjectName(string id)
        {
            SqlConnection vid = TaskSystem.tools.GetConnection();
            String name;
            {
                SqlCommand xp = new SqlCommand("SELECT project FROM project WHERE id=@id;", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                DataSet dataSet = new DataSet();
                SqlDataAdapter datauser = new SqlDataAdapter(xp);
                datauser.Fill(dataSet);
                bool flagaSql = dataSet.Tables[0].Rows.Count > 0;
                if (flagaSql.Equals(true))
                {
                    name = dataSet.Tables[0].Rows[0]["project"].ToString();
                }
                else
                {
                    name = "brak danych";
                }
                vid.Close();
            }
            return name;
        }
    }
}