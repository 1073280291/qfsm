<%@ WebHandler Language="C#" Class="excle" %>

using System;
using System.Web;
using System.Data;
using System.Text;
using System.Web.SessionState;
using System.IO;
public class excle : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string type = context.Request.Form["type"];
        DataBase db = new DataBase();
        string str = "select * from " + type;
        DataTable dt = db.GetDataSet(str).Tables[0];
        string FileName = type + DateTime.Now.ToString("yyyyMMddHHmmss");
        DataToExcel(dt, FileName);
        context.Response.ContentType = "text/plain";
        context.Response.Write("../" + FileName + ".xls");

    }
    /// <summary>
    /// Datatable生成Excel表格并返回路径
    /// </summary>
    /// <param name="m_DataTable">Datatable</param>
    /// <param name="s_FileName">文件名</param>
    /// <returns></returns>
    public string DataToExcel(DataTable m_DataTable, string s_FileName)
    {
        string FileName = AppDomain.CurrentDomain.BaseDirectory + s_FileName + ".xls";  //文件存放路径
        if (File.Exists(FileName))                                //存在则删除
        {
            File.Delete(FileName);
        }
        FileStream objFileStream;
        StreamWriter objStreamWriter;
        string strLine = "";
        objFileStream = new FileStream(FileName, FileMode.OpenOrCreate, FileAccess.Write);
        objStreamWriter = new StreamWriter(objFileStream, Encoding.Unicode);
        for (int i = 0; i < m_DataTable.Columns.Count; i++)
        {
            strLine = strLine + m_DataTable.Columns[i].Caption.ToString() + Convert.ToChar(9);      //写列标题
        }
        objStreamWriter.WriteLine(strLine);
        strLine = "";
        for (int i = 0; i < m_DataTable.Rows.Count; i++)
        {
            for (int j = 0; j < m_DataTable.Columns.Count; j++)
            {
                if (m_DataTable.Rows[i].ItemArray[j] == null)
                    strLine = strLine + " " + Convert.ToChar(9);                                    //写内容
                else
                {
                    string rowstr = "";
                    rowstr = m_DataTable.Rows[i].ItemArray[j].ToString();
                    if (rowstr.IndexOf("\r\n") > 0)
                        rowstr = rowstr.Replace("\r\n", " ");
                    if (rowstr.IndexOf("\t") > 0)
                        rowstr = rowstr.Replace("\t", " ");
                    strLine = strLine + rowstr + Convert.ToChar(9);
                }
            }
            objStreamWriter.WriteLine(strLine);
            strLine = "";
        }
        objStreamWriter.Close();
        objFileStream.Close();
        return FileName;        //返回生成文件的绝对路径
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}