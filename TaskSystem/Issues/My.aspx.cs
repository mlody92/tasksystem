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
    public partial class My : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_Id"] != null)
            {
                refresh();
            }
        }

        private void refresh()
        {
            DataTable dt = TaskSystem.tools.GetData("select issue.id,issue.status,issue.issueIndex, issue.title, project.project, project.short,priority.name as priority, type.name as type, sprint.name as sprint, users.username,issue.affect_version_id as aff,issue.fix_version_id as fi, (select version from project_version where id=issue.affect_version_id) as affect,(select version from project_version where id=issue.fix_version_id) as fix from issue join project on issue.project_id=project.id join type on type.id=issue.type_id join priority on priority.id = issue.priority_id join sprint on sprint.id=issue.sprint_id join users on users.id = issue.assigne_id where users.id=" + Session["User_Id"].ToString() + " AND sprint.status='active';");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void refreshWithFilter(String text)
        {
            DataTable dt = TaskSystem.tools.GetData("select issue.id,issue.status,issue.issueIndex, issue.title, project.project, project.short,priority.name as priority, type.name as type, sprint.name as sprint, users.username,issue.affect_version_id as aff,issue.fix_version_id as fi, (select version from project_version where id=issue.affect_version_id) as affect,(select version from project_version where id=issue.fix_version_id) as fix from issue join project on issue.project_id=project.id join type on type.id=issue.type_id join priority on priority.id = issue.priority_id join sprint on sprint.id=issue.sprint_id join users on users.id = issue.assigne_id where users.id=" + Session["User_Id"].ToString() + " AND (issue.title like '%" + text + "%' OR project.project like '%" + text + "%' OR priority.name like '%" + text + "%' OR issue.summary like '%" + text + "%' ) AND sprint.status='active';");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string[] data = e.CommandArgument.ToString().Split('-');
            if (e.CommandName.Equals("view"))
            {
                Response.Redirect("~/Issues/View.aspx?" + data[0]+"-"+data[1]);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            refreshWithFilter(txtSearch.Text);
        }
       
    }
}