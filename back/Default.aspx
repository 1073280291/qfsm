<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="back_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>轻风数码后台管理系统</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 100%;">
            <div class="container-fluid">
                <div class="col-md-4 hidden-sm"></div>
                <div class="col-md-4 col-sm-12">
                    <table class="table table-responsive">
                        <tr>
                            <td class="text-center" colspan="2" style="font-weight: bolder; font-size: 22px;">用户登入</td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span>账号</span>
                                    <input size="30" id="Text1" runat="server" class="form-control" autocomplete="off" required="required" placeholder="请输入账号" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span>密码</span>
                                    <input size="30" type="password" id="Password1" runat="server" class="form-control" autocomplete="off" required="required" placeholder="请输入密码" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="Button1" Text="登入" runat="server" OnClick="Button1_Click" CssClass="btn btn-primary" Width="100%" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-4 hidden-sm ">
                </div>
            </div>
        </div>
        <div>
        </div>
    </form>
</body>
</html>
