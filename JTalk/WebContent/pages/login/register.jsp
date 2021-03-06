<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	  <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <title>J-Talk</title>
	  <!-- Tell the browser to be responsive to screen width -->
	  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	  <!-- Bootstrap 3.3.7 -->
	  <link rel="stylesheet" href="/JTalk/bower_components/bootstrap/dist/css/bootstrap.min.css">
	  <!-- Font Awesome -->
	  <link rel="stylesheet" href="/JTalk/bower_components/font-awesome/css/font-awesome.min.css">
	  <!-- Theme style -->
	  <link rel="stylesheet" href="/JTalk/dist/css/AdminLTE.css">
	  <!-- iCheck -->
	  <link rel="stylesheet" href="/JTalk/plugins/iCheck/square/blue.css">
	  <!-- Google Font -->
	  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	  <link rel="icon" type="image/png" sizes="16x16" href="/JTalk/dist/img/favicon.png">
	</head>
	<body class="hold-transition register-page" style="height:auto;">
	<div class="register-box">
	  <div class="register-logo">
	    <b>J-TALK</b>
	  </div>
	
	  <div class="register-box-body">
	    <p class="login-box-msg font-bareun">JSL연수생이라면 무료로 이용할 수 있습니다.</p>
	    <form id="rg-form" action="/JTalk/register.action?command=register" method="post" onsubmit="return checkval();">
	      <div class="form-group has-feedback">
	        <input type="text" class="form-control" placeholder="성명" name = "name" maxlength="10" required>
	        <span class="glyphicon glyphicon-user form-control-feedback"></span>
	      </div>
	      <div class="form-group has-feedback">
	        <input type="email" class="form-control" placeholder="이메일" name = "email"  onkeypress = "if(event.keyCode == 32) event.returnValue = false;" onblur="checkemail(this)"  onfocus="checkemail(this)"autocomplete=”off” maxlength="30" required>
	        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
	      </div>
	      <div id="msg-email" class="alert alert-danger alert-dismissible" style="display:none;">
         	<p id = "msg-content"></p>
          </div>
	      <div class="form-group has-feedback">
	        <input id="pass-a" type="password" class="form-control" placeholder="비밀번호" onblur="checkpass()" onfocus="checkpass()" name = "pass" maxlength="15" required>
	        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
	      </div>
	      <div class="form-group has-feedback">
	        <input id="pass-b" type="password" class="form-control" placeholder="비밀번호 확인" onblur="checkpass()" onfocus="checkpass()" maxlength="15" required>
	        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
	      </div>
	      <div id="msg-pass" class="alert alert-danger alert-dismissible" style="display:none;">
         	<p id = "msg-content2"></p>
          </div>
	      <div class="form-group has-feedback">
	        <input type="text" class="form-control" placeholder="기수" name ="period" id="isbn" onKeyDown = "javascript:onlyNumberInput(event)" style='IME-MODE: disabled' maxlength="2" required>
	        <span class="fa fa-mortar-board form-control-feedback"></span>
	      </div>
	      <div class="row">
	        <div class="col-xs-8"></div>
	        <!-- /.col -->
	        <div class="col-xs-4">
	          <button type="submit" class="btn btn-primary btn-block btn-flat">회원가입</button>
	        </div>
	        <!-- /.col -->
	      </div>
	    </form>
	    <a href="javascript:actionlink('login.action');">로그인</a>
	  </div>
	  <!-- /.form-box -->
	</div>
	<!-- /.register-box -->
	<div id="actionpost"></div>
	<script src="/JTalk/bower_components/jquery/dist/jquery.min.js"></script>
	<script src="/JTalk/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="/JTalk/plugins/iCheck/icheck.min.js"></script>
	<script src="/JTalk/dist/js/utils.js"></script>
	<script src="/JTalk/dist/js/adminlte.min.js"></script>
	</body>
</html>
