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
  <!-- Date Picker -->
  <link rel="stylesheet" href="/JTalk/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="/JTalk/bower_components/bootstrap-daterangepicker/daterangepicker.css">
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
        <i class="fa fa-code"></i> 프로젝트
        <small>IT 프로젝트를 소개해요.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="javascript:actionlink('index.action');"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">프로젝트</li>
      </ol>
    </section>
    <section class="content">
	    <div class="row">
	    	<div class="col-md-12">
	    	<div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title font-bareun"><i class="fa fa-pencil"></i> 글 수정</h3>
            <!-- /.box-header -->
            </div>
            <form action = "/JTalk/project.action?command=modify" method="post" enctype="multipart/form-data">
            <div class="box-body">
              <div>
              	<div class="input-group input-margin-btm">
	                <span class="input-group-addon"><i class="glyphicon glyphicon-text-size"></i></span>
	                <input type="text" class="form-control" placeholder="프로젝트명" name="title" required value="${project.title}">
	                <input type="hidden" name="writerId" value="${member.email}">
	                <input type="hidden" name="writerName" value="${member.name}">
	                <input type="hidden" name="period" value="${project.period}">
	                <input type="hidden" name="num" value="${project.num}">
	              </div>
	              <div class="input-group input-margin-btm">
	                <span class="input-group-addon"><i class="fa fa-bars" style="width:14px; height:16px;"></i></span>
	                <select id="category" class="form-control" name="category" required>
	                    <option value="none" disabled selected hidden>카테고리</option>
	                    <option value="JAVA">JAVA</option>
	                    <option value="JSP&Servlet">JSP&Servlet</option>
	                    <option value="Struts2">Struts2</option>
	                    <option value="기타">기타</option>
                 	 </select>
                 	 <c:set var="category" value="'${project.category}'"/>
	              </div>
	              <div class="input-group input-margin-btm">
	                <span class="input-group-addon"><i class="fa fa-star" style="width:14px; height:16px;"></i></span>
	                <input type="text" class="form-control" placeholder="팀명" name="teamName" required value="${project.teamName}">
	              </div>
	              <div class="input-group input-margin-btm">
	                <span class="input-group-addon"><i class="fa fa-group" style="width:14px; height:16px;"></i></span>
	                <input type="text" class="form-control" placeholder="팀원이름" name="teamMember" required value="${project.teamMember}">
	              </div>
	              <div class="input-group input-margin-btm">
	                <span class="input-group-addon"><i class="fa fa-calendar" style="width:14px; height:16px;"></i></span>
	                <input type="text" class="form-control pull-right" name="closingDate" id="reservation" required placeholder="프로젝트 기간" value="${project.closingDate}">
	              </div>
	              <textarea class="summernote" name="content" required>${project.content}</textarea>
	              <div class="input-group col-md-4">
					<span class="input-group-addon"><i class="fa fa-upload"></i></span>
	                <input id = "uploadfield" value="${project.fileName }" type="text" class="form-control" readonly>
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
              	<button type="button" class="btn btn-default" onclick="actionlink('project.action?command=project');"><i class="fa fa-list"></i> 목록</button>
              	<button type="submit" class="btn btn-default"><i class="fa fa-pencil"></i> 수정</button>
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
  <jsp:include page="../footer.jsp"/>
</div>
<div id="actionpost"></div>
<!-- modal -->
<jsp:include page="../modal.jsp"/>
<!-- /.modal -->
<script src="/JTalk/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/JTalk/bower_components/jquery-ui/jquery-ui.min.js"></script>
<script src="/JTalk/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/JTalk/bower_components/summernote/dist/summernote.js"></script>
<script src="/JTalk/bower_components/summernote/dist/lang/summernote-ko-KR.js"></script>
<script src="/JTalk/bower_components/summernote/dist/emoticons.js"></script>
<script src="/JTalk/dist/js/adminlte.min.js"></script>
<script src="/JTalk/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script src="/JTalk/bower_components/moment/min/moment.min.js"></script>
<script src="/JTalk/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="/JTalk/dist/js/utils.js"></script>
<script src="/JTalk/dist/js/date.js"></script>
<script>
  $('.summernote').summernote({
      height: 400,
      tabsize: 2,
      linkTargetBlank: false,
      lang: 'ko-KR',
      disableDragAndDrop: true
    });
  $('.note-insert').contents(":last-child").attr('data-original-title', '이모티콘');
  $('#category').val(${category}).prop('selected', true);
</script>
</body>
</html>