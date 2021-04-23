using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class back_newPhone : System.Web.UI.Page
{
    public DataRowCollection item;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        string str = Request.QueryString["index"];
        DataBase db = new DataBase();
        if (str == "ing")
        {
            DataSet ds = db.GetDataSet("select id,name,sex,school from list where status='派单中' and person='" + Session["user"] + "' and type='新机购买' order by id desc");
            item = ds.Tables[0].Rows;
        }
        else if (str == "ed")
        {
            DataSet ds = db.GetDataSet("select id,name,sex,school from list where (status='已完成' or status='已总账')and type='新机购买' order by id desc");
            item = ds.Tables[0].Rows;
        }
        else
        {
            DataSet ds = db.GetDataSet("select id,name,sex,school from list where status='已下单' and type='新机购买' order by id desc");
            item = ds.Tables[0].Rows;
        }

    }
}