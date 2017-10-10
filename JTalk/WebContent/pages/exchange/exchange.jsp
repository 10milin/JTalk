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
          <c:if test="${member.active eq 3}">
          	<li>
              <a href="javascript:actionlink('admin.action');"><i class="fa fa-cogs"></i></a>
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
        <i class="fa fa-comments-o"></i> 선후배교류
        <small>선후배간에 다양한 이야기를 나눠보세요.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="javascript:actionlink('index.action');"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">선후배교류</li>
      </ol>
    </section>
    <section class="content">
	    <div class="row">
	    	<div class="col-md-12">
	    	<div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title font-bareun"><i class="fa fa-list"></i> 글 목록</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body box-body-padding">
            	<div class="col-md-12">
              <table class="table table-condensed table-hover table-md">
                <tr class="table-field">
                  <th style="width: 50px;">기수</th>
                  <th style="width: 100px;">카테고리</th>
                  <th>제목</th>
                  <th style="width: 10%;">글쓴이</th>
                  <th style="width: 13%;">작성일</th>
                  <th style="width: 9%;">조회수</th>
                </tr>
                <c:if test="${empty currentList}">
                	<c:if test="${empty search}">
	                	<td colspan="6" align="center">등록된 게시글이 없습니다.</td>
	                </c:if>
	                <c:if test="${not empty search}">
	                	<td colspan="6" align="center">검색결과가 없습니다.</td>
	                </c:if>
                </c:if>
                <c:if test="${not empty currentList}">
                	<jsp:useBean id="now" class="java.util.Date" />
                	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
                	<c:forEach var="item" items="${currentList}" varStatus="status">
                		<tr class="table-field">
		                  <td>${item.period}</td>
		                  <td>${item.category}</td>
		                  <td class="td-title">
		                  	  <a class="atag-black" href="javascript:actionparam('exchange.action?command=detail', '${item.num}')">${item.title}</a>
			                  <i class="fa fa-commenting-o"></i> ${countList.get(status.index)}
							  <fmt:formatDate value="${item.writeDate}" pattern="yyyy-MM-dd" var="write_dt"/>
							  <c:if test="${today == write_dt}">
			                  	<small class="label bg-green" style="margin-left:5px;">new</small>
			                  </c:if>
		                  </td>
		                  <td><a href="javascript:showmember('${item.writerId}')">${item.writerName}</a></td>
		                  <td>
		                  <c:if test="${today == write_dt}">
			                  	<fmt:formatDate var="fmtDate" value="${item.writeDate}" pattern="HH:mm" />
			              </c:if>
			              <c:if test="${today != write_dt}">
			                  	<fmt:formatDate var="fmtDate" value="${item.writeDate}" pattern="yyyy-MM-dd" />
			              </c:if>
		                  ${fmtDate}
		                  </td>
		                  <td>${item.hit}</td>
		                </tr>
                	</c:forEach>
                </c:if>
              </table>
              <table class="table table-condensed table-hover table-xd">
              	<tr class="table-field">
                  <th>제목</th>
                  <th style="width: 18%;">글쓴이</th>
                  <th style="width: 20%;">작성일</th>
                </tr>
                <c:if test="${empty currentList}">
                	<c:if test="${empty search}">
	                	<td colspan="3" align="center">등록된 게시글이 없습니다.</td>
	                </c:if>
	                <c:if test="${not empty search}">
	                	<td colspan="3" align="center">검색결과가 없습니다.</td>
	                </c:if>
                </c:if>
                <c:if test="${not empty currentList}">
                	<c:forEach var="item" items="${currentList}">
                		<tr class="table-field">
		                  <td class="td-title none-text-indent">
		                  	  [${item.period}기] [${item.category}]<br>
		                  	  <a class="atag-black" href="javascript:actionparam('exchange.action?command=detail', '${item.num}')">${item.title}</a>
			                  <i class="fa fa-commenting-o"></i> ${countList.get(status.index)}
							  <fmt:formatDate value="${item.writeDate}" pattern="yyyy-MM-dd" var="write_dt"/>
							  <c:if test="${today == write_dt}">
			                  	<small class="label bg-green" style="margin-left:5px;">new</small>
			                  </c:if>
		                  </td>
		                  <td class="table-td-vline"><a href="javascript:showmember('${item.writerId}')">${item.writerName}</a></td>
		                  <td class="table-td-vline">
		                  	<c:if test="${today == write_dt}">
			                  	<fmt:formatDate var="fmtDate" value="${item.writeDate}" pattern="HH:mm" />
				            </c:if>
				            <c:if test="${today != write_dt}">
				                 <fmt:formatDate var="fmtDate" value="${item.writeDate}" pattern="yy-MM-dd" />
				            </c:if>
			                  ${fmtDate}
		                  </td>
		                </tr>
                	</c:forEach>
                </c:if>
              </table>
              </div>
              <div class="col-md-12">
              <div class="text-right table-bottom">
              	<form action = "/JTalk/exchange.action?command=exchange" method="post">
              	<div class="col-md-3 col-xs-12 no-padding mobile-center">
              		<c:if test="${not empty search}">
              			<div id="searchbar"class="input-group" toggle="1" style="display:inline-table;">
	                    <input type="text" class="form-control" placeholder="검색어를 입력해주세요." value="${search}" name="search" required>
	                    <span class="input-group-btn">
	                        <button class="btn btn-default" type="submit">
	                            <i class="glyphicon glyphicon-search"></i>
	                        </button>
	                    </span>
	                </div>
              		</c:if>
              		<c:if test="${empty search}">
	                <div id="searchbar"class="input-group" toggle="0" style="display:none;">
	                    <input type="text" class="form-control" placeholder="검색어를 입력해주세요." value="${search}" name="search" required>
	                    <span class="input-group-btn">
	                        <button class="btn btn-default" type="submit">
	                            <i class="glyphicon glyphicon-search"></i>
	                        </button>
	                    </span>
	                </div>
	                </c:if>
	              </div>
                </form>
              
              <div class="col-md-9 col-xs-12 text-right no-padding">
              		<c:if test="${empty search}">
              			<button type="button" class="btn btn-default" onclick="searchbar(this);"><i class="glyphicon glyphicon-search"></i> 검색</button>
                	</c:if>
                	<c:if test="${not empty search}">
                		<button type="button" class="btn btn-default" onclick="searchbar(this);"><i class="glyphicon glyphicon-search"></i> 검색</button>
                		<button type="button" class="btn btn-default" onclick="actionlink('exchange.action?command=exchange');"><i class="fa fa-list"></i> 목록</button>
                	</c:if>
                	<button type="button" class="btn btn-default" onclick="actionlink('exchange.action?command=writeform');"><i class="fa fa-edit"></i> 쓰기</button>
	              	
              	</div>
              </div>
              <div class="col-md-12 text-center" style="display:inline-block; width:100%">
              	<form action="/JTalk/exchange.action?command=exchange" method="post" id="pagination-form">
              		<ul id="pagination" class="pagination-sm"></ul>
              		<input id = "pagination-page" type="hidden" name="currentPage" value="${currentPage}">
              		<input type="hidden" name="search" value="${search}">
              	</form>
              </div>
              </div>
            </div>
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
<script src ="/JTalk/bower_components/pagination/jquery.twbsPagination.js"></script>
<script src="/JTalk/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/JTalk/dist/js/utils.js"></script>
<script src="/JTalk/dist/js/adminlte.min.js"></script>
<script>
  pagination(${totalPage},${currentPage});
</script>
</body>
</html>