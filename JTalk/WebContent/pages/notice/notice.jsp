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
        <i class="fa fa-bullhorn "></i> 공지사항
        <small>J-Talk에서 알려드립니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="javascript:actionlink('index.action');"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">공지사항</li>
      </ol>
    </section>
    <section class="content">
	    <div class="row">
	    	<div class="col-md-12">
	    	<div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title font-bareun"><i class="fa fa-list"></i> 글 목록</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body box-body-padding">
            	<div class="col-md-12">
              <table class="table table-condensed table-hover table-md">
                <tr class="table-field">
                  <th style="width: 50px;">번호</th>
                  <th>제목</th>
                  <th style="width: 10%;">글쓴이</th>
                  <th style="width: 13%;">작성일</th>
                  <th style="width: 9%;">조회수</th>
                </tr>
                <c:if test="${empty currentList}">
                	<c:if test="${empty search}">
	                	<td colspan="5" align="center">등록된 게시글이 없습니다.</td>
	                </c:if>
	                <c:if test="${not empty search}">
	                	<td colspan="5" align="center">검색결과가 없습니다.</td>
	                </c:if>
                </c:if>
                <c:if test="${not empty currentList}">
                	<jsp:useBean id="now" class="java.util.Date" />
                	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
                	<c:forEach var="item" items="${currentList}" varStatus="status">
                		<tr class="table-field">
		                  <td>${item.num}</td>
		                  <td class="td-title">
		                  	  <a class="atag-black" href="javascript:actionparam('notice.action?command=detail', '${item.num}')">${item.title}</a>
			                  <i class="fa fa-commenting-o"></i> ${countList.get(status.index)}
							  <fmt:formatDate value="${item.writeDate}" pattern="yyyy-MM-dd" var="write_dt"/>
							  <c:if test="${today == write_dt}">
			                  	<small class="label bg-green" style="margin-left:5px;">new</small>
			                  </c:if>
		                  </td>
		                  <td>${item.writerName}</td>
		                  <td>
		                  <c:if test="${today == write_dt}">
			                  	<fmt:formatDate var="fmtDate" value="${item.writeDate}" pattern="HH:mm" />
			              </c:if>
			              <c:if test="${today != write_dt}">
			                  	<fmt:formatDate var="fmtDate" value="${item.writeDate}" pattern="yyyy-MM-dd" />
			              </c:if>
		                  ${fmtDate}
		                  </td>
		                  <td>${item.hit}</td>
		                </tr>
                	</c:forEach>
                </c:if>
              </table>
              <table class="table table-condensed table-hover table-xd">
              	<tr class="table-field">
                  <th>제목</th>
                  <th style="width: 18%;">글쓴이</th>
                  <th style="width: 20%;">작성일</th>
                </tr>
                <c:if test="${empty currentList}">
                	<c:if test="${empty search}">
	                	<td colspan="3" align="center">등록된 게시글이 없습니다.</td>
	                </c:if>
	                <c:if test="${not empty search}">
	                	<td colspan="3" align="center">검색결과가 없습니다.</td>
	                </c:if>
                </c:if>
                <c:if test="${not empty currentList}">
                	<c:forEach var="item" items="${currentList}">
                		<tr class="table-field">
		                  <td class="td-title none-text-indent">
		                  	  <a class="atag-black" href="javascript:actionparam('notice.action?command=detail', '${item.num}')">${item.title}</a>
			                  <i class="fa fa-commenting-o"></i> ${countList.get(status.index)}
							  <fmt:formatDate value="${item.writeDate}" pattern="yyyy-MM-dd" var="write_dt"/>
							  <c:if test="${today == write_dt}">
			                  	<small class="label bg-green" style="margin-left:5px;">new</small>
			                  </c:if>
		                  </td>
		                  <td class="table-td-vline">${item.writerName}</td>
		                  <td class="table-td-vline">
		                  	<c:if test="${today == write_dt}">
			                  	<fmt:formatDate var="fmtDate" value="${item.writeDate}" pattern="HH:mm" />
				            </c:if>
				            <c:if test="${today != write_dt}">
				                 <fmt:formatDate var="fmtDate" value="${item.writeDate}" pattern="yy-MM-dd" />
				            </c:if>
			                  ${fmtDate}
		                  </td>
		                </tr>
                	</c:forEach>
                </c:if>
              </table>
              </div>
              <div class="col-md-12">
              <div class="text-right table-bottom">
              	<form action = "/JTalk/notice.action?command=notice" method="post">
              	<div class="col-md-3 col-xs-12 no-padding mobile-center">
              		<c:if test="${not empty search}">
              			<div id="searchbar"class="input-group" toggle="1" style="display:inline-table;">
	                    <input type="text" class="form-control" placeholder="검색어를 입력해주세요." value="${search}" name="search" required>
	                    <span class="input-group-btn">
	                        <button class="btn btn-default" type="submit">
	                            <i class="glyphicon glyphicon-search"></i>
	                        </button>
	                    </span>
	                </div>
              		</c:if>
              		<c:if test="${empty search}">
	                <div id="searchbar"class="input-group" toggle="0" style="display:none;">
	                    <input type="text" class="form-control" placeholder="검색어를 입력해주세요." value="${search}" name="search" required>
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
                		<button type="button" class="btn btn-default" onclick="actionlink('notice.action?command=notice');"><i class="fa fa-list"></i> 목록</button>
                	</c:if>
                	<c:if test="${member.active ge 2}">
                		<button type="button" class="btn btn-default" onclick="actionlink('notice.action?command=writeform');"><i class="fa fa-edit"></i> 쓰기</button>
                	</c:if>
	              	
              	</div>
              </div>
              <div class="col-md-12 text-center" style="display:inline-block; width:100%">
              	<form action="/JTalk/notice.action?command=notice" method="post" id="pagination-form">
              		<ul id="pagination" class="pagination-sm"></ul>
              		<input id = "pagination-page" type="hidden" name="currentPage" value="${currentPage}">
              		<input type="hidden" name="search" value="${search}">
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
<script src="/JTalk/dist/js/utils.js"></script>
<script src="/JTalk/dist/js/adminlte.min.js"></script>
<script>
  pagination(${totalPage},${currentPage});
</script>
</body>
</html>