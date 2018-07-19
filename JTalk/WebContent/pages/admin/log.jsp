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
<body class="<c:out value="${body_admin}"/>">
<div class="wrapper">
  <jsp:include page="adminHeader.jsp"/>
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
        <i class="fa fa-code-fork "></i> 로그 
        <small>게시글 삭제 이력를 확인 할 수 있습니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="javascript:actionlink('admin.action?command=main');"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">로그</li>
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
                  <th style="width: 12%;">분류</th>
                  <th>게시글 제목</th>
                  <th style="width: 13%;">작업자</th>
                  <th style="width: 20%;">삭제일시</th>
                </tr>
                <c:if test="${empty currentList}">
                	<c:if test="${empty search}">
	                	<td colspan="5" align="center">로그가 없습니다.</td>
	                </c:if>
	                <c:if test="${not empty search}">
	                	<td colspan="5" align="center">검색결과가 없습니다.</td>
	                </c:if>
                </c:if>
                <c:if test="${not empty currentList}">
                	<jsp:useBean id="now" class="java.util.Date" />
                	<c:forEach var="item" items="${currentList}" varStatus="status">
                		<tr class="table-field">
		                  <td><c:out value="${item.board}"/></td>
		                  <td class="td-title">
							<a href="javascript:void(0)" onclick="msgdetail(this)" detail="0">${item.title}</a>      
		                  </td>
		                  <td><a href="javascript:showmember('<c:out value="${item.deleteId}"/>')"><c:out value="${item.deleteName}"/></a></td>
		                  <td>
		                  	<fmt:formatDate value="${item.executeDate}" pattern="yyyy-MM-dd HH:mm:ss" var="executeDate" /> 
		                  	<c:out value="${executeDate}"/>
		                  </td>
		                </tr>
		                <tr style="display:none;">
                        		<td colspan="4">
                        			<div class="message-detail">
						                <p><i class="fa fa-pencil"></i> <a href="javascript:showmember('<c:out value="${item.writerId}"/>')"><c:out value="${item.writerName}"/></a></p>
						                <div>
						                	<c:out value="${item.content}"/>
						                </div>
						              </div>
                        		</td>
                        	</tr> 
                	</c:forEach>
                </c:if>
              </table>
              <table class="table table-condensed table-hover table-xd">
              	<tr class="table-field">
                  <th>게시글 제목</th>
                  <th style="width: 18%;">작업자</th>
                  <th style="width: 20%;">삭제일시</th>
                </tr>
                <c:if test="${empty currentList}">
                	<c:if test="${empty search}">
	                	<td colspan="3" align="center">로그가 없습니다.</td>
	                </c:if>
	                <c:if test="${not empty search}">
	                	<td colspan="3" align="center">검색결과가 없습니다.</td>
	                </c:if>
                </c:if>
                <c:if test="${not empty currentList}">
                	<c:forEach var="item" items="${currentList}">
                		<tr class="table-field">
		                  <td class="td-title none-text-indent table-td-vline-origin">
		                  	  <a a href="javascript:void(0)" onclick="msgdetail(this)" detail="0"><c:out value="${item.title}"/></a>
		                  </td>
		                  <td class="table-td-vline"><a href="javascript:showmember('<c:out value="${item.deleteId}"/>')"><c:out value="${item.deleteName}"/></a></td>
		                  <td class="table-td-vline">
							 <fmt:formatDate var="executeDate" value="${item.executeDate}" pattern="yy-MM-dd HH:mm" />
			                  <c:out value="${executeDate}"/>
		                  </td>
		                </tr>
		                <tr style="display:none;">
                        		<td colspan="3">
                        			<div class="message-detail">
						                <p><i class="fa fa-pencil"></i> <a href="javascript:showmember('<c:out value="${item.writerId}"/>')"><c:out value="${item.writerName}"/></a></p>
						                <div>
						                	<c:out value="${item.content}"/>
						                </div>
						              </div>
                        		</td>
                        	</tr>
                	</c:forEach>
                </c:if>
              </table>
              </div>
              <div class="col-md-12">
              <div class="text-right table-bottom">
              	<form action = "/JTalk/admin.action?command=log" method="post">
              	<div class="col-md-3 col-xs-12 no-padding mobile-center">
              		<c:if test="${not empty search}">
              			<div id="searchbar"class="input-group" toggle="1" style="display:inline-table;">
	                    <input type="text" class="form-control" placeholder="검색어를 입력해주세요." value="${fn:escapeXml(search)}" name="search" required>
	                    <span class="input-group-btn">
	                        <button class="btn btn-default" type="submit">
	                            <i class="glyphicon glyphicon-search"></i>
	                        </button>
	                    </span>
	                </div>
              		</c:if>
              		<c:if test="${empty search}">
	                <div id="searchbar"class="input-group" toggle="0" style="display:none;">
	                    <input type="text" class="form-control" placeholder="검색어를 입력해주세요." value="${fn:escapeXml(search)}" name="search" required>
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
                		<button type="button" class="btn btn-default" onclick="actionlink('admin.action?command=log');"><i class="fa fa-list"></i> 목록</button>
                	</c:if>
              	</div>
              </div>
              <div class="col-md-12 text-center" style="display:inline-block; width:100%">
              	<form action="/JTalk/admin.action?command=log" method="post" id="pagination-form">
              		<ul id="pagination" class="pagination-sm"></ul>
              		<input id = "pagination-page" type="hidden" name="currentPage" value="${fn:escapeXml(currentPage)}">
              		<input type="hidden" name="search" value="${fn:escapeXml(search)}">
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
  <!-- /.content-wrapper -->

  <jsp:include page="../footer.jsp"/>
  
</div>
<div id="actionpost"></div>
<!-- modal -->
<jsp:include page="../modal.jsp"/>
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