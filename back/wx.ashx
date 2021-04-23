<%@ WebHandler Language="C#" Class="wx" %>

using System;
using System.Web;

using System.Web.SessionState;
public class wx : IHttpHandler, IRequiresSessionState
{
    private void cz(HttpContext context)
    {
        string id = context.Request.Form["index"];
        DataBase db = new DataBase();
        string sql = "select * from list where id='" + id + "'";
        context.Response.Write(Sql2Json.ToJson(db.GetDataSet(sql)));
    }
    private void tjgg(HttpContext context)
    {
        string current = context.Request.Form["current"];
        string id = context.Request.Form["id"];
        DataBase db = new DataBase();
        string sql = "update list set status='"+current+"',person='" + context.Session["user"] + "' where id='" + id + "'";
        db.UpdateDataSet(sql);
        context.Response.Write("ok");
    }
    private void sccy(HttpContext context)
    {
        string id = context.Request.Form["id"];
        DataBase db = new DataBase();
        string sql = "delete from list  where id='" + id + "'";
        db.UpdateDataSet(sql);
        context.Response.Write("ok");
    }
    public void ProcessRequest(HttpContext context)
    {
            
        string url = context.Request.UrlReferrer.ToString();
        context.Response.ContentType = "text/plain";
        string type = context.Request.Form["type"];
        switch (type)
        {
            case "cz":
                cz(context);
                break;
            case "tjgg":
                tjgg(context);
                break;
            case "sccy":
                sccy(context);
                break;
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}