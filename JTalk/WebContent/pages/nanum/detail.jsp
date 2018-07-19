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
  <!-- litebox2-master -->
  <link rel="stylesheet" href="/JTalk/bower_components/lightbox2-master/dist/css/lightbox.min.css">
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
        <i class="fa fa fa-heart"></i> 행복나눔
        <small>버리기 귀찮은 물건, 이제 후배에게 양보하세요.</small>
      </h1>
      <ol class="breadcrumb">
       <li><a href="javascript:actionlink('index.action');"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">행복나눔</li>
      </ol>
    </section>
    <section class="content">
	    <div class="row">
	    	<div class="col-md-12">
	    	<div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title font-bareun"><i class="fa fa-file-text-o"></i> 상세 보기</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body box-body-padding">
            <div class="col-md-12">
            	<table class="table table-condensed table-hover">
                <tr class="table-field board-headline">
                  <th>
                  	${nanum.title}
                  	<c:if test="${nanum.isSoldout eq '0'}">
			          <small class="label bg-blue" style="margin-left:5px;">진행중</small>
			         </c:if>
			         <c:if test="${nanum.isSoldout eq '1'}">
			         	<small class="label bg-red" style="margin-left:5px;">마감</small>
			         </c:if> 
                  </th>
                </tr>
                <tr class="board-content board-white">
                	<td>
                		<i class="fa fa-user"></i> <a href="javascript:showmember('${nanum.writerID}')">${nanum.writerName}</a><span style="margin:0 10px;"></span>
                		<fmt:formatDate var="date" value="${nanum.writeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                		<i class="fa fa-clock-o"></i> ${date}<span style="margin:0 10px;"></span>
                		<i class="fa fa-eye"></i> ${nanum.hit}
                	</td>
                </tr>
                <tr class="board-white">
                	<td>
                		<div class="moreinformation">
                			<c:if test="${nanum.isSoldout eq '0'}">
					          <c:set var="phone" value="${nanum.phone}"></c:set>
					         </c:if>
					         <c:if test="${nanum.isSoldout eq '1'}">
					         	<c:set var="phone" value="***"></c:set>
					         </c:if> 
                			<i class="glyphicon glyphicon-earphone" style="width:14px; height:16px;"></i> 연락처 ${phone}<br>
                			<div class="text-center marginbt"><a class="example-image-link" href="/JTalk/upload/${nanum.photo}" data-lightbox="example-1"><img class="example-image img-thumbnail img-responsive" src="/JTalk/upload/${nanum.photo}" alt="image-1" width="300px"/></a></div>
                			<c:if test="${nanum.writerID == member.email}">
					              	<div class="col-md-12 text-center marginbt">
					              		<c:if test="${nanum.isSoldout eq '0'}">
					              			<button type="button" class="btn btn-sm btn-danger" onclick="actionparam('nanum.action?command=soldout',${nanum.num});"><i class="fa fa-check-square-o"></i> 판매 완료</button>
					              		</c:if>
					              		<c:if test="${nanum.isSoldout eq '1'}">
					              			<button type="button" class="btn btn-sm btn-primary" onclick="actionparam('nanum.action?command=resold',${nanum.num});"><i class="fa fa-refresh"></i> 판매 재개</button>
					              		</c:if>
					              	</div>
				              	</c:if>
                		</div>
                	</td>
                </tr>
                <tr class="board-white">
                	<td>
                		<div>${nanum.content}</div>
                	</td>
                </tr>
                <tr class="board-white">
                	<td class="border-none-top">
                		<a class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> 댓글
                        (${countComment})</a>
                	</td>
                </tr>
              </table>
              <div class="table-bottom box-comments" style="padding:10px;">
              <!-- /.유저 한명의 코멘트 -->
              <c:if test="${empty commentList}">
              	<div class="box-comment">등록된 댓글이 없습니다.</div>
              </c:if>
              <c:if test="${not empty commentList}">
	              <c:forEach var="item" items="${commentList}" varStatus="status">
	              	<div class="box-comment">
	                	<!-- User image -->
		                <img class="img-circle img-sm" src="/JTalk/upload/${profileList.get(status.index)}" alt="User Image">
		
		                <div class="comment-text">
		                      <span class="username">
		                        <a href="javascript:showmember('${item.writerId}')">${item.writerName}</a>
		                        <span class="pull-right">
		                        <c:if test="${item.writerId eq member.email}">
			                        <span class="margin-right-left"><a class="color-black" onclick="editstart(this);" style="cursor:pointer;"><i class="fa fa-pencil"></i></a></span>
		                        </c:if>
		                        <c:if test="${item.writerId eq member.email || member.active ge 2}">
			                        <span class="margin-right-left"><a class="color-black" onclick="actioncmtdelete('comment.action?command=delete', 'trade',${item.num});" style="cursor:pointer;"><i class="fa fa-trash"></i></a></span>
		                        </c:if>                   
		                        <fmt:formatDate var="date" value="${item.writeDate}" pattern="yyyy-MM-dd HH:mm:ss" />
		                        <span class="text-muted">${date}</span>
		                        </span>
		                      </span><!-- /.username -->
		                  <span>
		                  <form class="cmt" method = "post" onsubmit="return false">
		                  <div class="input-group" style="display:none;">
		                  	<input type = "hidden" name = "num" value = "${item.num}"/>
			                  <input type="text" name = "content" class="form-control input-sm comment-edit" placeholder="수정할 내용을 입력해주세요.">
			                  <span class="input-group-btn">
			                      <button type="button" class="btn btn-sm btn-default btn-flat comment-edit-btn"><i class="fa fa-pencil"></i> 수정</button>
			                    </span>
		                	</div>
			               </form>
			                  <span class="comment-in">${item.content}</span>
		                  </span>
		                </div>
		                <!-- /.comment-text -->
	              </div>
	              </c:forEach>
              </c:if>
              <!-- /.유저 한명의 코멘트 -->
              <form action="/JTalk/comment.action?command=write" method="post">
                <img class="img-responsive img-circle img-sm" src="/JTalk/upload/${member.profile}" alt="Alt Text">
                <!-- .img-push is used to add margin to elements next to floating images -->
                <div class="img-push input-group">
                  <input type="hidden" name = "tableName" value = "nanum"/>
                  <input type="hidden" name = "postNum" value = "${nanum.num}"/>
                  <input type="hidden" name = "writerId" value = "${member.email}"/>
                  <input type="hidden" name = "writerName" value = "${member.name}"/>
                  <input type="text"  name = "content" class="form-control input-sm" placeholder="댓글을 입력해주세요." required>
                  <span class="input-group-btn">
                      <button type="submit" class="btn btn-sm btn-primary btn-flat"><i class="fa fa-pencil"></i> 댓글 등록</button>
                    </span>
                </div>
              </form>
              </div>
              <br>
              <div class="text-right">
              	<button type="button" class="btn btn-default" onclick="actionlink('nanum.action?command=nanum');"><i class="fa fa-list"></i> 목록</button>
              	<c:if test="${member.email == nanum.writerID}">
              		<button type="button" class="btn btn-default" onclick="actionparam('nanum.action?command=modifyform',${nanum.num});"><i class="fa fa-pencil"></i> 수정</button>
              	</c:if>
              	<c:if test="${member.active ge 2 || member.email == nanum.writerID}">
	              	<button type="button" class="btn btn-default" onclick="actionparam('nanum.action?command=delete',${nanum.num});"><i class="fa fa-trash"></i> 삭제</button>
              	</c:if>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          </div>
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
<script src="/JTalk/dist/js/utils.js"></script>
<script src="/JTalk/dist/js/adminlte.min.js"></script>
<script src="/JTalk/bower_components/lightbox2-master/dist/js/lightbox-plus-jquery.min.js"></script>
</body>
</html>