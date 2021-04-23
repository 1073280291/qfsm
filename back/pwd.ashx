<%@ WebHandler Language="C#" Class="pwd" %>

using System;
using System.Web;

using System.Web.SessionState;
public class pwd : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string y = context.Request.Form["y"];
        string x1 = context.Request.Form["x1"];
        DataBase db = new DataBase();
        if(db.GetDataSet("select * from tb_user where userName='" + context.Session["id"] + "' and userPwd='"+y+"'").Tables[0].Rows.Count==1)
        {
            db.UpdateDataSet("update tb_user set userPwd='" + x1 + "' where userName='" + context.Session["id"] + "'");

            context.Response.Write("密码修改成功");
        }
        else
        {  
            context.Response.Write("原密码输入错误");
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}