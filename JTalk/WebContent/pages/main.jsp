<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("enter","\n"); %>
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
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <link rel="icon" type="image/png" sizes="16x16" href="/JTalk/dist/img/favicon.png">
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
          <c:if test="${member.active eq 3}">
          	<li>
              <a href="javascript:actionlink('admin.action?command=main');"><i class="fa fa-cogs"></i></a>
          </li>
          </c:if>
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
				              	<c:if test="${empty newNotice}">
				              	<tr>
				                  <td class="td-overflow" style="max-width:1px;">등록된 게시글이 없습니다.</td>
				                  <td style="width:30%; text-align: center;"></td>
				                </tr>
				              	</c:if>
				              	<c:if test="${not empty newNotice}">
				                <c:forEach var = "item" items="${newNotice}" varStatus="status">
									<tr>
									<td class="td-overflow" style="max-width:1px;" >
									<a href="javascript:actionparam('notice.action?command=detail', '${item.num}')">
									${item.title}
									</a>
									</td>
									<fmt:formatDate var="noticeDate" value="${item.writeDate}" pattern="yyyy-MM-dd" />
									<td style="width:30%; text-align: center;">${noticeDate}</td>
									</tr>
				                </c:forEach>
				                </c:if>
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
				                <c:if test="${empty newWe}">
				              	<tr>
				                  <td class="td-overflow" style="max-width:1px;">등록된 게시글이 없습니다.</td>
				                  <td style="width:30%; text-align: center;"></td>
				                </tr>
				              	</c:if>
				              	<c:if test="${not empty newWe}">
				                <c:forEach var = "item" items="${newWe}" varStatus="status">
									<tr>
									<td class="td-overflow" style="max-width:1px;" >
									<a href="javascript:actionparam('we.action?command=detail', '${item.num}')">
									${item.title}
									</a>
									</td>
									<fmt:formatDate var="weDate" value="${item.writeDate}" pattern="yyyy-MM-dd" />
									<td style="width:30%; text-align: center;">${weDate}</td>
									</tr>
				                </c:forEach>
				                </c:if>
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
				                <c:if test="${empty newStudy}">
				              	<tr>
				                  <td class="td-overflow" style="max-width:1px;">등록된 게시글이 없습니다.</td>
				                  <td style="width:30%; text-align: center;"></td>
				                </tr>
				              	</c:if>
				              	<c:if test="${not empty newStudy}">
				                <c:forEach var = "item" items="${newStudy}" varStatus="status">
									<tr>
									<td class="td-overflow" style="max-width:1px;" >
									<a href="javascript:actionparam('study.action?command=detail', '${item.num}')">
									${item.title}
									</a>
									</td>
									<fmt:formatDate var="studyDate" value="${item.writeDate}" pattern="yyyy-MM-dd" />
									<td style="width:30%; text-align: center;">${studyDate}</td>
									</tr>
				                </c:forEach>
				                </c:if>
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
				                <c:if test="${empty newExchange}">
				              	<tr>
				                  <td class="td-overflow" style="max-width:1px;">등록된 게시글이 없습니다.</td>
				                  <td style="width:30%; text-align: center;"></td>
				                </tr>
				              	</c:if>
				              	<c:if test="${not empty newExchange}">
				                <c:forEach var = "item" items="${newExchange}" varStatus="status">
									<tr>
									<td class="td-overflow" style="max-width:1px;" >
									<a href="javascript:actionparam('exchange.action?command=detail', '${item.num}')">
									${item.title}
									</a>
									</td>
									<fmt:formatDate var="exchangeDate" value="${item.writeDate}" pattern="yyyy-MM-dd" />
									<td style="width:30%; text-align: center;">${exchangeDate}</td>
									</tr>
				                </c:forEach>
				                </c:if>
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
					              <span class="info-box-text">${ItSize}개의 정보</span>
					              <span class="info-box-text"><span class="badge bg-aqua">NEW ${ItNew}</span></span>
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
								  <span class="info-box-text">${JapaneseSize}개의 정보</span>
					              <span class="info-box-text"><span class="badge bg-green">NEW ${JapaneseNew}</span></span>
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
					              <span class="info-box-text">${FoodSize}개의 정보</span>
					              <span class="info-box-text"><span class="badge bg-yellow">NEW ${FoodNew}</span></span>
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
					              <span class="info-box-text">${LifeSize}개의 정보</span>
					              <span class="info-box-text"><span class="badge bg-red">NEW ${LifeNew}</span></span>
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
				                <c:if test="${empty newIt}">
				              	<tr>
				                  <td class="td-overflow" style="max-width:1px;">등록된 게시글이 없습니다.</td>
				                  <td style="width:30%; text-align: center;"></td>
				                </tr>
				              	</c:if>
				              	<c:if test="${not empty newIt}">
				                <c:forEach var = "item" items="${newIt}" varStatus="status">
									<tr>
									<td class="td-overflow" style="max-width:1px;" >
									<a href="javascript:actionparam('it.action?command=detail', '${item.num}')">
									${item.title}
									</a>
									</td>
									<fmt:formatDate var="itDate" value="${item.writeDate}" pattern="yyyy-MM-dd" />
									<td style="width:30%; text-align: center;">${itDate}</td>
									</tr>
				                </c:forEach>
				                </c:if>
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
				                <c:if test="${empty newJapanese}">
				              	<tr>
				                  <td class="td-overflow" style="max-width:1px;">등록된 게시글이 없습니다.</td>
				                  <td style="width:30%; text-align: center;"></td>
				                </tr>
				              	</c:if>
				              	<c:if test="${not empty newJapanese}">
				                <c:forEach var = "item" items="${newJapanese}" varStatus="status">
									<tr>
									<td class="td-overflow" style="max-width:1px;" >
									<a href="javascript:actionparam('japanese.action?command=detail', '${item.num}')">
									${item.title}
									</a>
									</td>
									<fmt:formatDate var="japaneseDate" value="${item.writeDate}" pattern="yyyy-MM-dd" />
									<td style="width:30%; text-align: center;">${japaneseDate}</td>
									</tr>
				                </c:forEach>
				                </c:if>
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
				                <c:if test="${empty newFood}">
				              	<tr>
				                  <td class="td-overflow" style="max-width:1px;">등록된 게시글이 없습니다.</td>
				                  <td style="width:30%; text-align: center;"></td>
				                </tr>
				              	</c:if>
				              	<c:if test="${not empty newFood}">
				                <c:forEach var = "item" items="${newFood}" varStatus="status">
									<tr>
									<td class="td-overflow" style="max-width:1px;" >
									<a href="javascript:actionparam('food.action?command=detail', '${item.num}')">
									${item.title}
									</a>
									</td>
									<fmt:formatDate var="foodDate" value="${item.writeDate}" pattern="yyyy-MM-dd" />
									<td style="width:30%; text-align: center;">${foodDate}</td>
									</tr>
				                </c:forEach>
				                </c:if>
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
				                <c:if test="${empty newLife}">
				              	<tr>
				                  <td class="td-overflow" style="max-width:1px;">등록된 게시글이 없습니다.</td>
				                  <td style="width:30%; text-align: center;"></td>
				                </tr>
				              	</c:if>
				              	<c:if test="${not empty newLife}">
				                <c:forEach var = "item" items="${newLife}" varStatus="status">
									<tr>
									<td class="td-overflow" style="max-width:1px;" >
									<a href="javascript:actionparam('life.action?command=detail', '${item.num}')">
									${item.title}
									</a>
									</td>
									<fmt:formatDate var="lifeDate" value="${item.writeDate}" pattern="yyyy-MM-dd" />
									<td style="width:30%; text-align: center;">${lifeDate}</td>
									</tr>
				                </c:forEach>
				                </c:if>
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
	          <div class="box box-primary" style="box-shadow:0 0 0px !important;">
	          
	            <div class="box-header with-border">
	              <div class="user-block">
	                <h3 class="box-title font-bareun"><a href="javascript:actionlink('anony.action?command=anony');" style="color:black;"><i class="fa fa-tree"></i> 대나무숲</a></h3>
	              </div>
	              <!-- /.user-block -->
	              <div class="box-tools">
	                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
	                </button>
	              </div>
	              <!-- /.box-tools -->
	            </div>
	            <!-- /.box-header -->
	            <c:if test="${empty newAnony}">
	            	<div class="box-body">
		              		등록된 게시글이 없습니다.
		            </div>
	            </c:if>
	            <c:if test="${not empty newAnony}">
                <c:forEach var="item" items="${newAnony}" varStatus="st">
                <div class="items">
	            <div class="box-body">
	              <div class="user-block">
	                <img class="img-circle" src="/JTalk/dist/img/tree.png" alt="User Image">
	                <span class="username"><a class="pointer" href="javascript:void(0)">J-Talk 대나무숲</a></span>
	                <fmt:formatDate value="${item.writeDate}" pattern="yyyy-MM-dd hh:mm" var="write_dt"/>
	                <span class="description">대신 전해드립니다 - ${write_dt}</span>
	              </div>
	              <div class="col-md-12 tree-content">
	              	<p>${item.content}</p>
	              </div>
	              <c:if test="${awesomeArray[st.index] eq true}">
	              	<button type="button" class="btn btn-default btn-xs" onclick="anonylike(this, ${item.num})"><i class="fa fa-check like-ico"></i> 좋아요</button>
	              </c:if>
	              <c:if test="${awesomeArray[st.index] eq false}">
	              	<button type="button" class="btn btn-default btn-xs" onclick="anonylike(this, ${item.num})"><i class="fa fa-thumbs-o-up like-ico"></i> 좋아요</button>
	              </c:if>
	              <c:if test="${member.active ge 2}">
	              	<button type="button" class="btn btn-default btn-xs" onclick="anonydelete('anony.action?command=delete', '${item.num}', 'main')"><i class="fa fa-trash"></i> 삭제</button>
	              </c:if>
	              <span class="pull-right text-muted">
	              <a class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5 "></i>좋아요 <span class="like-count"> ${item.awesome}</span></a> 
	              <a class="link-black text-sm" href="javascript:void(0);"><span onclick="anonyComment(this)"><i class="fa fa-comments-o margin-l-5 margin-r-5"></i>댓글 <span class="comment-count"> ${countList[st.index]}</span></span></a>
	              	</span>
	            </div>
	            <!-- /.box-body -->
	            <div class="box-footer box-comments hidden">
	            <c:if test="${empty commentList[st.index]}">
              	<div class="box-comment nocmt">등록된 댓글이 없습니다.</div>
              	</c:if>
	              <div class="box-comment">
	                <!-- /.유저 한명의 코멘트 -->
	              <c:if test="${not empty commentList[st.index]}">
		              <c:forEach var="item2" items="${commentList[st.index]}" varStatus="status">
		              
		              	<div class="box-comment">
		                	<!-- User image -->
			                <img class="img-circle img-sm" src="/JTalk/dist/img/tree.png" alt="User Image">
			
			                <div class="comment-text">
			                      <span class="username">
			                        J-Talk 대나무숲
			                        <span class="pull-right">
			                        <c:if test="${member.active ge 2}">
				                        <span class="margin-right-left"><a class="color-black" onclick=" anonycommentdelete(this, '${item2.num}')" style="cursor:pointer;"><i class="fa fa-trash"></i></a></span>
		                        	</c:if>
			                        <fmt:formatDate var="date" value="${item2.writeDate}" pattern="yyyy-MM-dd HH:mm:ss" />
			                        <span class="text-muted">${date}</span>
			                        </span>
			                      </span><!-- /.username -->
			                  <span>
			                  <span class="comment-in">${item2.content}</span>
			                  </span>
			                </div>
			                <!-- /.comment-text -->
		              </div>
		              </c:forEach>
	              </c:if>
	              <!-- /.유저 한명의 코멘트 -->
	              <form onsubmit="return anonycomment(this);">
	                <img class="img-responsive img-circle img-sm" src="/JTalk/dist/img/tree.png" alt="Alt Text">
	                <!-- .img-push is used to add margin to elements next to floating images -->
	                <div class="img-push input-group">
	                  <input type="hidden" name = "tableName" value = "anony"/>
	                  <input type="hidden" name = "postNum" value = "${item.num}"/>
	                  <input type="text"  name = "content" class="form-control input-sm" placeholder="댓글을 입력해주세요." required>
	                  <span class="input-group-btn">
	                      <button type="submit" class="btn btn-sm btn-primary btn-flat"><i class="fa fa-pencil"></i> 댓글 등록</button>
	                    </span>
	                </div>
	              </form>
		            </div>
		            <!-- /.box-footer -->
		          </div>
	          </div>
	          <div class="maintree-back"></div>
		      </c:forEach>    
		      </c:if>    
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
		            	<c:if test="${empty newNanum}">
		              		등록된 게시글이 없습니다.
		              	</c:if>
		              	<c:if test="${not empty newNanum}">
		              		<ul class="products-list product-list-in-box">
		              		<c:forEach items="${newNanum}" var="item">
		              			<li class="item">
				                  <div class="product-img">
				                    <img src="/JTalk/upload/${item.photo}" alt="Product Image" class="img-rounded">
				                  </div>
				                  <div class="product-info">
				                    <a href="javascript:actionparam('nanum.action?command=detail', '${item.num}')" class="product-title">${item.title}
				                      <c:if test="${item.isSoldout eq '0'}">
				                      	<span class="label label-success pull-right">진행</span></a>
				                      </c:if>
				                      <c:if test="${item.isSoldout eq '1'}">
				                      	<span class="label label-danger pull-right">마감</span></a>
				                      </c:if>
				                    </a>
				                    <span class="product-description">
				                    	<fmt:formatDate value="${item.writeDate}" pattern="yyyy-MM-dd HH:ss" var="write_format" />
			                            <i class="fa fa-clock-o"></i> ${write_format}  
			                			<i class="fa fa-eye"></i> ${item.hit}
			                        </span>
				                  </div>
				                </li>
		              		</c:forEach>
		              		</ul>
		              	</c:if>
		            </div>
		            <!-- /.box-body -->
		            <div class="box-footer text-center">
		              <a href="javascript:actionlink('nanum.action?command=nanum');" class="uppercase">자세히 보기</a>
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
		              	<c:if test="${empty newTrade}">
		              		등록된 게시글이 없습니다.
		              	</c:if>
		              	<c:if test="${not empty newTrade}">
		              		<ul class="products-list product-list-in-box">
		              		<c:forEach items="${newTrade}" var="item">
		              			<li class="item">
				                  <div class="product-img">
				                    <img src="/JTalk/upload/${item.photo}" alt="Product Image" class="img-rounded">
				                  </div>
				                  <div class="product-info">
				                    <a href="javascript:actionparam('trade.action?command=detail', '${item.num}')" class="product-title">${item.title}
				                      <c:if test="${item.isSoldout eq '0'}">
				                      	<span class="label label-primary pull-right">
				                      		￦ <fmt:formatNumber value="${item.price}" pattern="#,###" />
				                      	</span>
				                      </c:if>
				                      <c:if test="${item.isSoldout eq '1'}">
				                      	<span class="label label-danger pull-right">판매완료</span>
				                      </c:if>
				                    </a>
				                    <span class="product-description">
				                    	<fmt:formatDate value="${item.writeDate}" pattern="yyyy-MM-dd HH:ss" var="write_format" />
			                            <i class="fa fa-clock-o"></i> ${write_format}  
			                			<i class="fa fa-eye"></i> ${item.hit}
			                        </span>
				                  </div>
				                </li>
		              		</c:forEach>
		              		</ul>
		              	</c:if>
		            </div>
		            <!-- /.box-body -->
		            <div class="box-footer text-center">
		              <a href="javascript:actionlink('trade.action?command=trade');" class="uppercase">자세히 보기</a>
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
		              <div class="col-md-12 text-center"> 
		              	<a href="http://www.jslhrd.com/" target="_blank"><img src="http://www.jslhrd.com/img_up/shop_pds/jslcom/build/option/jsl-logo_01-011523350685.png" alt="First slide" style="margin:0 auto;"></a>
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
    <strong>Copyright &copy; 2017 <a>KLM Studio</a>.</strong> All rights
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
                <img id="pop-profile"class="img-circle" src="/JTalk/dist/img/user-default.png" alt="User Avatar">
              </div>
              <!-- /.widget-user-image -->
              <h3 class="widget-user-username font-bareun" id="pop-name1"></h3>
              <h5 class="widget-user-desc">JSL<span id="pop-period1"></span>기 - <span id="pop-date"></span></h5>
            </div>
            </div>
            <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_1" data-toggle="tab"><i class="fa fa-info-circle"></i> 회원 정보</a></li>
              <li><a href="#tab_2" data-toggle="tab"><i class="fa fa-envelope"></i> 메시지 보내기</a></li>
              <c:if test="${member.active ge 2}">
              	<li class="pull-right active-none"><a href="#tab_3" class="active-none" data-toggle="tab" class="text-muted"><i class="fa fa-gear"></i></a></li>
              </c:if>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active form-horizontal" id="tab_1">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-4 control-label"><i class="fa fa-envelope"></i> 이메일</label>

                    <div class="col-sm-8">
                      <p class="imformation-field" id="pop-email"></p>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputName" class="col-sm-4 control-label"><i class="fa fa-user"></i> 성명</label>

                    <div class="col-sm-8">
                      <p class="imformation-field" id="pop-name2"></p>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-4 control-label"><i class="fa fa-mortar-board "></i> 기수</label>

                    <div class="col-sm-8">
                      <p class="imformation-field"><span id="pop-period2"></span>기</p>
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-4 control-label"><i class="fa fa-user-plus"></i> 자기소개</label>

                    <div class="col-sm-8">
	                    <div class="imformation-field" id="pop-pr">
	                    </div>
                    </div>
                  </div>
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_2">
                <div class="form-horizontal" style="padding: 15px;">
                	<div class="alert alert-success alert-dismissible" id="message-div" style="display:none">
			          <button type="button" class="close" onclick="$('#message-div').css('display', 'none')">&times;</button>
			          <h4><i class="icon fa fa-check"></i>메시지 전송완료</h4>
			         	<p id="message-p">메시지 전송이 완료되었습니다.</p>
			        </div>
					<form id="message-form" method = "post" onsubmit="return sendmessagemodal()">
						<input id="receiveId" type="hidden" name="receiveId">
						<input type="hidden" name="sendName" value="${member.name}">
						<input id="sendId" type="hidden" name="sendId" value="${member.email}">
	                  <div class="form-group">
	                    <label for="inputName" class="col-sm-3 control-label"><i class="glyphicon glyphicon-text-size"></i> 제목</label>
	
	                    <div class="col-sm-9">
	                      <p class="imformation-field">
	                      	<input id="msg-title" type="text" class="form-control input-sm" placeholder="제목을 입력해주세요." name = "title" required>
	                    </div>
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="inputSkills" class="col-sm-3 control-label"><i class="fa fa-clone"></i> 내용</label>
	
	                    <div class="col-sm-9">
	                      <p class="imformation-field">
	                      	<textarea id="msg-content" class="form-control input-sm" rows="6" name="content" style="resize: none; width:100%;" placeholder="내용을 입력해주세요." required></textarea>
	                      	</p>
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <div class="col-md-12 text-right">
	                      <button type="submit" class="btn btn-sm btn-default">작성</button>
	                    </div>
	                  </div>
	                  </form>
	                </div>
              </div>
              <c:if test="${member.active eq 2 || member.active eq 3}">
	              <div class="tab-pane form-horizontal" id="tab_3">
	              <div class="alert alert-success alert-dismissible" id="message-admin-div" style="display:none">
				          <button type="button" class="close" onclick="$('#message-admin-div').css('display', 'none')">&times;</button>
				          <h4><i class="icon fa fa-check"></i>변경 완료</h4>
				         	<p id="message-admin-p"></p>
				        </div>
	                <div class="form-group">
	                    <label for="inputName" class="col-sm-4 control-label"><i class="glyphicon glyphicon-lock"></i> 비밀번호</label>
	
	                    <div class="col-sm-8">
	                      <p class="imformation-field"><button class="btn btn-default btn-xs" onclick="resetpassword()"><i class="fa fa-refresh"></i> 초기화</button></p>
	                    </div>
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="inputName" class="col-sm-4 control-label"><i class="fa fa-minus-circle"></i> 계정상태</label>
	
	                    <div class="col-sm-8">
	                      <p class="imformation-field" id="ban-0" style="display:none;"><font color="#3c8dbc" style="margin-right:10px;">정상</font><button class="btn btn-default btn-xs" onclick="userban('1')"><i class="fa fa-ban"></i> 비활성</button></p>
	                      <p class="imformation-field" id="ban-1" style="display:none;"><font color="red" style="margin-right:10px;">정지</font><button class="btn btn-default btn-xs" onclick="userban('0')"><i class="fa fa-bolt"></i> 활성</button></p>
	                    </div>
	                  </div>
	                  <c:if test="${member.active eq 3}">
	                  <div class="form-group">
	                    <label for="inputEmail" class="col-sm-4 control-label"><i class="fa fa-key "></i> 권한부여</label>
	
	                    <div class="col-sm-8">
	                      <p class="imformation-field" id="active-1" style="display:none;"><font color="#3c8dbc" style="margin-right:10px;">일반 사용자</font><button class="btn btn-default btn-xs" onclick="adminassign('2')"><i class="fa fa-spinner"></i> 관리자 권한 부여</button></p>
	                      <p class="imformation-field" id="active-2" style="display:none;"><font color="red" style="margin-right:10px;">관리자</font><button class="btn btn-default btn-xs" onclick="adminassign('1')"><i class="fa fa-spinner"></i> 일반 사용자로 변경</button></p>
	                    </div>
	                  </div>
	                  </c:if>
	              </div>
              </c:if>
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
<script src="/JTalk/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/JTalk/bower_components/jquery-ui/jquery-ui.min.js"></script>
<script src="/JTalk/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/JTalk/dist/js/adminlte.min.js"></script>
<script src="/JTalk/dist/js/utils.js"></script>
<script src="/JTalk/dist/js/tree.js"></script>
</body>
</html>