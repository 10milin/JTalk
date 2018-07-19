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
  <!-- DataTables -->
  <link rel="stylesheet" href="/JTalk/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="<c:out value="${body}"/>">
<div class="wrapper">
  <jsp:include page="../header.jsp"/>
  <!-- Left side column. contains the logo and sidebar -->
  <jsp:include page="../aside.jsp"/>
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
                <div class="box-body no-padding">
                	<table id="market-table" class="table table-bordered table-hover text-center">
		                <thead>
		                <tr>
		                  <th>분류</th>
		                  <th>글제목</th>
		                  <th>상태</th>
		                </tr>
		                </thead>
		                <tbody>
		                <c:forEach var="item" items="${marketList}">
		                	<tr>
			                  <td width="15%">
			                  	<c:if test="${item.category eq 'nanum'}">
			                  		<i class="fa fa-heart"></i>
			                  	</c:if>
			                  	<c:if test="${item.category eq 'trade'}">
			                  		<i class="fa fa-shopping-cart"></i>
			                  	</c:if>
			                  </td>
			                  <td class="market-table-over">
			                  <a href="javascript:actionparam('${item.category}.action?command=detail', '${item.num}')">${item.title}</a></td>
			                  <td width="20%">
			                  <c:if test="${item.isSoldout eq '0'}">
			                  	진행
			                  </c:if>
			                   <c:if test="${item.isSoldout eq '1'}">
			                  	마감
			                  </c:if> 
			                   </td>
			                </tr>
		                </c:forEach>
		                </tbody>
		              </table>
                </div>
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
  <jsp:include page="../footer.jsp"/>
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
<script src="/JTalk/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/JTalk/bower_components/jquery-ui/jquery-ui.min.js"></script>
<script src="/JTalk/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/JTalk/bower_components/datatables.net/js/jquery.dataTables.js"></script>
<script src="/JTalk/bower_components/datatables.net-bs/js/dataTables.bootstrap.js"></script>
<script src="/JTalk/dist/js/utils.js"></script>
<script src="/JTalk/dist/js/adminlte.min.js"></script>
<c:if test="${tab eq 'message'}">
	<script>
		$($('#myTab').find('a')[2]).tab('show');
	</script>
</c:if>
<c:if test="${not empty showmsg}">
	<script>
		var trid = $('#${showmsg}');
		trid.next().css('display', 'table-row');
		$(trid).children('.mailbox-subject').children().attr('detail', '1');
	</script>
</c:if>
<script>
	$('#market-table').DataTable({
	    'paging'      : true,
	    'pageLength': 10,
	    'bInfo': false,
	    'lengthChange': false,
	    'searching'   : false,
	    'ordering'    : false,
	    'info'        : true,
	    'autoWidth'   : false,
	    'language': {
			 "paginate": {
			 "previous": "<i class='fa fa-angle-left'></i>",
			 "next": "<i class='fa fa-angle-right'></i>"
			}
	    }
	  });
</script>
</body>
</html>