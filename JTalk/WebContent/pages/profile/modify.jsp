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
  <!-- Ionicons -->
  <link rel="stylesheet" href="/JTalk/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/JTalk/dist/css/AdminLTE.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="/JTalk/dist/css/skins/_all-skins.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="/JTalk/bower_components/morris.js/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="/JTalk/bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="/JTalk/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="/JTalk/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="/JTalk/bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="/JTalk/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

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
              <span class="label label-success">4</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 4 messages</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- start message -->
                    <a href="#">
                      <div class="pull-left">
                        <img src="/JTalk/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Support Team
                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <!-- end message -->
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="/JTalk/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        AdminLTE Design Team
                        <small><i class="fa fa-clock-o"></i> 2 hours</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="/JTalk/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Developers
                        <small><i class="fa fa-clock-o"></i> Today</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="/JTalk/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Sales Department
                        <small><i class="fa fa-clock-o"></i> Yesterday</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="/JTalk/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Reviewers
                        <small><i class="fa fa-clock-o"></i> 2 days</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">See All Messages</a></li>
            </ul>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">${allNew}</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have ${allNew} notifications</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                <c:if test="${newComment != null}">
                  	<c:forEach var="item" items="${newComment}" varStatus="status">
	                  	<li>
		                    <a href="javascript:actionparam('${item.tableName}.action?command=detail', '${item.postNum}')">
		                      <i class="fa fa-users text-aqua"></i> ${tableName.get(status.index)} ${item.postNum}번 글 : ${item.newCount}개의 새 댓글
		                    </a>
	                  	</li>
                  	</c:forEach>
                  </c:if>
                  <!-- 
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the
                      page and may cause design problems
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-red"></i> 5 new members joined
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-user text-red"></i> You changed your username
                    </a>
                  </li>
                  -->
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="/JTalk/upload/${member.profile}" class="user-image" alt="User Image">
              <span class="hidden-xs font-bareun">${sessionScope.member.name}</span>
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
                  <a href="javascript:actionlink('profile.action');" class="btn btn-default btn-flat font-bareun"><i class="fa fa-user"></i> 프로필</a>
                </div>
                <div class="pull-right">
                  <a href="javascript:actionlink('logout.action?command=logout');" class="btn btn-default btn-flat font-bareun"><i class="fa fa-sign-out"></i> 로그아웃</a>
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
        <li><a href="#"><i class="fa fa-tree"></i> <span>대나무숲</span></a></li>
        <li><a href="#"><i class="fa fa-group"></i> <span>우리끼리</span></a></li>
        <li><a href="#"><i class="fa fa-comments-o"></i> <span>선후배교류</span></a></li>
         <li><a href="#"><i class="fa fa-share-alt"></i> <span>스터디모집</span></a></li>
        <li class="header">INFORMATION</li>
        <li><a href="#"><i class="fa fa-television"></i> <span>IT</span></a></li>
        <li><a href="#"><i class="fa fa-book"></i> <span>일본어</span></a></li>
        <li><a href="#"><i class="fa fa-cutlery"></i> <span>주변맛집</span></a></li>
        <li><a href="#"><i class="fa fa-check-square-o"></i> <span>생활정보</span></a></li>
        <li class="header">MARKETPLACE</li>
        <li><a href="#"><i class="fa fa-heart"></i> <span>행복나눔</span></a></li>
        <li><a href="#"><i class="fa fa-shopping-cart"></i> <span>중고나라</span></a></li>
        <li class="header">PROJECT</li>
        <li><a href="#"><i class="fa fa-th-large"></i> <span>전시관</span></a></li>
        <li><a href="#"><i class="fa fa-code"></i> <span>소스코드</span></a></li>
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
        <li class="active">회원 정보 변경</li>
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
              <h3 class="box-title"><i class="fa fa-info-circle"></i> 회원 정보 변경</h3>
            </div>
            <div class="box-body">
            <form action="/JTalk/profile.action?command=profilemodify" method="post" enctype="multipart/form-data">
				<div class="col-md-12 col-xs-12 form-horizontal">
					<c:if test="${not empty errorMsg}">
				    <div class="alert alert-danger alert-dismissible">
			          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			          <h4><i class="icon fa fa-warning"></i>변경 실패</h4>
			         	${errorMsg}
			        </div>
				    </c:if>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-4 control-label"><i class="fa fa-envelope"></i> 이메일</label>

                    <div class="col-sm-8">
                      <p class="imformation-field">${member.email}</p>
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-4 control-label"><i class="fa fa-check-square-o"></i> 이메일 인증</label>

                    <div class="col-sm-8">
                      <p class="imformation-field">확인</p>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputName" class="col-sm-4 control-label"><i class="fa fa-user"></i> 성명</label>

                    <div class="col-sm-8">
                    	<p class="imformation-field">
                      	<input type="text" class="form-control input-sm" placeholder="성명을 입력해주세요." name = "name" value="${sessionScope.member.name}"required>
                      	</p>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-4 control-label"><i class="fa fa-mortar-board "></i> 기수</label>

                    <div class="col-sm-8">
                    	<p class="imformation-field">
                    	<input type="text" class="form-control input-sm" placeholder="기수" name ="period" id="isbn" onKeyDown = "javascript:onlyNumberInput(event)" style='IME-MODE: disabled' maxlength="2" value="${member.period}"required>
                    	</p>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputName" class="col-sm-4 control-label"><i class="fa fa-calendar-check-o"></i> 가입일시</label>

                    <div class="col-sm-8">
                      <p class="imformation-field">
                      <fmt:formatDate var="date" value="${member.registerDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                  ${date}</p>
                    </div>
                  </div>     

                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-4 control-label"><i class="fa fa-image"></i> 사진등록</label>
                    <div class="col-sm-8">
                    		<div class="input-group imformation-field">
			                <input id = "uploadfield" type="text" class="form-control" value = "${member.profile}" readonly>
			                <div class="input-group-btn">
				              <div class="btn btn-default btn-file">
				                  <i class="glyphicon glyphicon-folder-open"></i>&nbsp;&nbsp;업로드
				                  <input type="file" name="file" onchange="$('#uploadfield').val(this.value.split('\\')[2]);">
				                </div>
				             </div>
			                <!-- /btn-group -->
					       </div>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-4 control-label"><i class="fa fa-user-plus"></i> 자기소개</label>

                    <div class="col-sm-8">
                      <p class="imformation-field">
                      	<textarea rows="6" name="pr" style="resize: none; width:100%;">${fn:replace(member.pr, '<br>', enter)}</textarea>
                      	</p>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-md-12 text-right">
                      <button type="submit" class="btn btn-primary">정보 변경</button>
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
    <strong>Copyright &copy; 2017 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>
  
</div>
<div id="actionpost"></div>
<!-- jQuery 3 -->
<script src="/JTalk/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/JTalk/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- jQuery pagination -->
<script src ="/JTalk/bower_components/pagination/jquery.twbsPagination.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/JTalk/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="/JTalk/bower_components/raphael/raphael.min.js"></script>
<script src="/JTalk/bower_components/morris.js/morris.min.js"></script>
<!-- Sparkline -->
<script src="/JTalk/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="/JTalk/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/JTalk/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="/JTalk/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="/JTalk/bower_components/moment/min/moment.min.js"></script>
<script src="/JTalk/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="/JTalk/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="/JTalk/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="/JTalk/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/JTalk/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/JTalk/dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/JTalk/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/JTalk/dist/js/demo.js"></script>
<!-- Javascript of ActionPost -->
<script src="/JTalk/dist/js/actionpost.js"></script>
<!-- Javascript of Sidebar toggle -->
<script src="/JTalk/dist/js/sidebar.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="/JTalk/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- DataTables -->
<script src="/JTalk/bower_components/datatables.net/js/jquery.dataTables.js"></script>
<script src="/JTalk/bower_components/datatables.net-bs/js/dataTables.bootstrap.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);


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