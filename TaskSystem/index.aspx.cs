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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_Id"] != null)
            {
                refresh(Session["User_Id"].ToString());
            }
            String[,] data = getNumberOpen();
            script(data[0, 1], data[1, 1], data[2, 1], data[3, 1], data[4, 1], data[5, 1], data[6, 1]);
            Label1.Text = data[0, 1];
            Label2.Text = data[1, 1];
            Label3.Text = data[2, 1];
            Label4.Text = data[3, 1];
            Label5.Text = data[4, 1];
            Label6.Text = data[5, 1];
            Label7.Text = data[6, 1];


            String[,] data2 = getNumberActual();
            script2(data2[0, 1], data2[1, 1], data2[2, 1], data2[3, 1], data2[4, 1], data2[5, 1], data2[6, 1]);
            Label8.Text = data2[0, 1];
            Label9.Text = data2[1, 1];
            Label10.Text = data2[2, 1];
            Label11.Text = data2[3, 1];
            Label12.Text = data2[4, 1];
            Label13.Text = data2[5, 1];
            Label14.Text = data2[6, 1];
        }

        private void refresh(String user_id)
        {
            DataTable dt = TaskSystem.tools.GetData("SELECT top 10 issue.issueIndex, project.short, issue.title FROM [issue] JOIN project on issue.project_id=project.id join users on users.id=issue.assigne_id where issue.assigne_id=" + user_id + " order by issue.id desc ");
            ListView2.DataSource = dt;
            ListView2.DataBind();
        }

        private String[,] getNumberOpen()
        {
            String[,] data = new String[7, 2] { 
            { "Open", "0" },
            { "In progress", "0" },
            { "Code review", "0" },
            { "Test", "0" },
            { "Closed", "0" },
            { "Won't fix", "0" },
            { "Duplicate", "0" }
            };

            DataTable dt = TaskSystem.tools.GetData("select issue.status, count(*) from issue join sprint on issue.sprint_id=sprint.id where sprint.status='open' OR sprint.status='active' group by issue.status;");
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                for (int j = 0; j < 7; j++)
                {
                    if (data[j, 0] == dt.Rows[i][0].ToString())
                    {
                        data[j, 1] = dt.Rows[i][1].ToString();
                    }
                }
            }
            return data;
        }

        private String[,] getNumberActual()
        {
            String[,] data = new String[7, 2] { 
            { "Open", "0" },
            { "In progress", "0" },
            { "Code review", "0" },
            { "Test", "0" },
            { "Closed", "0" },
            { "Won't fix", "0" },
            { "Duplicate", "0" }
            };

            DataTable dt = TaskSystem.tools.GetData("select issue.status, count(*) from issue join sprint on issue.sprint_id=sprint.id where sprint.status='active' group by issue.status;");
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                for (int j = 0; j < 7; j++)
                {
                    if (data[j, 0] == dt.Rows[i][0].ToString())
                    {
                        data[j, 1] = dt.Rows[i][1].ToString();
                    }
                }
            }
            return data;
        }

        private void script(String open, String inprogress, String codereview, String test, String closed, String wontfix, String duplicate)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("var pieData = [");
            sb.Append("{value: "+open+",color: \"#8BC34A\"},");
            sb.Append("{value: " + inprogress + ",color: \"#EF553A\"},");
            sb.Append("{value: " + codereview+ ",color: \"#00ACED\"},");
            sb.Append("{value: " + test+ ",color: \"#231233\"},");
            sb.Append("{value: " + closed + ",color: \"#a32312\"},");
            sb.Append("{value: " + wontfix+ ",color: \"#001290\"},");
            sb.Append("{value: " + duplicate+ ",color: \"#000000\"}");
            sb.Append("];");
            sb.Append("new Chart(document.getElementById(\"pie\").getContext(\"2d\")).Pie(pieData);");
            sb.Append(@"</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "Script", sb.ToString());
        }

        private void script2(String open, String inprogress, String codereview, String test, String closed, String wontfix, String duplicate)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("var pie2Data = [");
            sb.Append("{value: " + open + ",color: \"#8BC34A\"},");
            sb.Append("{value: " + inprogress + ",color: \"#EF553A\"},");
            sb.Append("{value: " + codereview + ",color: \"#00ACED\"},");
            sb.Append("{value: " + test + ",color: \"#231233\"},");
            sb.Append("{value: " + closed + ",color: \"#a32312\"},");
            sb.Append("{value: " + wontfix + ",color: \"#001290\"},");
            sb.Append("{value: " + duplicate + ",color: \"#000000\"}");
            sb.Append("];");
            sb.Append("new Chart(document.getElementById(\"pie2\").getContext(\"2d\")).Pie(pie2Data);");
            sb.Append(@"</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "Script2", sb.ToString());
        }
    }
}