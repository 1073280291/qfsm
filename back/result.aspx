<%@ Page Language="C#" AutoEventWireup="true" CodeFile="result.aspx.cs" Inherits="back_result" %>

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

        .bt {
            font-weight: bolder;
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
                                <li ><a href="pj.aspx">手机配件</a></li>
                                <li><a href="print.aspx">打印复印</a></li>
                                <li><a href="newPhone.aspx">手机购买</a></li>
                                <li><a href="oldPhone.aspx">二手机平台</a></li>
                                <li ><a href="Info.aspx">信息管理</a></li>
                                <li ><a href="sap.aspx">绩效查看</a></li>
                                <li><a href="Default.aspx">退出</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        查询结果
                    </div>
                    <div class="panel-body">
                        <div><a href="#" style="font-size: 20px; margin-left:10px;" onclick="save()">导出成员</a></div>
                        <table class="table table-responsive" id="info">
                            <tr>
                                <td>序号</td>
                                <td>姓名</td>
                                <td>性别</td>
                                <td>区域</td>
                                <td>操作</td>
                            </tr>
                            <%
                                for (int i = 0; i < item.Count; i++)
                                {

                                    Response.Write("<tr><td>" + (i + 1).ToString() + "</td> <td>" + item[i][1].ToString() + "</td> <td>" + item[i][2].ToString() + "</td><td>" + item[i][3].ToString() + "</td><td><a href='#' onclick='cz(" + item[i][0] + ")'>详细</a></td></tr>");
                                }
                            %>
                        </table>
                        <script>
                            function cz(index) {
                                $.post("tm.ashx", {
                                    type: "cz",
                                    index: index
                                }, function (data) {
                                    data = JSON.parse(data);
                                    $("#id").text(data["Table"][0].id);
                                    $("#name").text(data["Table"][0].name);
                                    $("#sex").text(data["Table"][0].sex);
                                    $("#school").text(data["Table"][0].school); 
                                    $("#address").text(data["Table"][0].address);
                                    $("#location").text(data["Table"][0].location);
                                    $("#xh").text(data["Table"][0].xh);
                                    $("#type").text(data["Table"][0].xq);
                                    $("#qq").text(data["Table"][0].qq);
                                    $("#tel").text(data["Table"][0].tel);
                                    $("#ggxq").text(data["Table"][0].ggxq);
                                    $("#status").text(data["Table"][0].status);
                                    $("#person").text(data["Table"][0].person);
                                })
                                $("#myModal").modal();
                            }
                            function save() {
                                $.post("excle.ashx", {
                                    type: "list",
                                }, function (data) {
                                    window.location = data;
                                    
                                })
                            }
                        </script>
                        <div class="modal fade " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title" id="myModalLabel">详细页面</h4>
                                    </div>
                                    <form action="#" method="post">
                                        <div class="modal-body">
                                            <table class="table table-responsive">
                                                <tr>
                                                    <td><b>订单号</b></td>
                                                    <td id="id" colspan="3" class="text-info"></td>
                                                </tr>
                                                <tr>
                                                    <td><b>姓名</b></td>
                                                    <td id="name" class="text-info"></td>
                                                    <td><b>性别</b></td>
                                                    <td id="sex" class="text-info"></td>
                                                </tr>
                                                <tr>
                                                    <td><b>区域</b></td>
                                                    <td id="school" class="text-info"></td>
                                                    <td><b>地点</b></td>
                                                    <td id="location" class="text-info"></td>
                                                </tr>
                                                <tr>
                                                    <td><b>门牌号</b></td>
                                                    <td id="address" colspan="3" class="text-info"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"><b>服务对象</b></td>
                                                    <td colspan="2" id="xh" class="text-info"></td>
                                                </tr>
                                                <tr>
                                                    <td><b>需求</b></td>
                                                    <td colspan="3" id="type" class="text-info"></td>
                                                </tr>
                                                <tr>
                                                    <td><b>联系QQ</b></td>
                                                    <td colspan="3" id="qq" class="text-info"></td>
                                                </tr>
                                                <tr>
                                                    <td><b>联系电话</b></td>
                                                    <td colspan="3" id="tel" class="text-info"></td>
                                                </tr>
                                                <tr>
                                                    <td><b>更多需求</b></td>
                                                    <td colspan="3" id="ggxq" class="text-info"></td>
                                                </tr>
                                                <tr>
                                                    <td><b>状态</b></td>
                                                    <td id="status" class="text-info"></td>
                                                    <td><b>负责人</b></td>
                                                    <td id="person" class="text-info"></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                </div>
                </div>
            </div>
            <div class="col-md-2 hidden-sm"></div>
        </div>
    </div>
    <div>
    </div>
</body>
</html>