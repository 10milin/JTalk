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
  <!-- Summernote -->
  <link rel="stylesheet" href="/JTalk/bower_components/summernote/dist/summernote.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <link rel="icon" type="image/png" sizes="16x16" href="/JTalk/dist/img/favicon.png">
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
		      <div id="contents" total="${totalPage}">
	          <!-- 게시글 하나 -->
	          <c:if test="${not empty currentList}">
                <c:forEach var="item" items="${currentList}" varStatus="st">
	          <div class="box box-default items">
	            <div class="box-body">
	            
	              <div class="user-block">
	              
	                <img class="img-circle" src="/JTalk/dist/img/tree.png" alt="User Image">
	                <span class="username"><a>J-Talk 대나무숲</a></span>
	                <span class="description">대신 전해드립니다 - <fmt:formatDate value="${item.writeDate}" pattern="yyyy-MM-dd hh:mm" var="writedt"/><c:out value="${writedt}"/></span>
	              </div>
	              <div class="col-md-12 tree-content">
	              	<p><c:out value="${item.content}" escapeXml="false"/></p>
	              </div>
	              <c:if test="${awesomeArray[st.index] eq true}">
	              	<button type="button" class="btn btn-default btn-xs" onclick="anonylike(this, <c:out value="${item.num}"/>)"><i class="fa fa-check like-ico"></i> 좋아요</button>
	              </c:if>
	              <c:if test="${awesomeArray[st.index] eq false}">
	              	<button type="button" class="btn btn-default btn-xs" onclick="anonylike(this, <c:out value="${item.num}"/>)"><i class="fa fa-thumbs-o-up like-ico"></i> 좋아요</button>
	              </c:if>
	              <c:if test="${member.active ge 2}">
	              	<button type="button" class="btn btn-default btn-xs" onclick="actionparam('anony.action?command=delete', '<c:out value="${item.num}"/>')"><i class="fa fa-trash"></i> 삭제</button>
	              </c:if>
	              <span class="pull-right text-muted">
	              <a class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i>좋아요 <span class="like-count"> <c:out value="${item.awesome}"/></span> </a> 
	              <a class="link-black text-sm" href="javascript:void(0);"><span onclick="anonyComment(this)"><i class="fa fa-comments-o margin-l-5 margin-r-5"></i>댓글 <span class="comment-count"> <c:out value="${countList[st.index]}"/></span></span></a>
	              	</span>
	            </div>
	            <!-- /.box-body -->
	            <div class="box-footer box-comments hidden">
	              <c:if test="${empty cmtList[st.index]}">
              	<div class="box-comment nocmt">등록된 댓글이 없습니다.</div>
              </c:if>
              <c:if test="${not empty cmtList[st.index]}">
	              <c:forEach var="item2" items="${cmtList[st.index]}" varStatus="status">
	              	<div class="box-comment">
	                	<!-- User image -->
		                <img class="img-circle img-sm" src="/JTalk/dist/img/tree.png" alt="User Image">
		
		                <div class="comment-text">
		                      <span class="username">
		                        J-Talk 대나무숲
		                        <span class="pull-right">
		                        <c:if test="${member.active ge 2}">
			                        <span class="margin-right-left"><a class="color-black" onclick=" anonycommentdelete(this, '<c:out value="${item2.num}"/>')" style="cursor:pointer;"><i class="fa fa-trash"></i></a></span>
		                        </c:if>                   
		                        <fmt:formatDate var="date" value="${item2.writeDate}" pattern="yyyy-MM-dd HH:mm:ss" />
		                        <span class="text-muted"><c:out value="${date}"/></span>
		                        </span>
		                      </span><!-- /.username -->
		                  <span>
			                  <span class="comment-in"><c:out value="${item2.content}"/></span>
		                  </span>
		                </div>
		                <!-- /.comment-text -->
	              </div>
	              </c:forEach>
              </c:if>
	              <form onsubmit="return anonycomment(this);">
	                <img class="img-responsive img-circle img-sm" src="/JTalk/dist/img/tree.png" alt="Alt Text">
	                <!-- .img-push is used to add margin to elements next to floating images -->
	                <div class="img-push input-group">
	                  <input type="hidden" name = "tableName" value = "anony"/>
	                  <input type="hidden" name = "postNum" value = "<c:out value="${item.num}"/>"/>
	                  <input type="text"  name = "content" class="form-control input-sm" placeholder="댓글을 입력해주세요." required>
	                  <span class="input-group-btn">
	                      <button type="submit" class="btn btn-sm btn-primary btn-flat"><i class="fa fa-pencil"></i> 댓글 등록</button>
	                    </span>
	                </div>
	              </form>
		          </div>
	          </div>
	          </c:forEach>
                </c:if>
	          <!--/.게시글 하나 -->
	          </div> <!-- // 컨텐츠 영역 -->
	          <div id = "loading" class="overlay text-center" style="font-size:30px;">
	             <i class="fa fa-refresh fa-spin"></i>
	           </div>
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
<jsp:include page="../modal.jsp"/>
<!-- /.modal -->
<script src="/JTalk/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/JTalk/bower_components/jquery-ui/jquery-ui.min.js"></script>
<script src="/JTalk/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="/JTalk/dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/JTalk/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/JTalk/dist/js/demo.js"></script>
<script src="/JTalk/dist/js/utils.js"></script>
<script src="/JTalk/bower_components/summernote/dist/summernote.js"></script>
<script src="/JTalk/bower_components/summernote/dist/lang/summernote-ko-KR.js"></script>
<script src="/JTalk/bower_components/summernote/dist/emoticons.js"></script>
<script src="/JTalk/dist/js/tree.js"></script>
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
</script>
</body>
</html>