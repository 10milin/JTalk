<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="/JTalk/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
  <!-- Javascript of Sidebar toggle -->
  <script src="/JTalk/dist/js/sidebar.js"></script>

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
              <span class="label label-warning">10</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 10 notifications</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
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
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="/JTalk/dist/img/user-default.png" class="user-image" alt="User Image">
              <span class="hidden-xs font-bareun">${sessionScope.member.name}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="/JTalk/dist/img/user-default.png" class="img-circle" alt="User Image">

                <p>
                  <b>JSL ${sessionScope.member.period}기 ${sessionScope.member.name}</b>
                  <small>등록일 - ${sessionScope.member.registerDate}</small>
                </p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat font-bareun"><i class="fa fa-user"></i> 프로필</a>
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
        <i class="fa fa-bullhorn "></i> 공지사항
        <small>J-Talk에서 알려드립니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="javascript:actionlink('index.action');"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">공지사항</li>
      </ol>
    </section>
    <section class="content">
	    <div class="row">
	    	<div class="col-md-8 padding-right">
	    	<div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title font-bareun"><i class="fa fa-file-text-o"></i> 상세 보기</h3>
              <div class="box-tools pull-right">
		                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-condensed table-hover">
                <tr class="table-field board-headline">
                  <th colspan="3">글제목 들어가는곳</th>
                </tr>
                <tr class="board-content board-white">
                	<td>
                		<i class="fa fa-user"></i> 김현호  
                	</td>
                	<td class="text-right" width="38%">
                		<i class="fa fa-clock-o"></i> 2017.09.13 09:24  
                	</td>
                	<td  class="text-center" width="13%">
                		<i class="fa fa-eye"></i> 5  
                	</td>
                </tr>
                <tr class="board-white">
                	<td colspan="3">
                		<div>내용입력부</div>
                	</td>
                </tr>
                <tr class="board-white">
                	<td colspan="3">
                		<div class="col-md-6 col-sm-6 col-xs-12" style="padding:10px 0px;">
			                  <div class="mailbox-attachment-info">
			                    <span class="mailbox-attachment-name"><i class="fa fa-paperclip"></i> Sep2014-report.pdf</span>
			                          <a href="#" class="btn btn-default btn-xs pull-right"><i class="glyphicon glyphicon-download-alt"></i></a>
			                  </div>
                		</div>
                	</td>
                </tr>
              </table>
              <div class="table-bottom box-comments" style="padding:10px">
              		<div class="box-comment">
                	<!-- User image -->
	                <img class="img-circle img-sm" src="/JTalk/dist/img/user3-128x128.jpg" alt="User Image">
	
	                <div class="comment-text">
	                      <span class="username">
	                        Maria Gonzales
	                        <span class="pull-right">
	                        <span class="margin-right-left"><a class="color-black" onclick="editstart(this);" style="cursor:pointer;"><i class="fa fa-pencil"></i></a></span>
	                        <span class="margin-right-left"><a class="color-black" onclick="console.log(this);" style="cursor:pointer;"><i class="fa fa-trash"></i></a></span>
	                        <span class="text-muted">8:03 PM Today</span>
	                        </span>
	                      </span><!-- /.username -->
	                  <span>
	                  <div class="input-group" style="display:none;">
		                  <input type="text" class="form-control input-sm comment-edit" placeholder="수정할 내용을 입력해주세요.">
		                  <span class="input-group-btn">
		                      <button type="button" class="btn btn-sm btn-default btn-flat comment-edit-btn"><i class="fa fa-pencil"></i> 수정</button>
		                    </span>
	                	</div>
		                  <span class="comment-in">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</span>
	                  </span>
	                </div>
	                <!-- /.comment-text -->
              </div>
              <!-- /.유저 한명의 코멘트 -->
              <div class="box-comment">
                	<!-- User image -->
	                <img class="img-circle img-sm" src="/JTalk/dist/img/user3-128x128.jpg" alt="User Image">
	
	                <div class="comment-text">
	                      <span class="username">
	                        Maria Gonzales
	                        <span class="pull-right">
	                        <span class="margin-right-left"><a class="color-black" onclick="editstart(this);" style="cursor:pointer;"><i class="fa fa-pencil"></i></a></span>
	                        <span class="margin-right-left"><a class="color-black" onclick="console.log(this);" style="cursor:pointer;"><i class="fa fa-trash"></i></a></span>
	                        <span class="text-muted">8:03 PM Today</span>
	                        </span>
	                      </span><!-- /.username -->
	                  <span>
	                  <div class="input-group" style="display:none;">
		                  <input type="text" class="form-control input-sm comment-edit" placeholder="수정할 내용을 입력해주세요.">
		                  <span class="input-group-btn">
		                      <button type="button" class="btn btn-sm btn-default btn-flat comment-edit-btn"><i class="fa fa-pencil"></i> 수정</button>
		                    </span>
	                	</div>
		                  <span class="comment-in">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</span>
	                  </span>
	                </div>
	                <!-- /.comment-text -->
              </div>
              <!-- /.유저 한명의 코멘트 -->
              <form action="#" method="post">
                <img class="img-responsive img-circle img-sm" src="/JTalk/dist/img/user4-128x128.jpg" alt="Alt Text">
                <!-- .img-push is used to add margin to elements next to floating images -->
                <div class="img-push input-group">
                  <input type="text" class="form-control input-sm" placeholder="댓글을 입력해주세요." required>
                  <span class="input-group-btn">
                      <button type="submit" class="btn btn-sm btn-primary btn-flat"><i class="fa fa-pencil"></i> 댓글 등록</button>
                    </span>
                </div>
              </form>
              </div>
              <br>
              <div class="text-right">
              	<button type="button" class="btn btn-default" onclick="actionlink('notice.action?command=notice');"><i class="fa fa-list"></i> 목록</button>
              	<button type="button" class="btn btn-default" onclick="actionlink('notice.action?command=writeform');"><i class="fa fa-pencil"></i> 수정</button>
              	<button type="button" class="btn btn-default" onclick="actionlink('notice.action?command=writeform');"><i class="fa fa-trash"></i> 삭제</button>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          </div>
          <div class="col-md-4">
	    	<div class="box box-primary">
	            <div class="box-header">
	              <h3 class="box-title font-bareun"><i class="fa fa-search"></i> 글 검색</h3>
	              <div class="box-tools pull-right">
		                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		              </div>
	            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<form action = "/JTalk/notice.action?command=search" method="post">
	                <div class="input-group col-md-12">
	                    <input type="text" class="form-control" placeholder="검색어를 입력해주세요." value="${requestScope.search}" name="search" required>
	                    <span class="input-group-btn">
	                        <button class="btn btn-primary" type="submit">
	                            <i class="glyphicon glyphicon-search"></i>
	                        </button>
	                    </span>
	                </div>
                </form>
            </div>
            </div>
			
			<div class="box box-primary">
	            <div class="box-header">
	              <h3 class="box-title font-bareun"><i class="fa fa-star"></i> 인기 글 목록</h3>
	              <div class="box-tools pull-right">
		                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		              </div>
	            </div>
            <!-- /.box-header -->
	            <div class="box-body">
	            	<table class="table table-condensed table-hover">
		              	<tr class="table-field">
		                  <th>제목</th>
		                  <th style="width: 20%;">조회수</th>
		                </tr>
		                <tr class="table-field">
		                  <td class="td-title-mobile">모바일 전용</td>
		                  <td>관리자</td>
		                </tr>
		              </table>
	            </div>
            </div>
			
            <div class="box box-primary">
	            <div class="box-header">
	              <h3 class="box-title font-bareun"><i class="fa fa-commenting-o"></i> 최근 댓글</h3>
	              <div class="box-tools pull-right">
		                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		              </div>
	            </div>
            <!-- /.box-header -->
	            <div class="box-body">
	            	<table class="table table-condensed table-hover">
		              	<tr class="table-field">
		                  <th>내용</th>
		                  <th style="width: 20%;">글쓴이</th>
		                </tr>
		                <tr class="table-field">
		                  <td class="td-title-mobile">모바일 전용</td>
		                  <td>관리자</td>
		                </tr>
		              </table>
	            </div>
            </div>
  
            <div class="box box-primary" style="display:none;">
	            <div class="box-header">
	              <h3 class="box-title font-bareun"><i class="fa fa-credit-card"></i> 광고</h3>
	            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<img src="/JTalk/dist/img/adsense.png" class="img-responsive center-block" style="padding:30px;">
            </div>
            </div>
            
         </div>
	    </div>
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
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
  pagination(${totalPage},${currentPage});
</script>
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
<!-- Infomation Panel Switching -->
<script src="/JTalk/dist/js/information.js"></script>
<!-- Javascript of ActionPost -->
<script src="/JTalk/dist/js/actionpost.js"></script>
<!-- Ajax Re-edit -->
<script src="/JTalk/dist/js/reedit.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="/JTalk/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
</body>
</html>