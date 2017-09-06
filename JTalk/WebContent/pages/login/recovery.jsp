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
	  <!-- Ionicons -->
	  <link rel="stylesheet" href="/JTalk/bower_components/Ionicons/css/ionicons.min.css">
	  <!-- Theme style -->
	  <link rel="stylesheet" href="/JTalk/dist/css/AdminLTE.css">
	  <!-- iCheck -->
	  <link rel="stylesheet" href="/JTalk/plugins/iCheck/square/blue.css">
	
	  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	  <!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	  <![endif]-->
	
	  <!-- Google Font -->
	  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	</head>
	<body class="hold-transition register-page" style="height:auto;">
	<div class="register-box">
	  <div class="register-logo">
	    <b>J-TALK</b>
	  </div>
	
	  <div class="register-box-body">
	    <p class="login-box-msg font-bareun">임시 비밀번호를 발급해드립니다.</p>
	    <c:if test="${not empty errorMsg}">
	    <div class="alert alert-danger alert-dismissible">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          <h4><i class="icon fa fa-warning"></i>발급 실패</h4>
         	${errorMsg}
        </div>
	    </c:if>
	    <c:if test="${not empty successMsg}">
	    <div class="alert alert-success alert-dismissible">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          <h4><i class="icon fa fa-check"></i>발급 성공</h4>
         	${successMsg}
        </div>
	    </c:if>
	    <form action="/JTalk/recovery.do?command=action" method="post">
	      <div class="form-group has-feedback">
	        <input type="email" class="form-control" placeholder="이메일" name = "email">
	        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
	      </div>
	      <div class="form-group has-feedback">
	        <input type="text" class="form-control" placeholder="성명" name = "name">
	        <span class="glyphicon glyphicon-user form-control-feedback"></span>
	      </div>
	      <div class="form-group has-feedback">
	        <input type="text" class="form-control" placeholder="기수" name ="period" id="isbn" onKeyDown = "javascript:onlyNumberInput(event)" style='IME-MODE: disabled' maxlength="2">
	        <span class="fa fa-mortar-board form-control-feedback"></span>
	      </div>
	      <div class="row">
	        <div class="col-xs-8"></div>
	        <!-- /.col -->
	        <div class="col-xs-4">
	          <button type="submit" class="btn btn-primary btn-block btn-flat">발급</button>
	        </div>
	        <!-- /.col -->
	      </div>
	    </form>
	    <a href="javascript:actionlink('login.do');">로그인</a>
	  </div>
	  <!-- /.form-box -->
	</div>
	<!-- /.register-box -->
	<div id="actionpost"></div>
	<!-- jQuery 3 -->
	<script src="/JTalk/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="/JTalk/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="/JTalk/plugins/iCheck/icheck.min.js"></script>
	<!-- Javascript of ActionPost -->
	<script src="/JTalk/dist/js/actionpost.js"></script>
	<script>
	  $(function () {
	    $('input').iCheck({
	      checkboxClass: 'icheckbox_square-blue',
	      radioClass: 'iradio_square-blue',
	      increaseArea: '20%' // optional
	    });
	  });
	
	  function onlyNumberInput( Ev ) {
	    if (window.event) var code = window.event.keyCode;
	    else var code = Ev.which;
	
	    if ((code > 34 && code < 41) || (code > 47 && code < 58) || (code > 95 && code < 106) || code == 8 || code == 9 || code == 13 || code == 46)    {
	            window.event.returnValue = true;
	            return;
	    }
	
	    if (window.event) window.event.returnValue = false;
	    else Ev.preventDefault();
	  }
	</script>
	</body>
</html>
