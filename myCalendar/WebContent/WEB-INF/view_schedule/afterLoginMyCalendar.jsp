<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCalendar</title>
<link href='../css/core.css' rel='stylesheet' />
<link href='../css/daygrid.css' rel='stylesheet' />
<link href='../css/timegrid.css' rel='stylesheet' />
<link href='../css/list.css' rel='stylesheet' />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Fraunces&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src='../js/coreMain.js'></script>
<script src='../js/interaction.js'></script>
<script src='../js/daygrid.js'></script>
<script src='../js/timegrid.js'></script>
<script src='../js/list.js'></script>
<script src='../js/ko.js'></script>
<script src="https://kit.fontawesome.com/f95cd7a2ae.js" crossorigin="anonymous"></script>
<script>
	var dataSet=[
	  <c:forEach var="list" items="${sdList}" varStatus="status">
	  	{
	  	"id": "${list.scheduleId }",
	  	"title": "${list.scheduleTitle }",
	  	"start": "${list.start }",
	  	"end": "${list.end }",
	  	"color": "${list.color}"
	  	},
	  </c:forEach>
	 ];
	
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
    	plugins: [ 'interaction','dayGrid','timeGrid','list' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,list'
      },
      locale: 'ko',
      businessHours: true, // display business hours
      events:dataSet,
      eventClick:function(info){
     	 var eventObj=info.event;
     	 var eventId=eventObj.id;
 		
     	 var _width='500';
     	 var _height='190';    	 
     	 var _left=Math.ceil((window.screen.width-_width)/2);
     	 var _top='200';
     	 var windowObj=window.open("popup?id="+eventId, "Question", 'width='+_width+', height='+_height+', left='+ _left+', top='+ _top);
       },
      dateClick:function(info){

   	 	var Year=info.date.getFullYear();
   	 	var Month=(info.date.getMonth())+1;
   	 	var Date=info.date.getDate();
   	 	var defalutDate=Year+"-"+Month+"-"+Date;
   	 	 	
   	    var answer=confirm('일정을 추가하시겠습니까?');
    	if(answer==true){
    		 location="${pageContext.request.contextPath}/schedule/insertData?userId="+${num}+"&defaultDate="+defalutDate;
    	 }
      }
    });
    calendar.render();
  });
</script>
<style>
  body {
    margin: 0;
    padding: 0;
    font-family: Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
    padding-top: 80px;
    padding-bottom: 80px;
  }
  
  .fc-day-top.fc-sun.fc-past, .fc-day-top.fc-sun.fc-future {
  	color: #FF0000;
  }
  
  .fc-day-top.fc-sat.fc-past, .fc-day-top.fc-sat.fc-future {
  	color: #0100FF;
  }
  
  .navbar{
  	display: flex;
  	justify-content: space-between;
  	aligh-items: center;
  	background-color: #0F222D;
    padding: 8px 12px;
    min-width: 900px;
    position: sticky;
    top: 0;
    z-index: 2;
  }
  
  a{
  	text-decoration: none;
  	color: white;
  }
  
  footer{
    letter-spacing: -1px;
  	border-top: 1px solid #bdbdbd;
  }
  
  .navbar_logo{
  	list-style: none;
	color: white;
	display: flex;
	padding: 0;
  }
  
  .navbar_logo li{
    font-size: 24px;
    padding: 8px 12px;
  }
  
  #QA:hover{
    background-color: #b1bfca;
  	border-radius: 4px;
  }
    
  #QA{
  	padding: 8px 40px;
    font-size: 16px;
  }
  
  .navbar_icons{
  	list-style: none;
	color: white;
	display: flex;
  }
  
  .navbar_icons li{
    font-size: 24px;
    padding: 8px 12px;
  }
  
  .navbar_icons li:hover{
  	background-color: #b1bfca;
  	border-radius: 4px;
  }
  
  .footer{
  	min-width: 900px;
  	margin: 0px;
  	padding: 15px 30px 15px 30px;
  	list-style: none;
  	display: flex;
  }
  
  footer>ul>li{
  	margin: 5px;
  	padding: 5px;
  }
  
  footer>ul>li>a {
  	color: black;
  }
</style>
</head>
<body>
  <nav class="navbar">
  	<ul class="navbar_logo">
		<li>
		<i class="far fa-calendar-alt" style="color: #fff59d;"></i>
		<span>&nbsp;myCalendar</span>
		</li>
		<li><a id="QA" href="${pageContext.request.contextPath}/board/listPage">Q&A</a></li>
  	</ul>
  	<ul class="navbar_icons">
  		<li><a href="${pageContext.request.contextPath}/index.jsp"><i class="fas fa-sign-out-alt"></i></a></li>
  		<li><a href="${pageContext.request.contextPath}/user/viewUser?number=${sessionScope.loginNumber}"><i class="fas fa-users-cog"></i></a></li>
  	</ul>
  </nav>
  <div id='calendar'></div>
    <footer>
  	<ul class="footer">
  		<li><a href="#">이용약관</a></li>
	  	<li><a href="#">개인정보처리방침</a></li>
	  	<li><a href="#" style="font-weight: bold">ⓒmyCalendar</a></li>
  	</ul>
  </footer>
</body>
</html>