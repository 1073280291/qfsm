<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;

using System.Net;
using System.Net.Mail;
public class Handler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string url = context.Request.UrlReferrer.ToString();
        context.Response.ContentType = "text/plain";
        string id = DateTime.Now.ToString("yyyyMMddHHmmss");
        string name = context.Request.Form["name"];
        string sex = context.Request.Form["sex"];
        string school = context.Request.Form["school"];
        string qq = context.Request.Form["qq"];
        string tel = context.Request.Form["tel"];
        string xh = context.Request.Form["xh"];
        string type = context.Request.Form["type"];
        string xq = context.Request.Form["xq"];
        string location = context.Request.Form["location"];
        string address = context.Request.Form["address"];
        string ggxq = context.Request.Form["ggxq"];
        string pri = context.Request.Form["pri"];
        string status = context.Request.Form["status"];
        string sql = "insert into list(id,name,sex,school,qq,tel,xh,ggxq,type,location,address,status,xq,private) values('"
                + id + "','" + name + "','" + sex + "','" + school + "','" + qq + "','" + tel + "','" + xh + "','" + ggxq + "','" + type + "','" + location + "','"+address+"','"+status+"','"+xq+"','"+pri+"')";
        DataBase db = new DataBase();
        try
        {
            db.UpdateDataSet(sql);
            //try
            //{
            //    var senduser = "2233417652@qq.com";
            //    var sendpwd = "jpnstfgjwhnmeafb";
            //    var receiver = "1073280291@qq.com";
            //    var sendmsg = name + "(" + school + sex + ")" + "需要一个" + xq;
            //    var message = new MailMessage();
            //    var fromddress = new MailAddress(senduser);
            //    message.From = fromddress;
            //    message.To.Add(receiver);//接收方
            //    message.CC.Add(senduser);//抄送方
            //    message.Subject = "订单来了~~~赶快登入系统吧";//主题
            //    message.Body = sendmsg;//内容
            //    //message.Attachments.Add(new Attachment("test.txt"));//附件
            //    SmtpClient client = new SmtpClient("smtp.qq.com", 587);//基于qq邮件发送
            //    client.Credentials = new NetworkCredential(senduser, sendpwd);
            //    client.EnableSsl = true;
            //    client.Send(message);
            //}
            //catch (Exception ex)
            //{
            //    WebMessageBox.Show(ex.Message);
            //}
            context.Response.Write("ok");

        }
        catch
        {
            context.Response.Write(sql);
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