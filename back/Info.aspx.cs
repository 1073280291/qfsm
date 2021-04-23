using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class back_Info : System.Web.UI.Page
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
            Response.Redirect("myInfo.aspx");
        }
        else
        {
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet("select *from tb_user");
            item = ds.Tables[0].Rows;
        }
        
    }
    
}