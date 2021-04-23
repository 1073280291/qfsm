using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class back_sap : System.Web.UI.Page
{
    public DataRowCollection item;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        if (Convert.ToInt32(Session["grade"]) != 1)
        {
            Response.Redirect("tm.aspx");
            return;
        }
        string str = Request.QueryString["index"];
        DataBase db = new DataBase();
        if (str == "ed")
        {
            DataSet ds = db.GetDataSet("SELECT id,person,type FROM list WHERE status='已收账'");
            item = ds.Tables[0].Rows;
        }
        else if(str == "pr")
        {
            DataSet ds = db.GetDataSet("SELECT id,person,type FROM list WHERE status='已下单' or status='已报修'");
            item = ds.Tables[0].Rows;
        }
        else if (str == "ing")
        {
            DataSet ds = db.GetDataSet("SELECT id,person,type FROM list WHERE status='派单中' or status='维修中'");
            item = ds.Tables[0].Rows;
        }
        else
        {
            DataSet ds = db.GetDataSet("SELECT id,person,type FROM list WHERE status='已完成'");
            item = ds.Tables[0].Rows;
        }

    }
}