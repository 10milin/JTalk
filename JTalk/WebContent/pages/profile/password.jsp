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
</head>
<body class="${body}">
<div class="wrapper">
 <header class="main-header">
    <!-- Logo -->
    <a href="javascript:actionlink('index.action');" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>J</b>SL</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>J-TALK</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button" onclick="toggle();">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success">${newMessage}</span>
            </a>
           	<c:if test="${empty newMessageList}">
           	  <ul class="dropdown-menu">
              	<li class="header">새로운 메시지가 없습니다.</li>
              	<li class="footer"><a href="javascript:actionlink('message.action?command=messagetab');">모든 메시지 보기</a></li>
              </ul>
           	</c:if>
            <c:if test="${not empty newMessageList}">
            <ul class="dropdown-menu">
              <li class="header">새로운 메시지가 ${newMessage}개 있습니다.</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <c:forEach var = "item" items="${newMessageList}">
					<li><!-- start message -->
						<a href="javascript:actionparam('message.action?command=show', '${item.num}')">
							<div class="pull-left">
								<img src="/JTalk/upload/${item.sendProfile}" class="img-circle" alt="User Image">
							</div>
							<h4>
								${item.sendName}
								<fmt:formatDate var="date" value="${item.writeDate}" pattern="yy-MM-dd" />
								<small><i class="fa fa-clock-o"></i> <span class="messagefontsize">${date}</span></small>
							</h4>
							<p>${item.title}</p>
						</a>
					</li>
                  </c:forEach>
                </ul>
              </li>
              <li class="footer"><a href="javascript:actionlink('message.action');">모든 메시지 보기</a></li>
            </ul>
            </c:if>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning" id="notifications-count">${allNew}</span>
            </a>
            <c:if test="${empty newComment}">
            <ul class="dropdown-menu" id="notifications-ul">
              <li class="header">새로운 알림이 없습니다.</li>
            </ul>
            </c:if>
            <c:if test="${not empty newComment}">
            <ul class="dropdown-menu" id="notifications-ul">
              <li class="header">새로운 알림이 ${allNew}개 있습니다.</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  	<c:forEach var="item" items="${newComment}" varStatus="status">
	                  	<li>
	                  		<c:choose >
	                  			<c:when test="${item.tableName eq 'notice'}"><c:set var="ico" value = "fa-bullhorn text-red"/></c:when>
	                  			<c:when test="${item.tableName eq 'trade'}"><c:set var="ico" value = "fa-shopping-cart text-green"/></c:when>
	                  			<c:when test="${item.tableName eq 'nanum'}"><c:set var="ico" value = "fa-heart text-green"/></c:when>
	                  			<c:when test="${item.tableName eq 'it'}"><c:set var="ico" value = "fa-television text-blue"/></c:when>
	                  			<c:when test="${item.tableName eq 'japanese'}"><c:set var="ico" value = "fa-book text-blue"/></c:when>
	                  			<c:when test="${item.tableName eq 'food'}"><c:set var="ico" value = "fa-cutlery text-blue"/></c:when>
	                  			<c:when test="${item.tableName eq 'life'}"><c:set var="ico" value = "fa-check-square-o text-blue"/></c:when>
	                  			<c:when test="${item.tableName eq 'we'}"><c:set var="ico" value = "fa-group text-yellow"/></c:when>
	                  			<c:when test="${item.tableName eq 'study'}"><c:set var="ico" value = "fa-share-alt text-orange"/></c:when>
	                  			<c:when test="${item.tableName eq 'exchange'}"><c:set var="ico" value = "fa-comments-o text-orange"/></c:when>
	                  			<c:when test="${item.tableName eq 'speech'}"><c:set var="ico" value = "fa-child text-olive"/></c:when>
	                  			<c:when test="${item.tableName eq 'project'}"><c:set var="ico" value = "fa-code text-olive"/></c:when>
	                  		</c:choose>
		                    <a href="javascript:actionparam('${item.tableName}.action?command=detail', '${item.postNum}')">
		                      <i class="fa ${ico}"></i> ${tableName.get(status.index)} ${item.postNum}번 글 : ${item.newCount}개의 새 댓글
		                    </a>
	                  	</li>
                  	</c:forEach>
                </ul>
              </li>
              <li class="footer"><a href="javascript:newcmtreset('${member.email}')"><i class="fa fa-bell-slash text-red" style="margin-right:5px;"></i>모든 알림 끄기</a></li>
            </ul>
            </c:if>
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="/JTalk/upload/${member.profile}" class="user-image" alt="User Image">
              <span class="hidden-xs font-bareun">${member.name}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="/JTalk/upload/${member.profile}" class="img-circle" alt="User Image">
                <p>
                  <b> 
                  <c:if test="${member.active eq 1}">JSL ${member.period}기 </c:if>
                  ${member.name}</b>
                  <fmt:formatDate var="date" value="${member.registerDate}" pattern="yyyy-MM-dd" />
                  <small>가입일 - ${date}</small>
                </p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="javascript:actionlink('profile.action?command=profile');" class="btn btn-default btn-flat font-bareun"><i class="fa fa-user"></i> 프로필</a>
                </div>
                <div class="pull-right">
                  <a href="javascript:actionlink('logout.action');" class="btn btn-default btn-flat font-bareun"><i class="fa fa-sign-out"></i> 로그아웃</a>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <ul class="sidebar-menu" data-widget="tree">
      	<li class="header">NOTICE</li>
      	<li><a href="javascript:actionlink('notice.action?command=notice');"><i class="fa fa-bullhorn"></i> <span>공지사항</span></a></li>
        <li class="header">COMMUNITY</li>
        <li><a href="javascript:actionlink('anony.action?command=anony');"><i class="fa fa-tree"></i> <span>대나무숲</span></a></li>
        <li><a href="javascript:actionlink('we.action?command=we');"><i class="fa fa-group"></i> <span>우리끼리</span></a></li>
        <li><a href="javascript:actionlink('exchange.action?command=exchange');"><i class="fa fa-comments-o"></i> <span>선후배교류</span></a></li>
         <li><a href="javascript:actionlink('study.action?command=study');"><i class="fa fa-share-alt"></i> <span>스터디모집</span></a></li>
        <li class="header">INFORMATION</li>
        <li><a href="javascript:actionlink('it.action?command=it');"><i class="fa fa-television"></i> <span>IT</span></a></li>
        <li><a href="javascript:actionlink('japanese.action?command=japanese');"><i class="fa fa-book"></i> <span>일본어</span></a></li>
        <li><a href="javascript:actionlink('food.action?command=food');"><i class="fa fa-cutlery"></i> <span>주변맛집</span></a></li>
        <li><a href="javascript:actionlink('life.action?command=life');"><i class="fa fa-check-square-o"></i> <span>생활정보</span></a></li>
        <li class="header">MARKETPLACE</li>
        <li><a href="javascript:actionlink('nanum.action?command=nanum');"><i class="fa fa-heart"></i> <span>행복나눔</span></a></li>
        <li><a href="javascript:actionlink('trade.action?command=trade');"><i class="fa fa-shopping-cart"></i> <span>중고나라</span></a></li>
        <li class="header">PRESENTATION</li>
        <li><a href="javascript:actionlink('speech.action?command=speech');"><i class="fa fa-child"></i> <span>스피치</span></a></li>
        <li><a href="javascript:actionlink('project.action?command=project');"><i class="fa fa-code"></i> <span>프로젝트</span></a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
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
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> ${applicationScope.version}
    </div>
    <strong>Copyright &copy; 2017 <a>KLM Studio</a>.</strong> All rights
    reserved.
  </footer>
  
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