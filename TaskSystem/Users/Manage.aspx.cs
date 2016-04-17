using System;
using System.Collections;
using System.IO;
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

            //if (IsPostBack)
            //    GetData();
            DataTable dt = TaskSystem.tools.GetData("SELECT [id], [username], [fullname], [role], [email] FROM [users] ORDER BY [id]");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        //    protected void OnPaging(object sender, GridViewPageEventArgs e)
        //    {
        //        GridView1.PageIndex = e.NewPageIndex;
        //        GridView1.DataBind();
        //        SetData();
        //    }



        protected void Button1_Click(object sender, EventArgs e)
        {
            insert(Text8.Value, Text9.Value, Text10.Value, "test", Password2.Value);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            update(hfCount.Value, Text1.Value, Text2.Value, Text3.Value, "test");
        }


        private void insert(String username, String fullname, String email, String role, String password)
        {
            SqlCommand xp = new SqlCommand("Insert Into users(username, fullname, password, role, email,avatar) Values (@username, @fullname, @password, @role, @email,@avatar)");
            xp.Parameters.AddWithValue("@username", username);
            xp.Parameters.AddWithValue("@fullname", fullname);
            xp.Parameters.AddWithValue("@password", new TaskSystem.tools().CreateMD5(password));
            xp.Parameters.AddWithValue("@role", role);
            xp.Parameters.AddWithValue("@email", email);

            FileStream fs = new FileStream(Server.MapPath("/images/") + "1.jpg", FileMode.Open, FileAccess.Read);
            BinaryReader br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);
            xp.Parameters.Add("@avatar", SqlDbType.Binary).Value = bytes;
            TaskSystem.tools.InsertUpdateData(xp);
            DataTable dt = TaskSystem.tools.GetData("SELECT [id], [username], [fullname], [role], [email] FROM [users] ORDER BY [id]");
            GridView1.DataSource = dt;
            GridView1.DataBind();

            //if (IsPostBack)
            //{
            //    Label1.Text = ("Poprawnie dodano użytkownika.");
            //    successId.Visible = true;
            //}
        }

        private void update(String id, String username, String fullname, String email, String role)
        {
            SqlCommand xp = new SqlCommand("Update users set username=@username, fullname=@fullname, role=@role, email=@email where id=@id;");
            xp.Parameters.AddWithValue("@id", id);
            xp.Parameters.AddWithValue("@username", username);
            xp.Parameters.AddWithValue("@fullname", fullname);
            xp.Parameters.AddWithValue("@role", role);
            xp.Parameters.AddWithValue("@email", email);
            TaskSystem.tools.InsertUpdateData(xp);
            DataTable dt = TaskSystem.tools.GetData("SELECT [id], [username], [fullname], [role], [email] FROM [users] ORDER BY [id]");
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        //    private void GetData()
        //    {
        //        ArrayList arr;
        //        if (ViewState["SelectedRecords"] != null)
        //            arr = (ArrayList)ViewState["SelectedRecords"];
        //        else
        //            arr = new ArrayList();

        //        for (int i = 0; i < GridView1.Rows.Count; i++)
        //        {
        //            CheckBox chk = (CheckBox)GridView1.Rows[i]
        //                               .Cells[0].FindControl("chk");
        //            if (chk.Checked)
        //            {
        //                if (!arr.Contains(GridView1.DataKeys[i].Value))
        //                {
        //                    arr.Add(GridView1.DataKeys[i].Value);
        //                }
        //            }
        //            else
        //            {
        //                if (arr.Contains(GridView1.DataKeys[i].Value))
        //                {
        //                    arr.Remove(GridView1.DataKeys[i].Value);
        //                }
        //            }

        //        }
        //        ViewState["SelectedRecords"] = arr;
        //    }

        //    private void SetData()
        //    {
        //        int currentCount = 0;

        //        ArrayList arr = (ArrayList)ViewState["SelectedRecords"];
        //        for (int i = 0; i < GridView1.Rows.Count; i++)
        //        {
        //            CheckBox chk = (CheckBox)GridView1.Rows[i]
        //                            .Cells[0].FindControl("chk");
        //            if (chk != null)
        //            {
        //                chk.Checked = arr.Contains(GridView1.DataKeys[i].Value);
        //                if (chk.Checked)
        //                    currentCount++;
        //            }
        //        }
        //        hfCount.Value = (arr.Count - currentCount).ToString();
        //    }

        //    protected void btnDelete_Click(object sender, EventArgs e)
        //    {
        //        int count = 0;
        //        SetData();
        //        GridView1.AllowPaging = false;
        //        GridView1.DataBind();
        //        ArrayList arr = (ArrayList)ViewState["SelectedRecords"];
        //        count = arr.Count;
        //        for (int i = 0; i < GridView1.Rows.Count; i++)
        //        {
        //            if (arr.Contains(GridView1.DataKeys[i].Value))
        //            {
        //                DeleteRecord(GridView1.DataKeys[i].Value.ToString());
        //                arr.Remove(GridView1.DataKeys[i].Value);
        //            }
        //        }
        //        ViewState["SelectedRecords"] = arr;
        //        hfCount.Value = "0";
        //        GridView1.AllowPaging = true;
        //        DataTable dt = TaskSystem.tools.GetData("SELECT [id], [username], [fullname], [role], [email] FROM [users] ORDER BY [id]");
        //        GridView1.DataSource = dt;
        //        GridView1.DataBind();
        //        ShowMessage(count);
        //    }

        private void DeleteRecord(string id)
        {
            SqlCommand xp = new SqlCommand("Delete From users where id=@id");
            xp.Parameters.AddWithValue("@id", id);
            TaskSystem.tools.InsertUpdateData(xp);
            DataTable dt = TaskSystem.tools.GetData("SELECT [id], [username], [fullname], [role], [email] FROM [users] ORDER BY [id]");
            GridView1.DataSource = dt;
            GridView1.DataBind();
            ShowMessage(1);
        }

        private void ShowMessage(int count)
        {

            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("swal(\"Good job!\", \"You deleted " + count.ToString() + " users\",\"success\")");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(),
                            "script", sb.ToString());
        }

        private bool checkBox()
        {
            bool flaga = true;
            if (Text8.Value == "" || Text9.Value == "" || Text10.Value == "" || DropDownList1.SelectedItem.Value == "" || Password2.Value == "" || Password3.Value == "")
            {
                Label2.Text = "Please check your data.";
                errorId.Visible = true;
                flaga = false;
            }
            else errorId.Visible = false;

            if (Password2.Value != Password3.Value)
            {
                Label2.Text = "Passwords are not the same.";
                errorId.Visible = true;
                flaga = false;
            }
            else errorId.Visible = false;

            return flaga;
        }

            public void RaisePostBackEvent(string eventArgument) { }



            protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
            {
                int index = Convert.ToInt32(e.CommandArgument);
                if (e.CommandName.Equals("editRecord"))
                {
                    GridViewRow gvrow = GridView1.Rows[index];
                    hfCount.Value = HttpUtility.HtmlDecode(gvrow.Cells[1].Text).ToString();
                    Text1.Value = HttpUtility.HtmlDecode(gvrow.Cells[2].Text).ToString();
                    Text2.Value = HttpUtility.HtmlDecode(gvrow.Cells[3].Text);
                    Text3.Value = HttpUtility.HtmlDecode(gvrow.Cells[5].Text);
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#editModal').modal('show');");
                    sb.Append(@"</script>");
                    ClientScript.RegisterStartupScript(this.GetType(), "script", sb.ToString());
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