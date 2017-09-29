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
        <i class="fa fa-user "></i> 프로필
        <small>회원정보를 확인 할 수 있습니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="javascript:actionlink('index.action');"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">프로필</li>
      </ol>
    </section>
    <section class="content">
		<div class="row">
        <div class="col-md-3 padding-right">
  
          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
            <img class="profile-user-img img-responsive img-circle" src="/JTalk/upload/${member.profile}" alt="User profile picture">
            <%-- <c:if test="${!member.profile.equals('http://localhost:8181/JTalk/dist/img/user-default.png')}">
              <img class="profile-user-img img-responsive img-circle" src="/JTalk/upload/${member.profile}" alt="User profile picture">
			</c:if>
			<c:if test="${member.profile.equals('http://localhost:8181/JTalk/dist/img/user-default.png')}">
              <img class="profile-user-img img-responsive img-circle" src="${member.profile}" alt="User profile picture">
			</c:if> --%>
        
              <h3 class="profile-username text-center">${sessionScope.member.name}</h3>

              <p class="text-muted text-center">JSL - ${sessionScope.member.period}기</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>이메일</b> <a class="pull-right">${sessionScope.member.email}</a>
                </li>
                <li class="list-group-item">
                  <b>가입일</b> <a class="pull-right">
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
		 	${fn:replace(member.pr, enter, '<br/>')}
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs" id="myTab">
              <li class="active"><a href="#information" data-toggle="tab"><i class="fa fa-info-circle"></i> 회원 정보</a></li>
              <li><a href="#market" data-toggle="tab"><i class="fa fa-shopping-cart"></i> 마켓 관리</a></li>
              <li><a href="#message" data-toggle="tab"><i class="fa fa-envelope-o"></i> 메시지함</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane form-horizontal" id="information">

                  <div class="form-group">
                    <label for="inputName" class="col-sm-4 control-label"><i class="fa fa-envelope"></i> 이메일</label>

                    <div class="col-sm-8">
                      <p class="imformation-field">${sessionScope.member.email}</p>
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
                      <p class="imformation-field">${sessionScope.member.name}</p>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-4 control-label"><i class="fa fa-mortar-board "></i> 기수</label>

                    <div class="col-sm-8">
                      <p class="imformation-field">${sessionScope.member.period}기</p>
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
                    	<c:set var="str" value="user-default.png"/>
                    	<p class="imformation-field">
                    		<c:if test="${member.profile eq str}">미등록</c:if>
                    		<c:if test="${member.profile ne str}">등록</c:if>
                    	</p>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-4 control-label"><i class="fa fa-user-plus"></i> 자기소개</label>

                    <div class="col-sm-8">
	                    <div class="imformation-field">
	                    	${fn:replace(member.pr, enter, '<br>')}
	                    </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-md-12 text-right">
                      <button type="button" class="btn btn-primary" onclick="actionlink('profile.action?command=profileform');">정보 변경</button>
                    </div>
                  </div>

              </div>
              
              <div class="tab-pane" id="market">
                
              </div>
              <!-- /.tab-pane -->

              <div class="tab-pane" id="message">
				<div class="box-body no-padding">
                  <div class="mailbox-controls">
                    <!-- Check all button -->
                    <button type = "button" class="btn btn-default btn-sm checkbox-toggle" id="checkedtoggle"><i id="checkbtn"class="fa fa-check-square-o"></i></button>
                    <div class="btn-group">
                      <button type = "button" class="btn btn-default btn-sm" onclick = "deletechoice()"><i class="glyphicon glyphicon-trash"></i></button>
                      <button type="submit" class="btn btn-default btn-sm" onclick="actionlink('message.action')"><i class="glyphicon glyphicon-refresh"></i></button>
                    </div><!-- /.btn-group -->
                    
                    <div class="pull-right">
                    	<div class="btn-group">
	                    	<button type="button" class="btn btn-default btn-sm" onclick="listtoggle()"><i class="fa fa-list"></i></button>
	                    	<button type="button" class="btn btn-sm btn-default" onclick="writetoggle()"><i class="fa fa-edit"></i></button>
                    	</div>
                    </div>
                  </div>
                  <div class="scroll-h">		
						<div id="div-msgwrite" class="col-md-12 col-xs-12 form-horizontal" style="padding: 15px; display:none;">
						<form id="send-action" method = "post" onsubmit="return sendmessage()">
						  <input id="sendId" name="sendId" type="hidden"  value="${member.email}">
						  <input id="sendName" type="hidden" name="sendName" value="${member.name}">
						  <input id="reciveId" type="hidden" name="receiveId">
		                  <div class="form-group">
		                    <label for="inputName" class="col-sm-3 control-label"><i class="fa fa-user"></i> 받는이</label>
							
		                    <div class="col-sm-9">
		                      <div class="input-group input-group-sm imformation-field">
				                <input id="emailserach-input"type="text" class="form-control input-sm" placeholder="받는 사람의 이름을 입력해주세요." name = "name" autocomplete="off">
				                    <span class="input-group-btn">
				                      <button type="button" class="btn btn-default btn-flat" onclick="namefindemail()"><i class="fa fa-search"></i> 검색</button>
				                    </span>
				              </div>
		                    </div>
		                  </div>
							
						<div id="emailserach-div" class="form-group" style="display:none;">
		                    <label for="inputName" class="col-sm-3 control-label"></label>
		
		                    <div class="col-sm-9">
		                      <div class="imformation-field">
		                      		<table class="table table-condensed">
		                      			<tbody id="emailserach-table">
		                      			
		                      			</tbody>
		                      		</table>
		                      	</div>
		                    </div>
		                  </div>
							
		                  <div class="form-group">
		                    <label for="inputName" class="col-sm-3 control-label"><i class="glyphicon glyphicon-text-size"></i> 제목</label>
		
		                    <div class="col-sm-9">
		                      <p class="imformation-field">
		                      	<input id = "profile-msg-title" type="text" class="form-control input-sm" placeholder="제목을 입력해주세요." name = "title" required>
		                    </div>
		                  </div>
		                  
		                  <div class="form-group">
		                    <label for="inputSkills" class="col-sm-3 control-label"><i class="fa fa-clone"></i> 내용</label>
		
		                    <div class="col-sm-9">
		                      <p class="imformation-field">
		                      	<textarea id="profile-msg-content" class="form-control input-sm" rows="6" name="content" style="resize: none; width:100%;" placeholder="내용을 입력해주세요." required></textarea>
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
		            <form id="check-form" action="/JTalk/message.action?command=deletechoice" method="POST">
                    <table id="table-msglist" class="table table-hover">
                      <tbody id = "messagelist" toggle="0">
                      		<c:if test="${empty allMessageList}">
                      		<tr>
                          		<td colspan="5" class="text-center">받은 메시지가 없습니다.</td>
                         	</tr>
                         	</c:if>
                         	<c:if test="${not empty allMessageList}">
                         	<c:forEach var="item" items="${allMessageList}">
                         	<tr id="${item.num}">
	                          <td><input class = "mailbox-check" type="checkbox" name = "selected" value = "${item.num}"></td>
	                          <td class="mailbox-name"><a href="javascript:writelink('${item.sendName}','${item.sendId}')">${item.sendName}</a></td>
	                          <td class="mailbox-subject"><a href="javascript:void(0)" onclick="msgdetail(this)"detail="0" read="${item.readMessage}">${item.title}</a></td>
	                          <fmt:formatDate var="date" value="${item.writeDate}" pattern="yy-MM-dd hh:mm" />
	                          <td class="mailbox-date">${date}</td>
	                          <td><a href="javascript:actionparam('message.action?command=delete',${item.num});"><i class="glyphicon glyphicon-trash"></i></a></td>
                        	</tr>
                        	<tr style="display:none;">
                        		<td colspan="5">
                        			<div class="message-detail">
						                <h4>${item.title}</h4>
						                <div>
						                	${item.content}
						                </div>
						              </div>
                        		</td>
                        	</tr>                         	
                         	</c:forEach>
                        	</c:if>
                      </tbody>
                    </table><!-- /.table -->
                    </form>
                  </div><!-- /.mail-box-messages -->
               </div><!-- /.box-body -->
             </div><!-- /. box -->
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
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
<!-- modal -->
<div class="modal fade" id="msg-complete">
  <div class="modal-dialog">
    <div class="modal-content">
   	  <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="fa fa-comments"></i> J-Talk 안내 메시지</h4>
      </div>
      <div class="modal-body">
        <p id="modal-msg"></p>
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
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<c:if test="${tab eq 'message'}">
	<script>
		$('#myTab a:last').tab('show');
	</script>
</c:if>
<c:if test="${not empty showmsg}">
	<script>
		var trid = $('#${showmsg}');
		trid.next().css('display', 'table-row');
		$(trid).children('.mailbox-subject').children().attr('detail', '1');
	</script>
</c:if>
</body>
</html>