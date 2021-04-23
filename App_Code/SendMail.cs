using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

/// <summary>
/// SendMail 的摘要说明
/// </summary>
public class SendMail
{
    public SendMail()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public void send(string info)
    {
        try
        {
            //var senduser = "1052884642@qq.com";
            //var sendpwd = "yfonawudgoakbgag";
            var senduser = "2233417652@qq.com";
            var sendpwd = "oiptluhwqbayecie";
            var receiver = "1073280291@qq.com";
            var sendmsg = info;

            var message = new MailMessage();
            var fromddress = new MailAddress(senduser);
            message.From = fromddress;

            message.To.Add(receiver);//接收方
            message.CC.Add(senduser);//抄送方
            message.Subject = "贴膜订单来了~~~赶快登入系统吧";//主题
            message.Body = sendmsg;//内容
            //message.Attachments.Add(new Attachment("test.txt"));//附件

            SmtpClient client = new SmtpClient("smtp.qq.com", 25);//基于qq邮件发送
            client.Credentials = new NetworkCredential(senduser, sendpwd);
            client.EnableSsl = true;
            client.Send(message);
        }
        catch (Exception ex)
        {
            WebMessageBox.Show(ex.Message);
        }
    }
}