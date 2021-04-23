<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Info.aspx.cs" Inherits="back_Info" %>

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
                            <div><a href="#" onclick="add()" style="font-size: 20px;">增加成员</a>
                                <a href="#" style="font-size: 20px; margin-left:10px;" onclick="save()">导出成员</a>
                            </div>
                            <script type="text/javascript">
                                function add() {
                                    $("#myModal").modal();
                                }

                                function save() {
                                    $.post("excle.ashx", {
                                        type: "tb_user",
                                    }, function (data) {
                                        window.location = data;
                                    })

                                }
                            </script>
                            <table class="table table-responsive" id="info">
                                <tr>
                                    <td>序号</td>
                                    <td>姓名</td>
                                    <td>账号</td>
                                    <td>级别</td>
                                    <td>操作</td>
                                </tr>
                                <%
                                    for (int i = 0; i < item.Count; i++)
                                    {
                                        Response.Write("<tr><td>" + (i + 1).ToString() + "</td> <td>" + item[i][2].ToString() + "</td> <td>" + item[i][0].ToString() + "</td><td>" + item[i][3].ToString() + "</td><td><a href='#' onclick='cz(" + item[i][0] + ")'>操作</td></tr>");
                                    }
                                %>
                            </table>
                            <script>
                                function cz(index) {
                                    $.post("Info.ashx", {
                                        type:"cz",
                                        index:index
                                    }, function (data) {
                                        data = JSON.parse(data);
                                        $("#name").val(data["Table"][0].name);
                                        $("#user").val(data["Table"][0].userName);
                                        $("#user").attr("readonly", "readonly")
                                        $("#pass").val(data["Table"][0].userPwd);
                                        $("#grade").val(data["Table"][0].grade);
                                    })
                                    $("#myModal").modal();
                                }
                            </script>
                            <!-- 模态框（Modal） -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title" id="myModalLabel">操作页面</h4>
                                        </div>
                                            <form action="#" method="post">
                                        <div class="modal-body">
                                            <div class="input-group">
                                                <div class="input-group-addon">姓名</div>
                                                <input type="text" id="name" class="form-control" required="required" placeholder="请输入姓名"/>
                                            </div>
                                            <div class="input-group">
                                                <div class="input-group-addon">账号</div>
                                                <input type="text" id="user" class="form-control" required="required" placeholder="请输入账号"/>
                                            </div>
                                            <div class="input-group">
                                                <div class="input-group-addon">密码</div>
                                                <input type="text" id="pass" class="form-control" required="required" placeholder="请输入密码"/>
                                            </div>
                                            <div class="input-group">
                                                <div class="input-group-addon">权限</div>
                                                <select id="grade" class="form-control">
                                                    <option value="1">1</option>
                                                    <option value="2" selected="selected">2</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                            <!--<button type="button" class="btn btn-primary" onclick="tjgg()">提交更改</button>-->
                                            <input type="submit" class="btn btn-primary" onclick="tjgg()" value="提交更改"/>
                                            <button type="button" class="btn btn-danger" onclick="sccy()">删除成员</button>
                                            <script type="text/javascript">
                                                function tjgg() {
                                                    if ($("#name").val() == "" || $("#user").val() == "" || $("#pass").val() == "") {
                                                        alert("信息填写完整");
                                                        return false;
                                                    }
                                                    $.post("Info.ashx", {
                                                        type:"tjgg",
                                                        name:$("#name").val(),
                                                        user: $("#user").val(),
                                                        pass: $("#pass").val(),
                                                        grade: $("#grade").val()
                                                    }, function (data) {
                                                        if (data == "ok") {
                                                            alert("提交成功");
                                                            $("#myModal").modal('hide');
                                                            window.location.reload();
                                                        }
                                                        })
                                                }
                                                function sccy() {
                                                    alert("sccy");
                                                    $.post("Info.ashx", {
                                                        type: "sccy",
                                                        user: $("#user").val()
                                                    }, function (data) {
                                                        if (data == "ok") {
                                                            alert("删除成功");
                                                            $("#myModal").modal('hide');
                                                            window.location.reload();
                                                        }
                                                    })
                                                }
                                            </script>
                                        </div></form>
                                    </div>
                                </div>
                            </div>
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
