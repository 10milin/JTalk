<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>JTalk</title>
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

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition lockscreen">
<!-- Automatic element centering -->
<div class="lockscreen-wrapper">
  <div class="lockscreen-logo">
    <a href="javascript:actionlink('index.action');"><b>JTalk</b></a>
  </div>
  <!-- /.lockscreen-item -->
  <div class="help-block text-center">
    <h3 class="font-bareun" style="color:#f39c12;"><i class="fa fa-warning text-yellow"></i> 정상적인 접근이 아닙니다.</h3>
  </div>
  <br>
  <div class="text-center">
    <span>페이지가 존재하지 않거나 비정상적인 방법으로 접근하였습니다.<br>서비스 이용에 불편을 드려 죄송합니다.</span>
    <br>
    <br>
    <p><a href="javascript:actionlink('index.action');">시작화면</a>으로 이동하거나 
           <a href="#">서비스 문제점 신고</a>로 알려주세요.
    </p>
  </div>
  <br>
  <div class="lockscreen-footer text-center">
    Copyright &copy; 2017 <b><a class="text-black">KLM Studio</a></b><br>
    All rights reserved
  </div>
</div>
<!-- /.center -->
<div id="actionpost"></div>
<!-- jQuery 3 -->
<script src="/JTalk/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/JTalk/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Javascript of ActionPost -->
<script src="/JTalk/dist/js/actionpost.js"></script>
</body>
</html>