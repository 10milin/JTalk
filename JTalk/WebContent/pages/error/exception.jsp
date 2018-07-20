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
  <!-- Theme style -->
  <link rel="stylesheet" href="/JTalk/dist/css/AdminLTE.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <link rel="icon" type="image/png" sizes="16x16" href="/JTalk/dist/img/favicon.png">
</head>
<body class="hold-transition lockscreen">
<!-- Automatic element centering -->
<div class="lockscreen-wrapper">
  <div class="lockscreen-logo">
    <a href="javascript:actionlink('index.action');"><b>JTalk</b></a>
  </div>
  <!-- /.lockscreen-item -->
  <div class="help-block text-center">
    <h3 class="font-bareun" style="color:#dd4b39;"><i class="fa fa-warning text-red"></i> 아래와 같은 오류가 발생하였습니다.</h3>
  </div>
  <br>
  <div class="text-center">
    <span style="font-size:16px; font-weight: 600;">${error}</span>
    <br>
    <br>
    <p>웹브라우저의 뒤로가기를 누르거나 <a href="javascript:actionlink('index.action');">시작화면</a>으로 이동해주세요.
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
<script src="/JTalk/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/JTalk/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/JTalk/dist/js/utils.js"></script>
<script src="/JTalk/dist/js/adminlte.min.js"></script>
</body>
</html>