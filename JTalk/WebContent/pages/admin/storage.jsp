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
</head>
<body class="${body_admin}">
<div class="wrapper">
  <header class="main-header">
    <!-- Logo -->
    <a href="javascript:actionlink('admin.action?command=main');" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>J</b>SL</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>J-TALK</b> <small>admin</small></span>
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
          <li>
              <a href="javascript:actionlink('index.action');"><i class="glyphicon glyphicon-home"></i></a>
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
      	<li class="header">MEMBER</li>
      	<li><a href="javascript:actionlink('admin.action?command=member');"><i class="fa fa-group"></i> <span>회원정보</span></a></li>
      	<li><a href="javascript:actionlink('admin.action?command=admin');"><i class="fa fa-user-plus"></i> <span>관리자정보</span></a></li>
        <li class="header">SYSTEM</li>
        <li><a href="javascript:actionlink('admin.action?command=log');"><i class="fa fa-code-fork"></i> <span>로그</span></a></li>
        <li><a href="javascript:actionlink('admin.action?command=storage');"><i class="fa fa-database"></i> <span>저장공간</span></a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  	<section class="content-header">
      <h1 class="font-bareun">
        <i class="fa fa-database"></i> 저장공간 
        <small>DB의 저장공간을 확인 할 수 있습니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="javascript:actionlink('admin.action?command=main');"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">저장공간</li>
      </ol>
    </section>
    <section class="content">
	    <div class="row">
	    	<div class="col-md-12">
	    	<div class="box box-danger">
            <div class="box-header">

            </div>
            <!-- /.box-header -->
            <div class="box-body box-body-padding">
            	<div class="col-md-12">
              <table class="table table-condensed table-hover table-md">
                <tr class="table-field">
                  <th style="width: 20%;">게시판</th>
                  <th style="width: 20%;">테이블명</th>
                  <th style="width: 30%;">테이블 칼럼개수</th>
                  <th>용량</th>
                </tr>
                <c:if test="${not empty currentList}">
                	<c:forEach var="item" items="${currentList}" varStatus="status">
                		<tr class="table-field">
                		  <c:choose>
                		  	<c:when test="${item.table_name eq 'notice'}">
                		  		<c:set var="board_name" value="공지사항"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'anony'}">
                		  		<c:set var="board_name" value="대나무숲"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'we'}">
                		  		<c:set var="board_name" value="우리끼리"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'exchange'}">
                		  		<c:set var="board_name" value="선후배교류"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'study'}">
                		  		<c:set var="board_name" value="스터디모집"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'it'}">
                		  		<c:set var="board_name" value="IT"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'japanese'}">
                		  		<c:set var="board_name" value="일본어"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'food'}">
                		  		<c:set var="board_name" value="주변맛집"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'life'}">
                		  		<c:set var="board_name" value="생활정보"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'nanum'}">
                		  		<c:set var="board_name" value="행복나눔"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'trade'}">
                		  		<c:set var="board_name" value="중고나라"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'speech'}">
                		  		<c:set var="board_name" value="스피치"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'project'}">
                		  		<c:set var="board_name" value="프로젝트"/>
                		  	</c:when>
                		  </c:choose>
		                  <td>${board_name}</td>
		                  <td>${item.table_name}</td>
		                  <td>${item.table_rows}</td>
		                  <td><fmt:formatNumber value="${item.data_size}" pattern="0.00"/> MB</td>
		                </tr>
                	</c:forEach>
                </c:if>
              </table>
              <table class="table table-condensed table-hover table-xd">
              	<tr class="table-field">
                  <th style="width: 25%;">게시판</th>
                  <th style="width: 25%;">테이블명</th>
                  <th style="width: 25%;">칼럼개수</th>
                  <th>용량</th>
                </tr>
                <c:if test="${not empty currentList}">
                	<c:forEach var="item" items="${currentList}" varStatus="status">
                		<tr class="table-field">
                		  <c:choose>
                		  	<c:when test="${item.table_name eq 'notice'}">
                		  		<c:set var="board_name" value="공지사항"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'anony'}">
                		  		<c:set var="board_name" value="대나무숲"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'we'}">
                		  		<c:set var="board_name" value="우리끼리"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'exchange'}">
                		  		<c:set var="board_name" value="선후배교류"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'study'}">
                		  		<c:set var="board_name" value="스터디모집"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'it'}">
                		  		<c:set var="board_name" value="IT"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'japanese'}">
                		  		<c:set var="board_name" value="일본어"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'food'}">
                		  		<c:set var="board_name" value="주변맛집"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'life'}">
                		  		<c:set var="board_name" value="생활정보"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'nanum'}">
                		  		<c:set var="board_name" value="행복나눔"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'trade'}">
                		  		<c:set var="board_name" value="중고나라"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'speech'}">
                		  		<c:set var="board_name" value="스피치"/>
                		  	</c:when>
                		  	<c:when test="${item.table_name eq 'project'}">
                		  		<c:set var="board_name" value="프로젝트"/>
                		  	</c:when>
                		  </c:choose>
		                  <td class="table-td-vline-origin">${board_name}</td>
		                  <td class="table-td-vline-origin">${item.table_name}</td>
		                  <td class="table-td-vline-origin">${item.table_rows}</td>
		                  <td class="table-td-vline-origin"><fmt:formatNumber value="${item.data_size}" pattern="0.00"/> MB</td>
		                </tr>
                	</c:forEach>
                </c:if>
              </table>
              </div>
              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
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
            <div class="widget-user-header bg-red">
              <div class="widget-user-image">
                <img id="pop-profile"class="img-circle" src="/JTalk/dist/img/user-default.png" alt="User Avatar">
              </div>
              <!-- /.widget-user-image -->
              <h3 class="widget-user-username font-bareun" id="pop-name1"></h3>
              <h5 class="widget-user-desc">JSL<span id="pop-period1"></span>기 - <span id="pop-date"></span></h5>
            </div>
            </div>
            <div class="nav-tabs-custom red">
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
        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
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
<script src="/JTalk/dist/js/adminlte.min.js"></script>
<script src="/JTalk/dist/js/utils.js"></script>
<script>
  pagination(${totalPage},${currentPage});
</script>
</body>
</html>