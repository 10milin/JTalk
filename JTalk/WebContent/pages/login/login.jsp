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
	  
	  <!-- Google Font -->
	  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	</head>
	<body class="hold-transition login-page" style="height:auto;">
	<div class="login-box">
	  <div class="login-logo">
	    <b>J-TALK</b>
	  </div>
	  <!-- /.login-logo -->
	  <div class="login-box-body">
	    <p class="login-box-msg font-bareun">J-TALK에서 많은 이야기를 나눠보세요.</p>
	    <c:if test="${not empty successMsg}">
	    <div class="alert alert-success alert-dismissible">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          <h4><i class="icon fa fa-check"></i>회원가입 완료</h4>
         	${successMsg}
        </div>
	    </c:if>
	    <c:if test="${not empty authMsg}">
	    <div class="alert alert-success alert-dismissible">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          <h4><i class="icon fa fa-check"></i>임시 비밀번호 발급 완료</h4>
         	${authMsg}
        </div>
	    </c:if>
	    <c:if test="${not empty errorMsg}">
	    <div class="alert alert-danger alert-dismissible">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          <h4><i class="icon fa fa-warning"></i>로그인 실패</h4>
         	${errorMsg}
        </div>
	    </c:if>
	    <form action="/JTalk/login.action?command=login" method="post">
	      <div class="form-group has-feedback">
	        <input type="email" class="form-control" placeholder="이메일" value="${email}" name = "email">
	        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
	      </div>
	      <div class="form-group has-feedback">
	        <input type="password" class="form-control" placeholder="비밀번호" name = "pass">
	        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
	      </div>
	      <div class="row">
	        <div class="col-xs-8">
	          <div class="checkbox icheck">
	            <label>
	              <input type="checkbox"> 이메일 저장
	            </label>
	          </div>
	        </div>
	        <!-- /.col -->
	        <div class="col-xs-4">
	          <button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
	        </div>
	        <!-- /.col -->
	      </div>
	    </form>
	
	    <!-- /.social-auth-links -->
	
	    <a href="javascript:actionlink('recovery.action');">비밀번호 찾기</a><br>
	    <a href="javascript:actionlink('register.action');">회원가입</a>
	
	  </div>
	  <!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->
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
	</script>
	</body>
</html>