<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="back_index" %>

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

    <form id="form1" runat="server">

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
                                    <li><a href="print.aspx">打印复印</a></li>
                                    <li><a href="newPhone.aspx">手机购买</a></li>
                                    <li><a href="oldPhone.aspx">二手机平台</a></li>
                                    <li><a href="Info.aspx">信息管理</a></li>
                                    <li><a href="sap.aspx">绩效查看</a></li>
                                    <li><a href="Default.aspx">退出</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                    <div class="container-fluid">
                        <div class="col-xs-12 col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon">订单号</span>
                                <input type="text" class="form-control" placeholder="请输入订单号" required="required" id="id"/>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon">客户姓名</span>
                                <input type="text" class="form-control" placeholder="请输入客户姓名" required="required" id="xm"/>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon">负责人姓名</span>
                                <input type="text" class="form-control" placeholder="请输入负责人姓名" required="required" id="person"/>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="input-group">
                            <span class="input-group-addon">订单状态</span>
                            <select class="form-control chosen-select" required="required" id="status">
                                <option value="" selected="selected">请选择</option>
                                <option value="已下单">已下单</option>
                                <option value="完成中">完成中</option>
                                <option value="已完成">已完成</option>
                                <option value="已收账">已收账</option>
                            </select>
                               </div>
                        </div>
                        <div class="col-xs-12 col-md-4">
                           <div class="input-group">
                            <span class="input-group-addon">区域</span>
                            <select class="form-control chosen-select" required="required" id="school">
                                <option value="" selected="selected">请选择</option>
                                <option value="金银湖">金银湖</option>
                                <option value="常青">常青</option>
                                <option value="常青公寓">常青公寓</option>
                                <option value="校外">校外</option>
                            </select>
                        </div>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="input-group">
                            <span class="input-group-addon">服务类型</span>
                            <select class="form-control chosen-select" required="required" id="type">
                                <option value="" selected="selected">请选择</option>
                                <option value="上门贴膜">上门贴膜</option>
                                <option value="打印复印">打印复印</option>
                                <option value="手机配件">手机配件</option>
                                <option value="维修">维修</option>
                                <option value="二手机平台">二手机平台</option>
                                <option value="新机购买">新机购买</option>
                            </select>
                               </div>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="input-group">
                            <span class="input-group-addon">性别</span>
                            <select class="form-control chosen-select" required="required" id="sex">
                                <option value="" selected="selected">请选择</option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                               </div>
                        </div>
                         <div class="col-xs-12 col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon">开始时间</span>
                                <input type="date" class="form-control"  required="required" id="start"/>
                            </div>
                        </div>
                         <div class="col-xs-12 col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon">结束时间</span>
                                <input type="date" class="form-control"   required="required" id="end"/>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon">客户QQ</span>
                                <input type="text" class="form-control" placeholder="请输入客户QQ" required="required" id="qq"/>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon">客户手机</span>
                                <input type="text" class="form-control" placeholder="请输入客户客户手机" required="required" id="tel"/>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon">负责人账号</span>
                                <input type="text" class="form-control" placeholder="请输入负责人姓名" required="required" id="user"/>
                            </div>
                        </div>
                        <div class=" hidden-xs col-md-5"></div>
                        <div class="col-xs-12 col-md-2">
                            <div class="input-group" style="width:100%">
                                <input type="button" class="form-control btn btn-primary" onclick="jd()" style="width:100%;margin-top:10px;" value="查询" />
                            </div>
                        </div>
                        
                        <div class=" hidden-xs col-md-5"></div>
                    </div>

                    <div class="navbar-fixed-bottom">
                        <div class="text-center h5">
                            <p>&copy 轻风数码 <%=DateTime.Now.Year %> | 制作团队：胡云、孙见弛</p>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    function jd() {
                        st = "";
                        en = "";
                        if ($("#start").val() != "") {
                            st = $("#start").val().split('-');
                            st=st[0] + st[1] + st[2] + "000000";
                        }
                        if ($("#end").val() != "") {
                            en = $("#end").val().split('-');
                            en = st[0] + st[1] + st[2] + "000000";
                        }
                        $.post("jd.ashx", {
                            name: $("#xm").val(),
                            id: $("#id").val(),
                            sex: $("#sex").val(),
                            school: $("#school").val(),
                            qq: $("#qq").val(),
                            tel: $("#tel").val(),
                            type: $("#type").val(),
                            start: st,
                            end: en,
                            user: $("#user").val(),
                            person: $("#person").val(),
                            status: $("#status").val()
                        }, function (data) {
                            if (data >0) {
                                window.location.href = 'result.aspx';
                            } else {
                                alert("查询无果");
                            }
                        })
                    }
                </script>
                <div class="col-md-2 hidden-sm"></div>
            </div>

        </div>
    </form>
</body>
</html>
