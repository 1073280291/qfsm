using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// DataBase 的摘要说明
/// </summary>
public class DataBase
{
    private SqlConnection con;
    public DataBase()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    private void Open()
    {
        if (con == null)
        {
            con = new SqlConnection("Data Source=(local);DataBase=qfsm;User ID=sa;PWD=sjc");
        }
        if (con.State == System.Data.ConnectionState.Closed)
            con.Open();

    }
    public void Close()
    {
        if (con != null)
            con.Close();
    }
    public DataSet GetDataSet(string str)
    {
        Open();
        SqlDataAdapter sda = new SqlDataAdapter(str, con);
        
        DataSet ds = new DataSet();
        sda.Fill(ds);
        Close();
        return ds;
    }
    
    public void UpdateDataSet(string str)
    {
        Open();
        SqlCommand com = new SqlCommand(str, con);
        
        com.ExecuteNonQuery();
        Close();
    }
    public string DeleteData(string form,string key,string info)
    {
        Open();
        string str = "delete from " + form + " where " + key + " ='" + info + "'";
        SqlCommand com = new SqlCommand(str, con);
        com.ExecuteNonQuery();
        Close();
        return str;
    }
    public DataSet PageData(DataSet ds,int pagaSize ,out int pageCount, int curentPage = 1)
    {
        DataSet re = new DataSet();
        re = ds.Clone();
        int from = pagaSize * (curentPage - 1);
        int to = pagaSize * curentPage - 1;
        for(int i=from;i<=to;i++)
        {
            if (i > ds.Tables[0].Rows.Count-1)
                break;
            re.Tables[0].ImportRow(ds.Tables[0].Rows[i]);
        }
        if(ds.Tables[0].Rows.Count % pagaSize!=0)
        {
            pageCount = 1 + ds.Tables[0].Rows.Count / pagaSize;
        }
        else
        {
            pageCount =  ds.Tables[0].Rows.Count / pagaSize;
        }
        ds.Dispose();
        return re;
    }
}