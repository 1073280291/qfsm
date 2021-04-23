using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class back_myInfo : System.Web.UI.Page
{
    public DataRowCollection item;
    public DataRowCollection item0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        DataBase db = new DataBase();
        DataSet ds = db.GetDataSet("select * from tb_user where userName='" + Session["id"] + "'");
        item0 = ds.Tables[0].Rows;
        ds = db.GetDataSet("select id,type,status from list where person='" + Session["user"] + "'  order by status asc");
        item = ds.Tables[0].Rows;
 
    }
  
}