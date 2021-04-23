using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class back_Default : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["user"] = null;
            Session["grade"] = null;
            Session["id"] = null;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataBase db = new DataBase();
        string str = "select name,grade from tb_user where userName='" + Text1.Value + "' and userPwd='" + Password1.Value + "'";
        DataSet ds = db.GetDataSet(str);
        if (ds.Tables[0].Rows.Count == 1)
        {
            Session["user"] = ds.Tables[0].Rows[0][0];
            Session["grade"] = ds.Tables[0].Rows[0][1];
            Session["id"] = Text1.Value;
            Response.Redirect("tm.aspx");
        }
        else
        {
            WebMessageBox.Show("您输入的账号或者密码有错误");
        }
    }
    
}