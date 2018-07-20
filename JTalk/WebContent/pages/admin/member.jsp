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
        <i class="fa fa-group "></i> 회원정보 
        <small>회원정보를 확인하고 변경할 수 있습니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="javascript:actionlink('admin.action?command=main');"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">회원정보</li>
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
                  <th style="width: 80px;">기수</th>
                  <th style="width: 20%;">성명</th>
                  <th style="width: 30%;">이메일</th>
                  <th style="width: 15%;">계정상태</th>
                  <th>가입일</th>
                </tr>
                <c:if test="${empty currentList}">
                	<c:if test="${empty search}">
	                	<td colspan="5" align="center">회원이 존재하지 않습니다.</td>
	                </c:if>
	                <c:if test="${not empty search}">
	                	<td colspan="5" align="center">검색결과가 없습니다.</td>
	                </c:if>
                </c:if>
                <c:if test="${not empty currentList}">
                	<jsp:useBean id="now" class="java.util.Date" />
                	<c:forEach var="item" items="${currentList}" varStatus="status">
                		<tr class="table-field" onclick="javascript:showmember('<c:out value="${item.email}"/>')" style="cursor:pointer;">
		                  <td><c:out value="${item.period}"/></td>
		                  <td><c:out value="${item.name}"/></td>
		                  <td><c:out value="${item.email}"/></td>
		                  <td>
		                  	<c:choose>
			                  	<c:when test="${item.active eq 0}">
			                  		이메일 미인증
			                  	</c:when>
			                  	<c:when test="${item.active eq 1 && item.ban eq 0}">
			                  		정상
			                  	</c:when>
			                  	<c:when test="${item.active eq 1 && item.ban eq 1}">
			                  		<font color="red">정지</font>
			                  	</c:when>
		                  	</c:choose>
		                  </td>
		                  <td>
		                  	<fmt:formatDate value="${item.registerDate}" pattern="yyyy-MM-dd HH:mm:ss" var="registerDate" /> 
		                  	<c:out value="${registerDate}"/>
		                  </td>
		                </tr>
                	</c:forEach>
                </c:if>
              </table>
              <table class="table table-condensed table-hover table-xd">
              	<tr class="table-field">
                  <th style="width: 15%;">기수</th>
                  <th style="width: 25%;">이름</th>
                  <th style="width: 30%;">계정상태</th>
                  <th>가입일</th>
                </tr>
                <c:if test="${empty currentList}">
                	<c:if test="${empty search}">
	                	<td colspan="4" align="center">회원이 존재하지 않습니다.</td>
	                </c:if>
	                <c:if test="${not empty search}">
	                	<td colspan="4" align="center">검색결과가 없습니다.</td>
	                </c:if>
                </c:if>
                <c:if test="${not empty currentList}">
                	<c:forEach var="item" items="${currentList}">
                		<tr class="table-field" onclick="javascript:showmember('<c:out value="${item.email}"/>')" style="cursor:pointer;">
		                  <td class="table-td-vline-origin">
							<c:out value="${item.period}"/>
		                  </td>
		                  <td class="table-td-vline-origin">
		                    <c:out value="${item.name}"/>
		                  </td>
		                  <td>
		                  	<c:choose>
			                  	<c:when test="${item.active eq 0}">
			                  		이메일 미인증
			                  	</c:when>
			                  	<c:when test="${item.active eq 1 && item.ban eq 0}">
			                  		정상
			                  	</c:when>
			                  	<c:when test="${item.active eq 1 && item.ban eq 1}">
			                  		<font color="red">정지</font>
			                  	</c:when>
		                  	</c:choose>
		                  </td>
		                  <td class="table-td-vline">
							 <fmt:formatDate value="${item.registerDate}" pattern="yy-MM-dd HH:mm" var="registerDate" /> 
		                  	<c:out value="${registerDate}"/>
		                  </td>
		                </tr>
                	</c:forEach>
                </c:if>
              </table>
              </div>
              <div class="col-md-12">
              <div class="text-right table-bottom">
              	<form action = "/JTalk/admin.action?command=member" method="post">
              	<div class="col-md-3 col-xs-12 no-padding mobile-center">
              		<c:if test="${not empty search}">
              			<div id="searchbar"class="input-group" toggle="1" style="display:inline-table;">
	                    <input type="text" class="form-control" placeholder="이름으로 검색하기" value="<c:out value="${search}"/>" name="search" required>
	                    <span class="input-group-btn">
	                        <button class="btn btn-default" type="submit">
	                            <i class="glyphicon glyphicon-search"></i>
	                        </button>
	                    </span>
	                </div>
              		</c:if>
              		<c:if test="${empty search}">
	                <div id="searchbar"class="input-group" toggle="0" style="display:none;">
	                    <input type="text" class="form-control" placeholder="이름으로 검색하기" value="<c:out value="${search}"/>" name="search" required>
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
              			<button type="button" class="btn btn-default" onclick="actionlink('admin.action?command=member');"><i class="glyphicon glyphicon-refresh"></i> 새로고침</button>
                	</c:if>
                	<c:if test="${not empty search}">
                		<button type="button" class="btn btn-default" onclick="searchbar(this);"><i class="glyphicon glyphicon-search"></i> 검색</button>
                		<button type="button" class="btn btn-default" onclick="actionlink('admin.action?command=member');"><i class="glyphicon glyphicon-refresh"></i> 새로고침</button>
                	</c:if>
              	</div>
              </div>
              <div class="col-md-12 text-center" style="display:inline-block; width:100%">
              	<form action="/JTalk/admin.action?command=member" method="post" id="pagination-form">
              		<ul id="pagination" class="pagination-sm"></ul>
              		<input id = "pagination-page" type="hidden" name="currentPage" value="<c:out value="${currentPage}"/>">
              		<input type="hidden" name="search" value="<c:out value="${search}"/>">
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