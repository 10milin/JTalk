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
        <i class="fa fa-tree "></i> 대나무숲
        <small>대신 전해드립니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="javascript:actionlink('index.action');"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">대나무숲</li>
      </ol>
    </section>
    <section class="content">
		<div class="row">
	        <div class="col-md-12">
	          <div class="box box-primary">
	            <div class="box-header with-border">
	              <h3 class="box-title font-bareun"><i class="fa fa-question-circle"></i> 대나무숲이란</h3>
	              <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	            <div class="col-md-12 no-padding">
	            	<img src="/JTalk/dist/img/treelogo.png" class="img-responsive" width="100%">
	            </div>
	            </div>
	            <!-- ./box-body -->
	          </div>
	          
	          <div class="box box-primary">
	            <div class="box-header with-border">
	              <form action="/JTalk/anony.action?command=write" method="POST">
	                	<textarea class="summernote" name="content" required></textarea>
	                	<button type="submit" class="btn btn-primary btn-block"><i class="fa fa-edit"></i> 작성</button>
	                </form>
	            </div>
	            <!-- /.box-header -->
	          </div>
		          
	          <!-- 게시글 하나 -->
	          <div class="box box-default">
	            <div class="box-body">
	              <div class="user-block">
	                <img class="img-circle" src="/JTalk/dist/img/tree.png" alt="User Image">
	                <span class="username"><a>J-Talk 대나무숲</a></span>
	                <span class="description">대신 전해드립니다 - 2017-09-18 20:05</span>
	              </div>
	              <div class="col-md-12 tree-content">
	              	<p>I took this photo this morning. What do you guys think?</p>
	              </div>
	              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i> 좋아요</button>
	              <c:if test="${member.active ge 2}">
	              	<button type="button" class="btn btn-default btn-xs"><i class="fa fa-trash"></i> 삭제</button>
	              </c:if>
	              <span class="pull-right text-muted">
	              <a class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i>좋아요 (100)</a> 
	              <a class="link-black text-sm"><i class="fa fa-comments-o margin-l-5 margin-r-5"></i>댓글 (5)</a>
	              	</span>
	            </div>
	            <!-- /.box-body -->
	            <div class="box-footer box-comments">
	              <div class="box-comment">
	                <!-- /.유저 한명의 코멘트 -->
	              <c:if test="${not empty commentList}">
		              <c:forEach var="item" items="${commentList}" varStatus="status">
		              	<div class="box-comment">
		                	<!-- User image -->
			                <img class="img-circle img-sm" src="/JTalk/dist/img/tree.png" alt="User Image">
			
			                <div class="comment-text">
			                      <span class="username">
			                        J-Talk 대나무숲
			                        <span class="pull-right">
			                        <c:if test="${member.active ge 2}">
				                        <span class="margin-right-left"><a class="color-black" onclick="actionparam('comment.action?command=delete',${item.num});" style="cursor:pointer;"><i class="fa fa-trash"></i></a></span>
			                        </c:if>                   
			                        <fmt:formatDate var="date" value="${item.writeDate}" pattern="yyyy-MM-dd HH:mm:ss" />
			                        <span class="text-muted">${date}</span>
			                        </span>
			                      </span><!-- /.username -->
			                  <span>
				                  <span class="comment-in">${item.content}</span>
			                  </span>
			                </div>
		              </div>
		              </c:forEach>
	              </c:if>
	              <!-- /.유저 한명의 코멘트 -->
	              <form action="/JTalk/anony.action?command=comment" method="post">
	                <img class="img-responsive img-circle img-sm" src="/JTalk/dist/img/tree.png" alt="Alt Text">
	                <!-- .img-push is used to add margin to elements next to floating images -->
	                <div class="img-push input-group">
	                  <input type="hidden" name = "postNum" value = "${notice.num}"/>
	                  <input type="text"  name = "content" class="form-control input-sm" placeholder="댓글을 입력해주세요." required>
	                  <span class="input-group-btn">
	                      <button type="submit" class="btn btn-sm btn-primary btn-flat"><i class="fa fa-pencil"></i> 댓글 등록</button>
	                    </span>
	                </div>
	              </form>
		            </div>
		          </div>
	          </div>
	          <!--/.게시글 하나 -->
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
<!-- Custom javascript -->
<script src="/JTalk/dist/js/utils.js"></script>
<!-- Summernote -->
<script src="/JTalk/bower_components/summernote/dist/summernote.js"></script>
<script src="/JTalk/bower_components/summernote/dist/lang/summernote-ko-KR.js"></script>
<script src="/JTalk/bower_components/summernote/dist/emoticons.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
$('.summernote').summernote({
    tabsize: 2,
    linkTargetBlank: false,
    lang: 'ko-KR',
    toolbar: [
        ['insert', ['picture', 'video','help']]
     ],
     placeholder: '하고싶은 말을 써주세요! 대신 전해드립니다.',
     disableDragAndDrop: true
  });
$('.note-insert').contents(":last-child").attr('data-original-title', '이모티콘');
$('.note-editing-area').click(function(){
	$('.note-placeholder').css('display', 'none');
})
</script>
</body>
</html>