<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <ul class="sidebar-menu" data-widget="tree">
      	<li class="header">NOTICE</li>
      	<li><a href="javascript:actionlink('notice.action?command=notice');"><i class="fa fa-bullhorn"></i> <span>공지사항</span></a></li>
        <li class="header">COMMUNITY</li>
        <li><a href="javascript:actionlink('anony.action?command=anony');"><i class="fa fa-tree"></i> <span>대나무숲</span></a></li>
        <li><a href="javascript:actionlink('we.action?command=we');"><i class="fa fa-group"></i> <span>우리끼리</span></a></li>
        <li><a href="javascript:actionlink('exchange.action?command=exchange');"><i class="fa fa-comments-o"></i> <span>선후배교류</span></a></li>
         <li><a href="javascript:actionlink('study.action?command=study');"><i class="fa fa-share-alt"></i> <span>스터디모집</span></a></li>
        <li class="header">INFORMATION</li>
        <li><a href="javascript:actionlink('it.action?command=it');"><i class="fa fa-television"></i> <span>IT</span></a></li>
        <li><a href="javascript:actionlink('japanese.action?command=japanese');"><i class="fa fa-book"></i> <span>일본어</span></a></li>
        <li><a href="javascript:actionlink('food.action?command=food');"><i class="fa fa-cutlery"></i> <span>주변맛집</span></a></li>
        <li><a href="javascript:actionlink('life.action?command=life');"><i class="fa fa-check-square-o"></i> <span>생활정보</span></a></li>
        <li class="header">MARKETPLACE</li>
        <li><a href="javascript:actionlink('nanum.action?command=nanum');"><i class="fa fa-heart"></i> <span>행복나눔</span></a></li>
        <li><a href="javascript:actionlink('trade.action?command=trade');"><i class="fa fa-shopping-cart"></i> <span>중고나라</span></a></li>
        <li class="header">PRESENTATION</li>
        <li><a href="javascript:actionlink('speech.action?command=speech');"><i class="fa fa-child"></i> <span>스피치</span></a></li>
        <li><a href="javascript:actionlink('project.action?command=project');"><i class="fa fa-code"></i> <span>프로젝트</span></a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
</html>