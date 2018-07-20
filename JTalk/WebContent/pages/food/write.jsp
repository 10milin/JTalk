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
  <!-- Summernote -->
  <link rel="stylesheet" href="/JTalk/bower_components/summernote/dist/summernote.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <link rel="icon" type="image/png" sizes="16x16" href="/JTalk/dist/img/favicon.png">
  <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBKf9LlUhWBeusRC2T6s_nXGd0i8s3hf-Y&language=Ko&region=Ko"></script>
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
        <i class="fa fa-cutlery"></i> 주변맛집
        <small>JSL연수생들과 다양한 정보를 공유하세요.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="javascript:actionlink('index.action');"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">주변맛집</li>
      </ol>
    </section>
    <section class="content">
	    <div class="row">
	    	<div class="col-md-12">
	    	<div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title font-bareun"><i class="fa fa-edit"></i> 글 쓰기</h3>
            <!-- /.box-header -->
            </div>
            <form action = "/JTalk/food.action?command=write" method="post" enctype="multipart/form-data">
            <div class="box-body">
              <div>
              	  <div class="input-group input-margin-btm">
	                <span class="input-group-addon"><i class="glyphicon glyphicon-text-size"></i></span>
	                <input type="text" class="form-control" placeholder="제목" name="title" required>
	                <input type="hidden" name="writerId" value="<c:out value="${member.email}"/>">
	                <input type="hidden" name="writerName" value="<c:out value="${member.name}"/>">
	              </div>
	              <div class="input-group input-margin-btm">
	                <span class="input-group-addon"><i class="fa fa-map-marker" style="width:14px; height:16px"></i></span>
	                <input id="address" type="text" class="form-control" placeholder="주소" name="address" required>
	                <span class="input-group-btn">
                      <button type="button" class="btn btn-primary btn-flat" onclick="initialize();"><i class="fa fa-google"></i> 지도연동</button>
                    </span>
	              </div>
	              <div id="map-canvas" style="width: 100%; height: 340px; display:none;"></div>
	              <p class="help-block input-margin-btm">정확한 주소를 입력하시면 지도에 표시됩니다. 『JSL인재개발원 - > 대전광역시 중구 용두동 JSL인재개발원』</p>
	              <textarea class="summernote" name="content" required></textarea>
	              <div class="input-group col-md-4">
					<span class="input-group-addon"><i class="fa fa-upload"></i></span>
	                <input id = "uploadfield" type="text" class="form-control" readonly>
	                <div class="input-group-btn">
		              <div class="btn btn-default btn-file">
		                  <i class="glyphicon glyphicon-folder-open"></i>&nbsp;&nbsp;업로드
		                  <input type="file" name="file" onchange="$('#uploadfield').val(this.value.split('\\')[2]);">
		                </div>
		             </div>
	                <!-- /btn-group -->
			       </div>
	              <p class="help-block">제한용량 5MB</p>
	              <p class="help-block">업로드 가능 확장자 jpg | jpeg | gif | png | hwp | pdf | ppt | pptx | xlsx | doc</p>
	              <div class="text-right table-bottom" style="border:0px">
              	<button type="button" class="btn btn-default" onclick="actionlink('food.action?command=food');"><i class="fa fa-list"></i> 목록</button>
              	<button type="submit" class="btn btn-default"><i class="fa fa-edit"></i> 쓰기</button>
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
<script src="/JTalk/bower_components/summernote/dist/summernote.js"></script>
<script src="/JTalk/bower_components/summernote/dist/lang/summernote-ko-KR.js"></script>
<script src="/JTalk/bower_components/summernote/dist/emoticons.js"></script>
<script src="/JTalk/dist/js/utils.js"></script>
<script src="/JTalk/dist/js/adminlte.min.js"></script>
<script src="/JTalk/dist/js/map.js"></script>
<script>
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