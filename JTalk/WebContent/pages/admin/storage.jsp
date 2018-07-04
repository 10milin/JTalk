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
		                  <td><c:out value="${board_name}"/></td>
		                  <td><c:out value="${item.table_name}"/></td>
		                  <td><c:out value="${item.table_rows}"/></td>
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
		                  <td class="table-td-vline-origin"><c:out value="${board_name}"/></td>
		                  <td class="table-td-vline-origin"><c:out value="${item.table_name}"/></td>
		                  <td class="table-td-vline-origin"><c:out value="${item.table_rows}"/></td>
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