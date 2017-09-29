<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <!-- Daterange picker -->
  <link rel="stylesheet" href="/JTalk/bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- Summernote -->
  <link rel="stylesheet" href="/JTalk/bower_components/summernote/dist/summernote.css">

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
              <li class="header">새로운 알림이 ${newMessage}개 있습니다.</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  	<c:forEach var="item" items="${newComment}" varStatus="status">
	                  	<li>
	                  		<c:choose >
	                  			<c:when test="${item.tableName eq 'notice'}"><c:set var="ico" value = "fa-bullhorn text-blue"/></c:when>
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
                  <a href="javascript:actionlink('profile.action');" class="btn btn-default btn-flat font-bareun"><i class="fa fa-user"></i> 프로필</a>
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
        <li><a href="javascript:actionlink('trade.action?command=trade');"><i class="fa fa-shopping-cart"></i> <span>중고나라</span></a></li>
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
        <i class="fa fa-shopping-cart "></i> 중고나라
        <small>JSL 연수기간, 물건! 버리지 말고 바꿔보세요.</small>
      </h1>
      <ol class="breadcrumb">
       <li><a href="javascript:actionlink('index.action');"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">중고나라</li>
      </ol>
    </section>
    <section class="content">
	    <div class="row">
	    	<div class="col-md-12">
	    	<div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title font-bareun"><i class="fa fa-edit"></i> 등록</h3>
            <!-- /.box-header -->
            </div>
            <form action = "/JTalk/trade.action?command=write" method="post" enctype="multipart/form-data">
            <div class="box-body">
              <div>
              	  <div class="input-group input-margin-btm">
	                <span class="input-group-addon"><i class="glyphicon glyphicon-text-size"></i></span>
	                <input type="text" class="form-control" placeholder="제목" name="title" required>
	                <input type="hidden" name="writerId" value="${member.email}">
	                <input type="hidden" name="writerName" value="${member.name}">
	              </div>
	               <div class="input-group input-margin-btm">
	                <span class="input-group-addon"><i class="fa fa-krw"></i></span>
	                <input type="text" class="form-control" placeholder="가격" name="price" required>
	              </div>
	              <div class="input-group input-margin-btm">
	                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
	                <input type="text" class="form-control" placeholder="연락처" name="phone" required>
	              </div>
	              <div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-picture"></i></span>
	                <input id = "uploadfield" type="text" class="form-control" readonly value="이미지">
	                <div class="input-group-btn">
		              <div class="btn btn-default btn-file">
		                  <i class="glyphicon glyphicon-folder-open"></i>&nbsp;&nbsp;업로드
		                  <input type="file" name="file" onchange="$('#uploadfield').val(this.value.split('\\')[2]);">
		                </div>
		             </div>
	                <!-- /btn-group -->
			       </div>
			       <p class="help-block input-margin-btm">제한용량 5MB</p>
	              <textarea class="summernote" name="content" required></textarea>
	              <div class="text-right table-bottom" style="border:0px">
              	<button type="button" class="btn btn-default" onclick="actionlink('trade.action?command=trade');"><i class="fa fa-list"></i> 목록</button>
              	<button type="submit" class="btn btn-default"><i class="fa fa-edit"></i> 등록</button>
              </div>
              </div>
            </div>
            </form>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          </div>
	    </div>
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
<!-- jQuery 3 -->
<script src="/JTalk/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/JTalk/bower_components/jquery-ui/jquery-ui.min.js"></script>
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
<!-- Bootstrap WYSIHTML5 -->
<script src="/JTalk/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Javascript of Sidebar toggle -->
<script src="/JTalk/dist/js/sidebar.js"></script>
<!-- Summernote -->
<script src="/JTalk/bower_components/summernote/dist/summernote.js"></script>
<script src="/JTalk/bower_components/summernote/dist/lang/summernote-ko-KR.js"></script>
<script src="/JTalk/bower_components/summernote/dist/emoticons.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<!-- Google AdSense -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
  $.widget.bridge('uibutton', $.ui.button);
  $('.summernote').summernote({
      height: 400,
      tabsize: 2,
      linkTargetBlank: false,
      lang: 'ko-KR',
      disableDragAndDrop: true
    });
  $('.note-insert').contents(":last-child").attr('data-original-title', '이모티콘');
</script>
</body>
</html>