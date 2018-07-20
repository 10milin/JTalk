<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("enter","\n"); %>
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
  <link rel="stylesheet" href="/JTalk/dist/css/skins/_all-skins.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <link rel="icon" type="image/png" sizes="16x16" href="/JTalk/dist/img/favicon.png">
</head>
<body class="<c:out value="${body}"/>">
<div class="wrapper">
  <jsp:include page="../header.jsp"/>
  <!-- Left side column. contains the logo and sidebar -->
  <jsp:include page="../aside.jsp"/>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  	<section class="content-header">
      <h1 class="font-bareun">
        <i class="fa fa-user "></i> 프로필
        <small>회원정보를 확인 할 수 있습니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="javascript:actionlink('index.action');"><i class="fa fa-home"></i> Home</a></li>
        <li><a href="javascript:actionlink('profile.action');"><i class="fa fa-user"></i>프로필</a></li>
        <li class="active">비밀번호 변경</li>
      </ol>
    </section>
    <section class="content">
		<div class="row">
        <div class="col-md-3 padding-right">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="/JTalk/upload/${member.profile}" alt="User profile picture">

              <h3 class="profile-username text-center">${sessionScope.member.name}</h3>

              <p class="text-muted text-center">JSL - ${sessionScope.member.period}기</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>이메일</b> <a class="pull-right">${sessionScope.member.email}</a>
                </li>
                <li class="list-group-item">
                  <b>가입일</b><a class="pull-right">
                  	<fmt:formatDate var="date" value="${sessionScope.member.registerDate}" pattern="yyyy-MM-dd" />
                  	${date}
                  </a>
                </li>
              </ul>

              <a href="javascript:actionlink('profile.action?command=passform');" class="btn btn-primary btn-block"><b>비밀번호 변경</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
  
          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-user-plus margin-r-5"></i> 자기소개</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              ${fn:replace(member.pr, enter, '<br>')}
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="glyphicon glyphicon-lock"></i> 비밀번호 변경</h3>
            </div>
            <div class="box-body">
            <form action="/JTalk/profile.action?command=passchange" method="post">
				<div class="col-md-12 col-xs-12 form-horizontal">
					<c:if test="${not empty errorMsg}">
				    <div class="alert alert-danger alert-dismissible">
			          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			          <h4><i class="icon fa fa-warning"></i>변경 실패</h4>
			         	${errorMsg}
			        </div>
				    </c:if>
				    <c:if test="${not empty successMsg}">
				    <div class="alert alert-success alert-dismissible">
			          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			          <h4><i class="icon fa fa-check"></i>변경 완료</h4>
			         	${successMsg}
			        </div>
				    </c:if>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-4 control-label"><i class="fa fa-unlock-alt"></i> 현재 비밀번호</label>
                    <div class="col-sm-4" style="padding-top:3px;">
                      <input type="password" class="form-control input-sm" placeholder="현재 비밀번호를 입력해주세요." name = "oldpass" required>
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="inputName" class="col-sm-4 control-label"><i class="glyphicon glyphicon-lock"></i> 새 비밀번호</label>
                    <div class="col-sm-4" style="padding-top:3px;">
                      <input type="password" class="form-control input-sm" placeholder="변경할 비밀번호를 입력해주세요." name = "newpass" required>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputName" class="col-sm-4 control-label"><i class="fa fa-check-square-o"></i> 새 비밀번호 확인</label>
                    <div class="col-sm-4" style="padding-top:3px;">
                      <input type="password" class="form-control input-sm" placeholder="다시한번 입력해주세요." name = "newpasscheck" required>
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="col-md-12 text-right">
                      <button type="submit" class="btn btn-primary">비밀번호 변경</button>
                    </div>
                  </div>
                </div>
                </form>
            </div>
          </div>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
	</section>
  </div>
  <jsp:include page="../footer.jsp"/>
</div>
<div id="actionpost"></div>
<script src="/JTalk/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/JTalk/bower_components/jquery-ui/jquery-ui.min.js"></script>
<script src="/JTalk/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/JTalk/bower_components/datatables.net/js/jquery.dataTables.js"></script>
<script src="/JTalk/bower_components/datatables.net-bs/js/dataTables.bootstrap.js"></script>
<script src="/JTalk/dist/js/utils.js"></script>
<script src="/JTalk/dist/js/adminlte.min.js"></script>
</body>
</html>