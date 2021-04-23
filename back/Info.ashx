<%@ WebHandler Language="C#" Class="Info" %>

using System;
using System.Web;
using System.Data;
public class Info : IHttpHandler
{

    private void cz(HttpContext context)
    {
        string user = context.Request.Form["index"];

        DataBase db = new DataBase();
        DataSet ds = db.GetDataSet("select * from tb_user where userName='" + user + "'");
        context.Response.Write(Sql2Json.ToJson(ds));
    }
    private void tjgg(HttpContext context)
    {
        string name = context.Request.Form["name"];

        string user = context.Request.Form["user"];
        string pass = context.Request.Form["pass"];
        string grade = context.Request.Form["grade"];
        DataBase db = new DataBase();
        if (db.GetDataSet("select * from tb_user where userName='" + user + "'").Tables[0].Rows.Count > 0)
        {

            db.UpdateDataSet("update tb_user set name='" + name + "',userPwd='" + pass + "',grade=" + grade + " from tb_user where userName='" + user + "'");
        }
        else
        {
            db.UpdateDataSet("insert into tb_user(userName,userPwd,name,grade) values('" + user + "','" + pass + "','" + name + "'," + grade + ")");
        }
        context.Response.Write("ok");
    }
    private void sccy(HttpContext context)
    {
        string user = context.Request.Form["user"];
        DataBase db = new DataBase();
        db.UpdateDataSet("delete from tb_user where userName='" + user + "'");

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