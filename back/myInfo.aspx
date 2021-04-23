<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myInfo.aspx.cs" Inherits="back_myInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>轻风数码后台管理系统</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        * {
        }

        a:hover {
            cursor: pointer;
        }
    </style>
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>

</head>
<body>


    <div style="width: 100%;">
        <div class="container-fluid">
            <div class="col-md-2 hidden-sm"></div>
            <div class="col-md-8 col-sm-12">
                <div class="page-header">
                    <h1>轻风数码后台管理系统</h1>
                </div>
                <nav class="navbar navbar-default" role="navigation">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="index.aspx">首页</a>
                      
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
                            </div>
                            <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav">
                                 <li><a href="tm.aspx">上门贴膜</a></li>
                                <li><a href="wx.aspx">手机维修</a></li>
                                <li><a href="pj.aspx">手机配件</a></li>
                                <li ><a href="print.aspx">打印复印</a></li>
                                <li ><a href="newPhone.aspx">手机购买</a></li>
                                <li><a href="oldPhone.aspx">二手机平台</a></li>
                                <li  class="active"><a href="Info.aspx">信息管理</a></li>
                                <li><a href="sap.aspx">绩效查看</a></li>
                                <li><a href="Default.aspx">退出</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>


                <div class="panel panel-default">
                    <div class="panel-heading">信息管理</div>
                    <div class="panel-body">
                        <div class="h4">当前账户<span class="label label-primary"><%=item0[0][0] %></span>当前用户<span class="label label-default"><%=item0[0][2] %></span>用户级别<span class="label label-info"><%=item0[0][3] %></span></div>
                        <div class="h4 alert-info">修改密码</div>
                        <div class="container-fluid">
                            <div class="col-md-3">
                                <div class="input-group ">
                                    <span class="input-group-addon">原密码</span>
                                    <input type="password" class="form-control" placeholder="请输入原密码" required="required" id="y" />
                                </div><br class="visible-xs" />
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <span class="input-group-addon">新密码</span>
                                    <input type="password" class="form-control" placeholder="请输入新密码" id="x1" required="required" />
                                </div><br class="visible-xs" />
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <span class="input-group-addon">确认密码</span>
                                    <input type="password" class="form-control" placeholder="请再次输入密码" id="x2" required="required"/>
                                </div><br class="visible-xs" />
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <input type="submit" class="form-control btn btn-primary" value="更改密码" onclick="ggmm()" />
                                    <script>
                                        function ggmm()
                                        {
                                            if ($("#y").val() == "" || $("#x2").val() == "" || $("#x1").val() == "") {
                                                alert("密码填写完整");
                                                return;
                                            }
                                            if ($("#x2").val() != $("#x1").val() ) {
                                                alert("两次密码填写不一致");
                                                return;
                                            }
                                            $.post("pwd.ashx", {
                                                y: $("#y").val(),
                                                x1: $("#x1").val()
                                            }, function (data) {
                                                alert(data);
                                            })
                                        }
                                    </script>
                                </div>
                            </div>
                        </div>
                        <div class="h4 alert-success">信息订单</div>
                        <table class="table table-responsive" id="info">
                            <tr>
                                <td>序号</td>
                                <td>订单</td>
                                <td>类型</td>
                                <td>状态</td>
                            </tr>
                            <%
                                for (int i = 0; i < item.Count; i++)
                                {

                                    Response.Write("<tr><td>" + (i + 1).ToString() + "</td> <td>" + item[i][0].ToString() + "</td> <td>" + item[i][1].ToString() + "</td><td>" + item[i][2].ToString() + "</td></tr>");
                                }
                            %>
                        </table>
                    </div>
                </div>
                
            </div>
            <div class="col-md-8 hidden-sm"></div>
        </div>
    </div>
    <div>
    </div>
</body>
</html>
