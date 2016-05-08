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
    public partial class View : System.Web.UI.Page
    {
        String project;
        protected void Page_Load(object sender, EventArgs e)
        {
            String query = Request.Url.Query;
            if (query != "" && query != null)
            {
                project = query.Substring(1, query.Length - 1);
                string[] data = project.Split('-');
                Label1.Text = project;
                refresh(data[0],data[1]);
            }
        }

        private void refresh(String proId, String indeks)
        {
            // 1- id, 2-status, 3-indeks, 4-tytuł, 5-projekt,6 - skrót projektu, 7-nazwa priorytetu, 8- nazwa typu, 9 - sprint, 10-assigne, 11-summary, 12- affect_version, 13 - fix version, 14 -aff , 15 fix
            DataTable dt = TaskSystem.tools.GetData("select issue.id,issue.status,issue.issueIndex, issue.title, project.project, project.short,priority.name as priority, type.name as type, sprint.name as sprint, users.username,issue.summary,issue.affect_version_id as aff,issue.fix_version_id as fi, (select version from project_version where id=issue.affect_version_id) as affect,(select version from project_version where id=issue.fix_version_id) as fix from issue join project on issue.project_id=project.id join type on type.id=issue.type_id join priority on priority.id = issue.priority_id join sprint on sprint.id=issue.sprint_id join users on users.id = issue.assigne_id where project.short='" + proId + "' and issue.issueIndex='"+indeks+"';");
            Text1.Value = dt.Rows[0][4].ToString();
            Text2.Value = dt.Rows[0][3].ToString();
            Text3.Value = dt.Rows[0][1].ToString();
            Text4.Value = dt.Rows[0][9].ToString();
            Text5.Value = dt.Rows[0][6].ToString();
            Text6.Value = dt.Rows[0][7].ToString();
            TextArea1.InnerText = dt.Rows[0][10].ToString();
            Text7.Value = dt.Rows[0][13].ToString();
            Text8.Value = dt.Rows[0][14].ToString();
            Text9.Value = dt.Rows[0][8].ToString();
        }
    }
}