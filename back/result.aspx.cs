using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class back_result : System.Web.UI.Page
{
    public DataRowCollection item;
    protected void Page_Load(object sender, EventArgs e)
    {
        item = ((DataSet)Session["result"]).Tables[0].Rows;
    }
}