using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// status 的摘要说明
/// </summary>
public static class status
{
    public const string P = "已下单";
    public const string ing = "派单中";
    public const string ed = "已完成";
    public const string A = "已收账";

    public struct tm
    {
        const string P = "已下单";
        const string ing = "派单中";
        const string ed = "已完成";
        const string A = "已收账";
    }
    public struct wx
    {
        const string P = "已保修";
        const string ing = "维修中";
        const string ed = "已完成";
        const string A = "已收账";
    }
}