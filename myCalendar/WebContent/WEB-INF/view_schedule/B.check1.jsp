<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body {

padding-top: 70px;

padding-bottom: 30px;

}

	.button {
		font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
		width: 50px;
		height: 30px;      
		background-color: #0F222D;
		color: white;
		font-size: 16px;
		border-radius: 5px;
		box-shadow: 0 4px 16px rgba(15, 34, 45, 0.3);
		text-align: center;
	}
	
	.button:focus{
		outline: 0;
	}
	
	.button:hover{
		background-color: rgba(15, 34, 45, 0.9);
		cursor: pointer;
		box-shadow: 0 2px 4px rgba(15, 34, 45, 0.3);
	}
</style> 
<title>Insert title here</title>
</head>
<body style="text-align: center; margin: 30%; margin-top: 10%;">
	
	<section style="width: auto; height: auto; text-align: center;">
	<form class="form-inline" action="/board/update1" method="get" style="">
<div class="form-group mb-2">

	NO : <input type="number" name="id" value="${comment.id }" readonly="readonly">
</div>
<div class="form-group mx-sm-3 mb-2">	
	PW :   <input type="password" name="commentPassword" >
</div>	
<div>  
<a href="/board/listPage">리스트로 가기</a>
<button class="button" type="submit" class="btn btn-primary mb-2" style="float: right; margin-right: 20%;">완료</button>
	</div>
	</form>       
	</section>
</body>
</html>