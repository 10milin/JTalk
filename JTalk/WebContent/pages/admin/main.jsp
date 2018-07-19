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
        <i class="fa fa-dashboard "></i> 시스템 개요
        <small>J-Talk 어플리케이션의 상태 정보를 제공합니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li class="active"><i class="fa fa-home"></i> Home</li>
      </ol>
    </section>
    <section class="content">
	    <div class="row">
			<div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><c:out value="${memberCount}"/></h3>

              <p class="font-bareun">회원 수</p>
            </div>
            <div class="icon">
              <i class="ion ion-android-people"></i>
            </div>
            <a href="javascript:actionlink('admin.action?command=member');" class="small-box-footer font-bareun">자세히 보기 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><c:out value="${memberAdminCount}"/></h3>

              <p class="font-bareun">관리자 수</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="javascript:actionlink('admin.action?command=admin');" class="small-box-footer font-bareun">자세히 보기 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><c:out value="${logCount}"/></h3>

              <p class="font-bareun">로그 수</p>
            </div>
            <div class="icon">
              <i class="ion-fork-repo"></i>
            </div>
            <a href="javascript:actionlink('admin.action?command=log');" class="small-box-footer font-bareun">자세히 보기 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3><fmt:formatNumber value="${dbCapacity}" pattern="0"/><sup style="font-size: 20px">MB</sup></h3>

              <p class="font-bareun">DB 용량</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="javascript:actionlink('admin.action?command=storage');" class="small-box-footer font-bareun">자세히 보기 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-md-12 col-xs-12">
        	<div class="box box-danger">
            <div class="box-header with-border">
              <h3 class="box-title font-bareun"><i class="fa fa-info-circle"></i> 정보마당</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body">
            	<div class="col-md-6">
            		<p class="text-center">
                    <strong>정보마당 전체 게시글 비율</strong>
                  </p>
            		<canvas id="pieChart" style="height:250px"></canvas>
            	</div>
	           	<div class="col-md-6">
                  <p class="text-center">
                    <strong>게시판별 게시글 수</strong>
                  </p>
                  
				  <div class="progress-group">
                    <span class="progress-text">IT</span>
                    <span class="progress-number"><b id="ItSize"><c:out value="${ItSize}"/></b>/<c:out value="${InforSize}"/></span>

                    <div class="progress sm">
                      <fmt:formatNumber var="per" value="${ItSize/InforSize}" type="percent"/>
                      <div class="progress-bar progress-bar-red" style="width: <c:out value="${per}"/>"></div>
                    </div>
                  </div>
                  <!-- /.progress-group -->
                  <div class="progress-group">
                    <span class="progress-text">일본어</span>
                    <span class="progress-number"><b id="JapaneseSize"><c:out value="${JapaneseSize}"/></b>/<c:out value="${InforSize}"/></span>

                    <div class="progress sm">
                      <fmt:formatNumber var="per" value="${JapaneseSize/InforSize}" type="percent"/>
                      <div class="progress-bar progress-bar-green" style="width: <c:out value="${per}"/>"></div>
                    </div>
                  </div>
                  <!-- /.progress-group -->
                  <div class="progress-group">
                    <span class="progress-text">주변맛집</span>
                    <span class="progress-number"><b id="FoodSize"><c:out value="${FoodSize}"/></b>/<c:out value="${InforSize}"/></span>

                    <div class="progress sm">
                      <fmt:formatNumber var="per" value="${FoodSize/InforSize}" type="percent"/>
                      <div class="progress-bar progress-bar-yellow" style="width: <c:out value="${per}"/>"></div>
                    </div>
                  </div>
                  <!-- /.progress-group -->
                  <div class="progress-group">
                    <span class="progress-text">생활정보</span>
                    <span class="progress-number"><b id="LifeSize"><c:out value="${LifeSize}"/></b>/<c:out value="${InforSize}"/></span>

                    <div class="progress sm">
                      <fmt:formatNumber var="per" value="${LifeSize/InforSize}" type="percent"/>
                      <div class="progress-bar progress-bar-aqua" style="width: <c:out value="${per}"/>"></div>
                    </div>
                  </div>
                  <!-- /.progress-group -->
                </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
              <div class="row">
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block border-right">
                  	<h4 class="font-bareun">IT</h4>
                    <span class="badge bg-red">NEW <c:out value="${ItNew}"/></span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block border-right">
                  	<h4 class="font-bareun">일본어</h4>
                    <span class="badge bg-green">NEW <c:out value="${JapaneseNew}"/></span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block border-right">
                    <h4 class="font-bareun">주변맛집</h4>
                    <span class="badge bg-yellow">NEW <c:out value="${FoodNew}"/></span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block">
                    <h4 class="font-bareun">생활정보</h4>
                    <span class="badge bg-aqua">NEW <c:out value="${LifeNew}"/></span>
                  </div>
                  <!-- /.description-block -->
                </div>
              </div>
              <!-- /.row -->
            </div>
          </div>
        </div>
        <div class="col-md-12 col-xs-12 no-padding">
        	<div class="col-md-8 padding-right">
        		<div class="box box-danger">
	                <div class="box-header with-border">
	                  <h3 class="box-title font-bareun"><i class="fa fa-code-fork"></i> 로그</h3>
	                  <div class="box-tools pull-right">
	                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	                  </div>
	                </div>
	                <!-- /.box-header -->
	                <div class="box-body" style="padding-top:0px;">
	                	<c:if test="${empty newLog}">
					      로그가 존재하지 않습니다.
				         </c:if>
				    <c:if test="${not empty newLog}">
	                	<table class="table table-hover table-condensed">
			              	<tbody>
				                <c:forEach var="item" items="${newLog}">
				                	<tr>
										<td style="width:20%; text-align: center;"><c:out value="${item.board}"/></td>
										<td class="td-overflow" style="max-width:1px;"><c:out value="${item.title}"/></td>
										<td style="width:15%; text-align: center;"><c:out value="${item.deleteName}"/></td>
										<fmt:formatDate var="executeDate" value="${item.executeDate}" pattern="yy-MM-dd HH:mm" />
										<td style="width:30%; text-align: center;"><c:out value="${executeDate}"/></td>
									</tr>
								</c:forEach>
			              	</tbody>
	              		   </table>
		          </c:if>
                </div>
	          </div>
        	</div>
	        <div class="col-md-4">
	              <!-- USERS LIST -->
	              <div class="box box-danger">
	                <div class="box-header with-border">
	                  <h3 class="box-title font-bareun"><i class="fa fa-group"></i> 최근에 가입한 회원</h3>
	                  <div class="box-tools pull-right">
	                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	                  </div>
	                </div>
	                <!-- /.box-header -->
	                <div class="box-body no-padding">
	                  <ul class="users-list clearfix">
	                    <c:if test="${empty newMember}">
	                    	<li style="width: 100% !important; text-align: left !important;">
	                    		최근에 가입한 회원이 없습니다.
	                    	</li>
	                    </c:if>
	                  	<c:if test="${not empty newMember}">
	                  		<c:forEach var="item" items="${newMember}">
	                  			<li>
			                      <img class="user-img" src="/JTalk/upload/<c:out value="${item.profile}"/>" alt="User Image" width="128px">
			                      <a class="users-list-name" href="javascript:showmember('<c:out value="${item.email}"/>')"><c:out value="${item.name}"/></a>
			                      <span class="users-list-date"><c:out value="${item.period}"/> 기</span>
			                    </li>
	                  		</c:forEach>
	                  	</c:if>
	                  </ul>
	                  <!-- /.users-list -->
	                </div>
	              </div>
	              <!--/.box -->
	            </div>
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
<script src="/JTalk/dist/js/adminlte.min.js"></script>
<script src="/JTalk/dist/js/utils.js"></script>
<script src="/JTalk/bower_components/chart.js/Chart.js"></script>
<script src="/JTalk/dist/js/inforchart.js"></script>
</body>
</html>