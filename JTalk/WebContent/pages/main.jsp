<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                  <fmt:formatDate var="date" value="${sessionScope.member.registerDate}" pattern="yyyy-MM-dd" />
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
        <i class="fa fa-comments "></i> J-TALK
        <small>JSL연수생들과 많은 이야기를 나눠보세요.</small>
      </h1>
      <ol class="breadcrumb">
        <li class="active"><i class="fa fa-home"></i> Home</li>
      </ol>
    </section>
    <section class="content">
	    <div class="row">
	    	<!-- 최신 등록된 글 -->
	    	<div class="col-md-12">
	    		<div class="box box-primary">
		            <div class="box-header with-border">
		              <h3 class="box-title font-bareun"><i class="fa fa-edit"></i> 최근 등록된 게시글</h3>
		
		              <div class="box-tools pull-right">
		                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		              </div>
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body">
		            <div class="col-md-12" style="padding:0px;">
		              <div class="col-md-6 col-sm-6">
		              	<div class="box" style="border:0px;">
				            <div class="box-header" style="padding:5px;">
				              <h3 class="box-title font-bareun" style="font-size:16px;"><a href="javascript:actionlink('notice.action?command=notice');" style="color:black;"><i class="fa fa-bullhorn"></i> 공지사항</a></h3>
				            </div>
				            <!-- /.box-header -->
				            <div class="box-body no-padding">
				              <table class="table table-hover table-condensed">
				                <tr>
				                  <td class="td-overflow" style="max-width:1px;">게시글1번의 내용이 길어지면 white-space를 적용하여 내용이 줄어든다..</td>
				                  <td style="width:30%; text-align: center;">2017-04-03</td>
				                </tr>
				              </table>
				            </div>
				            <!-- /.box-body -->
				          </div>
				          <!-- /.box -->
		              </div>
		              
		              <div class="col-md-6 col-sm-6">
		              	<div class="box" style="border:0px;">
				            <div class="box-header" style="padding:5px;">
				              <h3 class="box-title font-bareun" style="font-size:16px;"><i class="fa fa-group"></i> 우리끼리</h3>
				            </div>
				            <!-- /.box-header -->
				            <div class="box-body no-padding">
				              <table class="table table-hover table-condensed">
				                <tr>
				                  <td class="td-overflow" style="max-width:1px;">게시글1번의 내용이 길어지면 white-space를 적용하여 내용이 줄어든다..</td>
				                  <td style="width:30%; text-align: center;">2017-04-03</td>
				                </tr>
				              </table>
				            </div>
				            <!-- /.box-body -->
				          </div>
				          <!-- /.box -->
		              </div>
		              </div>
		              <div class="col-md-12" style="padding:0px;">
		              <div class="col-md-6 col-sm-6">
		              	<div class="box" style="border:0px;">
				            <div class="box-header" style="padding:5px;">
				              <h3 class="box-title font-bareun" style="font-size:16px;"><i class="fa fa-share-alt"></i> 스터디모집</h3>
				            </div>
				            <!-- /.box-header -->
				            <div class="box-body no-padding">
				              <table class="table table-hover table-condensed">
				                <tr>
				                  <td class="td-overflow" style="max-width:1px;">게시글1번의 내용이 길어지면 white-space를 적용하여 내용이 줄어든다..</td>
				                  <td style="width:30%; text-align: center;">2017-04-03</td>
				                </tr>
				              </table>
				            </div>
				            <!-- /.box-body -->
				          </div>
				          <!-- /.box -->
		              </div>
		              
		              <div class="col-md-6 col-sm-6">
		              	<div class="box" style="border:0px;">
				            <div class="box-header" style="padding:5px;">
				              <h3 class="box-title font-bareun" style="font-size:16px;"><i class="fa fa-comments-o"></i> 선후배교류</h3>
				            </div>
				            <!-- /.box-header -->
				            <div class="box-body no-padding">
				              <table class="table table-hover table-condensed">
				                <tr>
				                  <td class="td-overflow" style="max-width:1px;">게시글1번의 내용이 길어지면 white-space를 적용하여 내용이 줄어든다..</td>
				                  <td style="width:30%; text-align: center;">2017-04-03</td>
				                </tr>
				              </table>
				            </div>
				            <!-- /.box-body -->
				          </div>
				          <!-- /.box -->
		              </div>
		              </div>
		              
		            </div>
		            <!-- ./box-body -->
		          </div>
		          <!-- /.box -->
	    	</div>
	    	<!-- /.최신 등록된 글 -->
	    	<!-- 정보마당 -->
	    	<div class="col-md-12">
	    		<div class="box box-primary">
		            <div class="box-header with-border">
		              <h3 class="box-title font-bareun"><i class="fa fa-info-circle"></i> 정보마당</h3>
		
		              <div class="box-tools pull-right">
		                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		              </div>
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body">
		              <div class="col-md-6 col-sm-6">
		              	<div class="row">
					        <div class="col-md-6 col-sm-12 col-xs-12 pointer" id="it-btn">
					          <div class="info-box">
					            <span class="info-box-icon bg-aqua" id="it-ico"><i class="fa fa-television"></i></span>
					            <div class="info-box-content">
					              <span class="info-box-number">IT</span>
					              <span class="info-box-text">등록된 정보 50개</span>
					              <span class="info-box-text">새로운 정보 5개</span>
					            </div>
					            <!-- /.info-box-content -->
					          </div>
					          <!-- /.info-box -->
					        </div>
					        <!-- ./col -->
					        <div class="col-md-6 col-sm-12 col-xs-12 pointer" id="jp-btn">
					          <div class="info-box">
					            <span class="info-box-icon bg-green" id="jp-ico"><i class="fa fa-book"></i></span>
					            <div class="info-box-content">
					              <span class="info-box-number">일본어</span>
					              <span class="info-box-text">등록된 정보 50개</span>
					              <span class="info-box-text">새로운 정보 5개</span>
					            </div>
					            <!-- /.info-box-content -->
					          </div>
					          <!-- /.info-box -->
					        </div>
					        <!-- ./col -->
					        <div class="col-md-6 col-sm-12 col-xs-12 pointer" id="rst-btn">
					          <div class="info-box">
					            <span class="info-box-icon bg-yellow" id="rst-ico"><i class="fa fa-cutlery"></i></span>
					            <div class="info-box-content">
					              <span class="info-box-number">주변맛집</span>
					              <span class="info-box-text">등록된 정보 50개</span>
					              <span class="info-box-text">새로운 정보 5개</span>
					            </div>
					            <!-- /.info-box-content -->
					          </div>
					          <!-- /.info-box -->
					        </div>
					        <!-- ./col -->
					        <div class="col-md-6 col-sm-12 col-xs-12 pointer" id="life-btn">
					          <div class="info-box">
					            <span class="info-box-icon bg-red" id="life-ico"><i class="fa fa-check-square-o"></i></span>
					            <div class="info-box-content">
					              <span class="info-box-number">생활정보</span>
					              <span class="info-box-text">등록된 정보 50개</span>
					              <span class="info-box-text">새로운 정보 5개</span>
					            </div>
					            <!-- /.info-box-content -->
					          </div>
					          <!-- /.info-box -->
					        </div>
					        <!-- ./col -->
					      </div>
		              </div>
		              
		              <div class="col-md-6 col-sm-6">
		              	<div id="it-panel" class="box" style="border:0px;">
				            <div class="box-header" style="padding:5px;">
				              <h3 class="box-title font-bareun" style="font-size:16px;"><i class="fa fa-television"></i> IT</h3>
				            </div>
				            <!-- /.box-header -->
				            <div class="box-body no-padding">
				              <table class="table table-hover table-condensed">
				                <tr>
				                  <td class="td-overflow" style="max-width:1px;">게시글1번의 내용이 길어지면 white-space를 적용하여 내용이 줄어든다..</td>
				                  <td style="width:30%; text-align: center;">2017-04-03</td>
				                </tr>
				              </table>
				            </div>
				            <!-- /.box-body -->
				          </div>
				          <!-- /.box -->
				          <div id="jp-panel" class="box" style="border:0px; display:none;">
				            <div class="box-header" style="padding:5px;">
				              <h3 class="box-title font-bareun" style="font-size:16px;"><i class="fa fa-book"></i> 일본어</h3>
				            </div>
				            <!-- /.box-header -->
				            <div class="box-body no-padding">
				              <table class="table table-hover table-condensed">
				                <tr>
				                  <td class="td-overflow" style="max-width:1px;">게시글1번의 내용이 길어지면 white-space를 적용하여 내용이 줄어든다..</td>
				                  <td style="width:30%; text-align: center;">2017-04-03</td>
				                </tr>
				              </table>
				            </div>
				            <!-- /.box-body -->
				          </div>
				          <!-- /.box -->
				          <div id="rst-panel" class="box" style="border:0px; display:none;">
				            <div class="box-header" style="padding:5px;">
				              <h3 class="box-title font-bareun" style="font-size:16px;"><i class="fa fa-cutlery"></i> 주변맛집</h3>
				            </div>
				            <!-- /.box-header -->
				            <div class="box-body no-padding">
				              <table class="table table-hover table-condensed">
				                <tr>
				                  <td class="td-overflow" style="max-width:1px;">게시글1번의 내용이 길어지면 white-space를 적용하여 내용이 줄어든다..</td>
				                  <td style="width:30%; text-align: center;">2017-04-03</td>
				                </tr>
				              </table>
				            </div>
				            <!-- /.box-body -->
				          </div>
				          <!-- /.box -->
				          <div id="life-panel" class="box" style="border:0px; display:none;">
				            <div class="box-header" style="padding:5px;">
				              <h3 class="box-title font-bareun" style="font-size:16px;"><i class="fa fa-check-square-o"></i> 생활정보</h3>
				            </div>
				            <!-- /.box-header -->
				            <div class="box-body no-padding">
				              <table class="table table-hover table-condensed">
				                <tr>
				                  <td class="td-overflow" style="max-width:1px;">게시글1번의 내용이 길어지면 white-space를 적용하여 내용이 줄어든다..</td>
				                  <td style="width:30%; text-align: center;">2017-04-03</td>
				                </tr>
				              </table>
				            </div>
				            <!-- /.box-body -->
				          </div>
				          <!-- /.box -->
		              </div>

		            </div>
		            <!-- ./box-body -->
		          </div>
		          <!-- /.box -->
	    	</div>
	    	<!-- /.정모마당 -->
	    	
	    	<div class="col-md-7 padding-right">
	          <!-- Box Comment -->
	          <div class="box box-primary">
	          
	            <div class="box-header with-border">
	              <div class="user-block">
	                <h3 class="box-title font-bareun"><i class="fa fa-tree"></i> 대나무숲</h3>
	              </div>
	              <!-- /.user-block -->
	              <div class="box-tools">
	                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
	                </button>
	              </div>
	              <!-- /.box-tools -->
	            </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	              <div class="user-block">
	                <img class="img-circle" src="/JTalk/dist/img/user1-128x128.jpg" alt="User Image">
	                <span class="username"><a class="pointer" href="javascript:void(0)" onclick="showmember(1);">Jonathan Burke Jr.</a></span>
	                <span class="description">Shared publicly - 7:30 PM Today</span>
	              </div>
	              <img class="img-responsive pad" src="/JTalk/dist/img/photo2.png" alt="Photo">
	
	              <p>I took this photo this morning. What do you guys think?</p>
	              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i> Like</button>
	              <span class="pull-right text-muted">127 likes - 3 comments</span>
	            </div>
	            <!-- /.box-body -->
	            <div class="box-footer box-comments">
	              <div class="box-comment">
	                <!-- User image -->
	                <img class="img-circle img-sm" src="/JTalk/dist/img/user3-128x128.jpg" alt="User Image">
	
	                <div class="comment-text">
	                      <span class="username">
	                        Maria Gonzales
	                        <span class="text-muted pull-right">8:03 PM Today</span>
	                      </span><!-- /.username -->
	                  It is a long established fact that a reader will be distracted
	                  by the readable content of a page when looking at its layout.
	                </div>
	                <!-- /.comment-text -->
	              </div>
	              <!-- /.box-comment -->
	              <div class="box-comment">
	                <!-- User image -->
	                <img class="img-circle img-sm" src="/JTalk/dist/img/user4-128x128.jpg" alt="User Image">
	
	                <div class="comment-text">
	                      <span class="username">
	                        Luna Stark
	                        <span class="text-muted pull-right">8:03 PM Today</span>
	                      </span><!-- /.username -->
	                  It is a long established fact that a reader will be distracted
	                  by the readable content of a page when looking at its layout.
	                </div>
	                <!-- /.comment-text -->
	              </div>
	              <!-- /.box-comment -->
	            </div>
	            <!-- /.box-footer -->
	            <div class="box-footer">
	              <form action="#" method="post">
	                <img class="img-responsive img-circle img-sm" src="/JTalk/dist/img/user4-128x128.jpg" alt="Alt Text">
	                <!-- .img-push is used to add margin to elements next to floating images -->
	                <div class="img-push">
	                  <input type="text" class="form-control input-sm" placeholder="Press enter to post comment">
	                </div>
	              </form>
	            </div>
	            <!-- /.box-footer -->
	          </div>
	          <!-- /.box -->
	        </div>
	        <!-- /.col-md-7 -->
			<div class="col-md-5">
		          <!-- /.box -->
				<!-- Calendar
		          <div class="box box-solid bg-green-gradient">
		            <div class="box-header">
		              <i class="fa fa-calendar"></i>
		
		              <h3 class="box-title">Calendar</h3>
		              <div class="pull-right box-tools">
		                <div class="btn-group">
		                  <button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown">
		                    <i class="fa fa-bars"></i></button>
		                  <ul class="dropdown-menu pull-right" role="menu">
		                    <li><a href="#">Add new event</a></li>
		                    <li><a href="#">Clear events</a></li>
		                    <li class="divider"></li>
		                    <li><a href="#">View calendar</a></li>
		                  </ul>
		                </div>
		                <button type="button" class="btn btn-success btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
		                </button>
		                <button type="button" class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i>
		                </button>
		              </div>
		            </div>
		            <div class="box-body no-padding">
		              <div id="calendar" style="width: 100%"></div>
		            </div>

		            <div class="box-footer text-black">
		              <div class="row">
		                <div class="col-sm-6">
		                  <div class="clearfix">
		                    <span class="pull-left">Task #1</span>
		                    <small class="pull-right">90%</small>
		                  </div>
		                  <div class="progress xs">
		                    <div class="progress-bar progress-bar-green" style="width: 90%;"></div>
		                  </div>
		
		                  <div class="clearfix">
		                    <span class="pull-left">Task #2</span>
		                    <small class="pull-right">70%</small>
		                  </div>
		                  <div class="progress xs">
		                    <div class="progress-bar progress-bar-green" style="width: 70%;"></div>
		                  </div>
		                </div>
		                
		                <div class="col-sm-6">
		                  <div class="clearfix">
		                    <span class="pull-left">Task #3</span>
		                    <small class="pull-right">60%</small>
		                  </div>
		                  <div class="progress xs">
		                    <div class="progress-bar progress-bar-green" style="width: 60%;"></div>
		                  </div>
		
		                  <div class="clearfix">
		                    <span class="pull-left">Task #4</span>
		                    <small class="pull-right">40%</small>
		                  </div>
		                  <div class="progress xs">
		                    <div class="progress-bar progress-bar-green" style="width: 40%;"></div>
		                  </div>
		                </div>
		                
		              </div>
		              
		            </div>
		          </div>
		          -->
		          
		          <!-- 행복나눔 -->
		          <div class="box box-primary">
		            <div class="box-header with-border">
		              <h3 class="box-title font-bareun"><i class="fa fa-heart"></i> 행복나눔</h3>
		
		              <div class="box-tools pull-right">
		                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
		                </button>
		              </div>
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body">
		              <ul class="products-list product-list-in-box">
		                <li class="item">
		                  <div class="product-img">
		                    <img src="/JTalk/dist/img/default-50x50.gif" alt="Product Image">
		                  </div>
		                  <div class="product-info">
		                    <a href="javascript:void(0)" class="product-title">Samsung TV
		                      <span class="label label-danger pull-right">마감</span></a>
		                    <span class="product-description">
		                          Samsung 32" 1080p 60Hz LED Smart HDTV.
		                        </span>
		                  </div>
		                </li>
		                <!-- /.item -->
		                <li class="item">
		                  <div class="product-img">
		                    <img src="/JTalk/dist/img/default-50x50.gif" alt="Product Image">
		                  </div>
		                  <div class="product-info">
		                    <a href="javascript:void(0)" class="product-title">Samsung TV
		                      <span class="label label-success pull-right">진행</span></a>
		                    <span class="product-description">
		                          Samsung 32" 1080p 60Hz LED Smart HDTV.
		                        </span>
		                  </div>
		                </li>
		                <!-- /.item -->
		              </ul>
		            </div>
		            <!-- /.box-body -->
		            <div class="box-footer text-center">
		              <a href="javascript:void(0)" class="uppercase">자세히 보기</a>
		            </div>
		            <!-- /.box-footer -->
		          </div>
		          <!-- /.행복나눔 -->
		          
		          <!-- 중고나라 -->
		          <div class="box box-primary">
		            <div class="box-header with-border">
		              <h3 class="box-title font-bareun"><i class="fa fa-shopping-cart"></i> 중고나라</h3>
		
		              <div class="box-tools pull-right">
		                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
		                </button>
		              </div>
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body">
		              <ul class="products-list product-list-in-box">
		                <li class="item">
		                  <div class="product-img">
		                    <img src="/JTalk/dist/img/default-50x50.gif" alt="Product Image">
		                  </div>
		                  <div class="product-info">
		                    <a href="javascript:void(0)" class="product-title">Samsung TV
		                      <span class="label label-danger pull-right">마감</span></a>
		                    <span class="product-description">
		                          Samsung 32" 1080p 60Hz LED Smart HDTV.
		                        </span>
		                  </div>
		                </li>
		                <!-- /.item -->
		                <li class="item">
		                  <div class="product-img">
		                    <img src="/JTalk/dist/img/default-50x50.gif" alt="Product Image">
		                  </div>
		                  <div class="product-info">
		                    <a href="javascript:void(0)" class="product-title">Samsung TV
		                      <span class="label label-success pull-right">진행</span></a>
		                    <span class="product-description">
		                          Samsung 32" 1080p 60Hz LED Smart HDTV.
		                        </span>
		                  </div>
		                </li>
		                <!-- /.item -->
		                <!-- /.item -->
		                <li class="item">
		                  <div class="product-img">
		                    <img src="/JTalk/dist/img/default-50x50.gif" alt="Product Image">
		                  </div>
		                  <div class="product-info">
		                    <a href="javascript:void(0)" class="product-title">Samsung TV
		                      <span class="label label-primary pull-right">￦ 5000</span></a>
		                    <span class="product-description">
		                          Samsung 32" 1080p 60Hz LED Smart HDTV.
		                        </span>
		                  </div>
		                </li>
		                <!-- /.item -->
		              </ul>
		            </div>
		            <!-- /.box-body -->
		            <div class="box-footer text-center">
		              <a href="javascript:void(0)" class="uppercase">자세히 보기</a>
		            </div>
		            <!-- /.box-footer -->
		          </div>
		          <!-- /.중고나라 -->
		          <div class="box box-primary">
		            <div class="box-header with-border">
		              <h3 class="box-title font-bareun"><i class="fa fa-star"></i> 제휴사이트</h3>
		              <div class="box-tools pull-right">
		                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
		                </button>
		              </div>
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body">
		              <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		                <ol class="carousel-indicators">
		                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		                  <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
		                </ol>
		                <div class="carousel-inner">
		                  <div class="item active">
		                    <img src="/JTalk/dist/img/jsl.png" alt="First slide">
		                  </div>
		                  
		                  <div class="item">
		                    <img src="http://placehold.it/900x500/3c8dbc/ffffff&text=I+Love+Bootstrap" alt="Second slide">
		                    <div class="carousel-caption">
		                      Second Slide
		                    </div>
		                  </div>
		                  
		                </div>
		              </div>
		            </div>
		            <!-- /.box-body -->
		          </div>
			</div>
	    </div>
    </section>
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> ${applicationScope.version}
    </div>
    <strong>Copyright &copy; 2017 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>
  
</div>
<div id="actionpost"></div>
<!-- modal -->
<div class="modal fade" id="popup-member">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body" style="padding:15px 0;">
        <div class="col-md-12">
        	<div class="box box-widget widget-user-2">
            <!-- Add the bg color to the header using any of the bg-* classes -->
            <div class="widget-user-header bg-primary">
              <div class="widget-user-image">
                <img class="img-circle" src="/JTalk/dist/img/user-default.png" alt="User Avatar">
              </div>
              <!-- /.widget-user-image -->
              <h3 class="widget-user-username font-bareun">김현호</h3>
              <h5 class="widget-user-desc">JSL 25기 - 2017-09-05</h5>
            </div>
            </div>
            <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_1" data-toggle="tab"><i class="fa fa-info-circle"></i> 회원 정보</a></li>
              <li><a href="#tab_2" data-toggle="tab"><i class="fa fa-envelope"></i> 메시지 보내기</a></li>
              <li class="pull-right active-none"><a href="#tab_3" class="active-none" data-toggle="tab" class="text-muted"><i class="fa fa-gear"></i></a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
                정보
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_2">
                메시지
              </div>
              <div class="tab-pane" id="tab_3">
                관리자
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- nav-tabs-custom -->
        </div>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- jQuery 3 -->
<script src="/JTalk/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/JTalk/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
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
<!-- Javascript of Sidebar toggle -->
<script src="/JTalk/dist/js/sidebar.js"></script>
<!-- Popup Member -->
<script src="/JTalk/dist/js/popup.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="/JTalk/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
</body>
</html>