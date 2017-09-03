<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	    <p class="login-box-msg font-bareun">JSL연수생이라면 무료로 이용할 수 있습니다.</p>
	    <form action="../../index.html" method="post">
	      <div class="form-group has-feedback">
	        <input type="text" class="form-control" placeholder="성명">
	        <span class="glyphicon glyphicon-user form-control-feedback"></span>
	      </div>
	      <div class="form-group has-feedback">
	        <input type="email" class="form-control" placeholder="이메일">
	        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
	      </div>
	      <div class="form-group has-feedback">
	        <input type="password" class="form-control" placeholder="비밀번호">
	        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
	      </div>
	      <div class="form-group has-feedback">
	        <input type="password" class="form-control" placeholder="비밀번호 확인">
	        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
	      </div>
	      <div class="form-group has-feedback">
	        <input type="text" class="form-control" placeholder="기수" name ="isbn" id="isbn" onKeyDown = "javascript:onlyNumberInput(event)" style='IME-MODE: disabled' maxlength="2">
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
	    <a href="/JTalk/login.do">로그인</a>
	  </div>
	  <!-- /.form-box -->
	</div>
	<!-- /.register-box -->
	
	<!-- jQuery 3 -->
	<script src="/JTalk/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="/JTalk/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="/JTalk/plugins/iCheck/icheck.min.js"></script>
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
