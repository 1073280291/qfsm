<%@ WebHandler Language="C#" Class="jd" %>

using System;
using System.Web;
using System.Data;
using System.Web.SessionState;
using System.Text.RegularExpressions;
public class jd : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {

        string url = context.Request.UrlReferrer.ToString();
        context.Response.ContentType = "text/plain";
        string id = context.Request.Form["id"];
        id = getSqlItem("id", id);
        string name = context.Request.Form["name"];
        name = getSqlItem("name", name);

        string sex = context.Request.Form["sex"];
        sex = getSqlItem("sex", sex);
        string school = context.Request.Form["school"];
        school = getSqlItem("school", school);
        string qq = context.Request.Form["qq"];
        qq = getSqlItem("qq", qq);
        string tel = context.Request.Form["tel"];
        tel = getSqlItem("tel", tel);
        string start = context.Request.Form["start"];
        string end = context.Request.Form["end"];
        if (start == "" && end != "")
        {
            start = " AND id < '"+end+"'";
        }
        else if(start != "" && end == "")
        {
            start = " AND id >'"+start+"'";
        }
        else if(start != "" && end != "")
        {
            start = " AND id BETWEEN '"+start+"' AND '"+end+"'";
        }
        string type = context.Request.Form["type"];
        type = getSqlItem("type", type);
        string user = context.Request.Form["user"];
        user = getSqlItem("user", user);
        string person = context.Request.Form["person"];
        person = getSqlItem("person", person);
        string status = context.Request.Form["status"];
        status = getSqlItem("status", status);
        try
        {
            DataBase db = new DataBase();
            string sql = "SELECT id,name,sex,school FROM list WHERE " + id + name + sex + school + qq + tel + type + user + person + status + start;
            int i = sql.IndexOf("AND",0,sql.Length);
            sql=new Regex("AND").Replace(sql, "", 1);
            if (sql.Length == 42)
            {
                sql = new Regex("WHERE").Replace(sql, "", 1);
            }
            DataSet ds=db.GetDataSet(sql);
            context.Session["result"] = ds;
            context.Response.Write(ds.Tables[0].Rows.Count);
        }
        catch
        {
            context.Response.Write("error");
        }
    }

    private string getSqlItem(string key,string str)
    {
        if (str == "")
        {
            return "";
        }
        else
        {
            return " AND "+key+"='"+str+"'";
        }
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}