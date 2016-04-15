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

namespace TaskSystem.Users
{
    public partial class Manage : System.Web.UI.Page, IPostBackEventHandler
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                GetData();
            DataTable dt = TaskSystem.tools.GetData("SELECT [id], [username], [fullname], [role], [email] FROM [users] ORDER BY [id]");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
            SetData();
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            changePass(Text8.Value, Text9.Value, Text10.Value, "test", Password2.Value);
        }

        private void changePass(String username, String fullname, String email ,String role , String password)
        {
            SqlCommand xp = new SqlCommand("Insert Into users(username, fullname, password, role, email) Values (@username, @fullname, @password, @role, @email)");
            xp.Parameters.AddWithValue("@username", username);
            xp.Parameters.AddWithValue("@fullname", fullname);
            xp.Parameters.AddWithValue("@password", new TaskSystem.tools().CreateMD5(password));
            xp.Parameters.AddWithValue("@role", role);
            xp.Parameters.AddWithValue("@email", email);
            TaskSystem.tools.InsertUpdateData(xp);

            //if (IsPostBack)
            //{
            //    Label1.Text = ("Poprawnie dodano użytkownika.");
            //    successId.Visible = true;
            //}
        }

        private void GetData()
        {
            ArrayList arr;
            if (ViewState["SelectedRecords"] != null)
                arr = (ArrayList)ViewState["SelectedRecords"];
            else
                arr = new ArrayList();
            CheckBox chkAll = (CheckBox)GridView1.HeaderRow
                                .Cells[0].FindControl("chkAll");
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (chkAll.Checked)
                {
                    if (!arr.Contains(GridView1.DataKeys[i].Value))
                    {
                        arr.Add(GridView1.DataKeys[i].Value);
                    }
                }
                else
                {
                    CheckBox chk = (CheckBox)GridView1.Rows[i]
                                       .Cells[0].FindControl("chk");
                    if (chk.Checked)
                    {
                        if (!arr.Contains(GridView1.DataKeys[i].Value))
                        {
                            arr.Add(GridView1.DataKeys[i].Value);
                        }
                    }
                    else
                    {
                        if (arr.Contains(GridView1.DataKeys[i].Value))
                        {
                            arr.Remove(GridView1.DataKeys[i].Value);
                        }
                    }
                }
            }
            ViewState["SelectedRecords"] = arr;
        }

        private void SetData()
        {
            int currentCount = 0;
            CheckBox chkAll = (CheckBox)GridView1.HeaderRow
                                    .Cells[0].FindControl("chkAll");
            chkAll.Checked = true;
            ArrayList arr = (ArrayList)ViewState["SelectedRecords"];
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox chk = (CheckBox)GridView1.Rows[i]
                                .Cells[0].FindControl("chk");
                if (chk != null)
                {
                    chk.Checked = arr.Contains(GridView1.DataKeys[i].Value);
                    if (!chk.Checked)
                        chkAll.Checked = false;
                    else
                        currentCount++;
                }
            }
            hfCount.Value = (arr.Count - currentCount).ToString();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int count = 0;
            SetData();
            GridView1.AllowPaging = false;
            GridView1.DataBind();
            ArrayList arr = (ArrayList)ViewState["SelectedRecords"];
            count = arr.Count;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (arr.Contains(GridView1.DataKeys[i].Value))
                {
                    //DeleteRecord(GridView1.DataKeys[i].Value.ToString());
                    arr.Remove(GridView1.DataKeys[i].Value);
                }
            }
            ViewState["SelectedRecords"] = arr;
            hfCount.Value = "0";
            GridView1.AllowPaging = true;
            DataTable dt = TaskSystem.tools.GetData("SELECT [id], [username], [fullname], [role], [email] FROM [users] ORDER BY [id]");
            GridView1.DataSource = dt;
            GridView1.DataBind();
            //ShowMessage(count);
        }

        private void DeleteRecord(string id)
        {
            SqlCommand xp = new SqlCommand("Delete From users where id=@id");
            xp.Parameters.AddWithValue("@id", id);
            TaskSystem.tools.InsertUpdateData(xp);

        }

        private void ShowMessage(int count)
        {

            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("swal(\"Good job!\", \"You deleted "+count.ToString()+" users\",\"success\")");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(),
                            "script", sb.ToString());
        }

        private bool checkBox() {
            bool flaga = true;
            if (Text8.Value == "" || Text9.Value == "" || Text10.Value == "" || DropDownList1.SelectedItem.Value == "" || Password2.Value == "" || Password3.Value == "")
            {
                Label2.Text = "Wprowadź poprawne dane";
                errorId.Visible = true;
                flaga = false;
            }
            else errorId.Visible = false;

            if ( Password2.Value != Password3.Value)
            {
                Label2.Text = "Hasła nie są takie same";
                errorId.Visible = true;
                flaga = false;
            }
            else errorId.Visible = false;
            
            return flaga;
        }

        public void RaisePostBackEvent(string eventArgument) { }
    }
}