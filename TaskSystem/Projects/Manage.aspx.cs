using System;
using System.Collections;
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
    public partial class Manage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            refresh();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            insertData(Text1.Value);
            refresh();
            ShowMessageAdd("Project");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            updateData(hfCount.Value,Text2.Value);
            refresh();
            ShowMessageEdit("Project");
        }

        private void refresh() {
            DataTable dt = TaskSystem.tools.GetData("SELECT [id], [project] FROM [project] ORDER BY [id]");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void insertData(String project)
        {
            SqlCommand xp = new SqlCommand("Insert Into project(project) Values (@project)");
            xp.Parameters.AddWithValue("@project", project);
            TaskSystem.tools.InsertUpdateData(xp);
        }

        private void updateData(String id,String project)
        {
            SqlCommand xp = new SqlCommand("Update project set project=@project where id=@id;");
            xp.Parameters.AddWithValue("@id", id);
            xp.Parameters.AddWithValue("@project", project);
            TaskSystem.tools.InsertUpdateData(xp);
        }

        private void DeleteRecord(string id)
        {
            SqlCommand xp = new SqlCommand("Delete From project where id=@id");
            xp.Parameters.AddWithValue("@id", id);
            TaskSystem.tools.InsertUpdateData(xp);
            refresh();
            ShowMessage(1);
        }

        private void ShowMessage(int count)
        {

            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("swal(\"Good job!\", \"You deleted " + count.ToString() + " project\",\"success\")");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(),
                            "script", sb.ToString());
        }

        private void ShowMessageAdd(String name)
        {

            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("swal(\"Good job!\", \"You add new" + name + "\",\"success\")");
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
                GridViewRow gvrow = GridView1.Rows[index];
                hfCount.Value = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                Text2.Value = HttpUtility.HtmlDecode(gvrow.Cells[1].Text).ToString();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#editProject').modal('show');");
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
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            DeleteRecord(hfCount.Value);
        }
    }
}