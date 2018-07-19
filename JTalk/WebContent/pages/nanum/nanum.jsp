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
  <!-- Theme style -->
  <link rel="stylesheet" href="/JTalk/dist/css/AdminLTE.css">
  <link rel="stylesheet" href="/JTalk/dist/css/skins/_all-skins.css">
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
              <h3 class="box-title font-bareun"><i class="fa fa-th"></i> 상품 목록</h3>
            </div>
            <!-- /.box-header -->
            <c:if test="${empty currentList}">
                	<c:if test="${empty search}">
	                	<div class="col-md-12 text-center trademsg">등록된 게시글이 없습니다.</div>
	                </c:if>
	                <c:if test="${not empty search}">
	                	<div class="col-md-12 text-center trademsg">검색결과가 없습니다.</div>
	                </c:if>
                </c:if>
            
            <div class="box-body box-body-padding">
            	<c:if test="${not empty currentList}">
            	<div class="col-md-12 no-padding">
            	<jsp:useBean id="now" class="java.util.Date" />
                	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
                	<c:forEach var="item" items="${currentList}" varStatus="status">
		                	<c:if test="${status.index%3 eq 0}">
		                		<div class="col-md-12 no-padding">
		                	</c:if>
			           		<div class="col-md-4">
					            <div class="product-item">
					              <div class="pi-img-wrapper">
					                <img src="/JTalk/upload/${item.originphoto}" class="img-responsive" alt="${item.title}">
				                	<c:if test="${item.isSoldout eq '0'}">
				                		<div>
					                	<h2 class="pi-msg" onclick="showmember('${item.writerID}')"><i class="fa fa-user"></i> ${item.writerName}</h2>
					                	<fmt:formatDate value="${item.writeDate}" pattern="yyyy-MM-dd HH:ss" var="write_format" />
					                	<h3 class="pi-msg2">
					                		<i class="fa fa-clock-o"></i> ${write_format} 
					                		<i class="fa fa-commenting-o"></i> ${countList.get(status.index)} 
					                		<i class="fa fa-eye"></i> ${item.hit}
					                	</h3>
					                	</div>
				                	</c:if>
					                <c:if test="${item.isSoldout eq '1'}">
				                		<div class="soldout">
								          <a class="btn soldout-btn">나눔 마감</a>
						                </div>
				                	</c:if>
					              </div>
					              <h3 class="product-title-over"><a href="javascript:actionparam('nanum.action?command=detail', '${item.num}')">${item.title}</a></h3>
					              
					              <div class="pi-price">
					              	￦<fmt:formatNumber value="${item.price}" pattern="#,###" />
					              </div>
					              <a href="javascript:actionparam('nanum.action?command=detail', '${item.num}')" class="btn add2cart">상세보기</a>
					              <fmt:formatDate value="${item.writeDate}" pattern="yyyy-MM-dd" var="write_dt"/>
					              <c:if test="${today == write_dt}">
					              	<div class="sticker sticker-new"></div>
					              </c:if>
					            </div>
					        </div>
					        <c:if test="${status.index%3 eq 2}">
		                		</div>
		                	</c:if>
		        		</c:forEach>
		        		</div>
		        	</c:if>
		        <div class="col-md-12">
              <div class="text-right table-bottom">
              	<form action = "/JTalk/nanum.action?command=nanum" method="post">
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
                		<button type="button" class="btn btn-default" onclick="actionlink('nanum.action?command=nanum');"><i class="fa fa-list"></i> 목록</button>
                	</c:if>
                	<button type="button" class="btn btn-default" onclick="actionlink('nanum.action?command=writeForm');"><i class="fa fa-edit"></i> 등록</button>
              	</div>
              </div>
              <div class="col-md-12 text-center" style="display:inline-block; width:100%">
              	<form action="/JTalk/nanum.action?command=nanum" method="post" id="pagination-form">
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
  <!-- /.content-wrapper -->

  <jsp:include page="../footer.jsp"/>
  
</div>
<div id="actionpost"></div>
<!-- modal -->
<jsp:include page="../modal.jsp"/>
<!-- /.modal -->
<script src="/JTalk/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/JTalk/bower_components/jquery-ui/jquery-ui.min.js"></script>
<script src="/JTalk/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src ="/JTalk/bower_components/pagination/jquery.twbsPagination.js"></script>
<script src="/JTalk/dist/js/utils.js"></script>
<script src="/JTalk/dist/js/adminlte.min.js"></script>
<script>
  pagination(${totalPage},${currentPage});
</script>
</body>
</html>