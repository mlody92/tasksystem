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

namespace TaskSystem
{
    public partial class issues : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
                DataTable dt = TaskSystem.tools.GetData("select issue.id,issue.status,issue.issueIndex, issue.title, project.project, project.short,priority.name as priority, type.name as type, sprint.name as sprint, users.username,issue.affect_version_id as aff,issue.fix_version_id as fi, (select version from project_version where id=issue.affect_version_id) as affect,(select version from project_version where id=issue.fix_version_id) as fix from issue join project on issue.project_id=project.id join type on type.id=issue.type_id join priority on priority.id = issue.priority_id join sprint on sprint.id=issue.sprint_id join users on users.id = issue.assigne_id;");
                gvSource.UseAccessibleHeader = true;
                gvSource.DataSource = dt;
                gvSource.DataBind();
                
               

                dt.Rows.Clear();
                dt.Rows.Add();
                gvDest.DataSource = dt;
                gvDest.DataBind();

            }
        }
        private void refresh()
        {
            DataTable dt = TaskSystem.tools.GetData("select issue.id,issue.status,issue.issueIndex, issue.title, project.project, project.short,priority.name as priority, type.name as type, sprint.name as sprint, users.username,issue.affect_version_id as aff,issue.fix_version_id as fi, (select version from project_version where id=issue.affect_version_id) as affect,(select version from project_version where id=issue.fix_version_id) as fix from issue join project on issue.project_id=project.id join type on type.id=issue.type_id join priority on priority.id = issue.priority_id join sprint on sprint.id=issue.sprint_id join users on users.id = issue.assigne_id;");
            GridView1.DataSource = dt;
            GridView1.DataBind();

            gvSource.DataSource = dt;
            gvSource.DataBind();

            dt.Rows.Clear();
            dt.Rows.Add();
            gvDest.DataSource = dt;
            gvDest.DataBind();
        }
    }
}