<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=3, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>图书管理系统</title>
    <style>
        body{
            background-image: url(${pageContext.request.contextPath}/images/login-bg.jpg);
            background-repeat: no-repeat;
            background-size: cover;
        }
        .login{
            width: 400px;
            height:350px;
            margin: 10% 60%;
            text-align: center;
        } 
        form{
            margin-top: 10px;
            line-height: 40px;
        }
        input{
            width: 200px;
            height: 20px;
            margin: 20px;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size: 15px;
            border: 2px #f5f5f5 solid;
            border-radius: 5px;
        }
        #sub{
            width: 290px;
            height: 35px;
            background-color: #409eff;
            border: 0px #f5f5f5 solid;
            color: rgb(233, 220, 220);
            margin-left: 6px;
        }
        legend{
            font-size: 30px;
            font-family: 华文行楷;
            color: #044e97;
            text-align: center;
        }
        fieldset{
            border: 2px #90b7f7 solid;
            box-shadow: 0 2px 12px 0 rgba(24, 21, 21, 0.1);
            border-radius: 10px;
        }
    </style>
    <script>
    	function check(){
     		console.log('HHH！');
        	var username = $("#username").val().trim();
        	var password = $("#password").val().trim();
        	alert(username + "-" + password);
        	if(username=="" || username==null || password=="" || password==null){
           	    $("#message").text("账号或密码不能为空！");
            	console.log('HHH！');
            	return false;
        	}  
        	return true;
    	}
	</script>
</head>
<body>
    <div class="login">     
        <form action="${pageContext.request.contextPath }/login.action" method="post" onsubmit="return check()">
            <fieldset>
                <legend>
                    	欢迎使用图书管理系统  
                </legend>
                <font color="red">
                    <%-- 提示信息--%>
                    <span id="message">${msg}</span>
                </font><br>
                &emsp;用户名: <input type="text" name="username"><br>
                &emsp;密&emsp;码: <input type="password" name="password"><br>
                &emsp;<input  id="sub" type="submit" value="点击登录">
            </fieldset>   
        </form>
    </div>  
    
</body>
</html>