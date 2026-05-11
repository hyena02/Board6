<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@taglib  prefix="c"  uri="jakarta.tags.core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 리스트</title>
<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">
<link href="/css/common.css" rel="stylesheet" />

<style>

table{
	width : 100%;
	border-radius : 10px;
	
}
tr {
    border-bottom: 1px solid #ddd;
}
tr:first-child{
	background-color: gray;
	color:white;
	td {
		border : 1px solid white;
	}
}
tr:nth-of-type(2) td {
	text-align: right;
	padding-right: 10px;
}
a{
	padding : 4px 6px;
	border-radius : 6px;
	transition:0.2s;
	text-decoration: none;
	

}
a:hover {
	background-color : gray;
	color:white;
}
</style>

</head>
<body>
	<main>
	  <h2>메뉴 목록 ${msg} </h2>
	  <table>
	    <tr>
	      <td>Menu_id</td>
	      <td>Menu_name</td>
	      <td>Menu_seq</td>
	      <td>삭제</td>
	      <td>수정</td>
	    </tr>
	    <tr>
	      <td  colspan="5">
	       [<a href="/Menus/WriteForm">메뉴등록</a>]&nbsp;&nbsp;&nbsp; 
	       [<a href="/Menus/WriteForm2">메뉴등록2</a>]&nbsp;&nbsp;&nbsp; 
	       [<a href="/">Home</a>] 
	      </td>
	    </tr>
	    
	    <c:forEach  var="menu"  items="${ menuList }">
	    <tr>
	      <td> ${ menu.menu_id   }  </td>    <!-- menu.getMenu_id() -->
	      <td> ${ menu.menu_name }  </td>
	      <td> ${ menu.menu_seq  }  </td>
	      <td> <a href="/Menus/Delete?menu_id=${menu.menu_id}">삭제</a> </td>	      
	      <td> <a href="/Menus/UpdateForm?menu_id=${menu.menu_id}">수정</a>  </td>
	    </tr>
	    </c:forEach>
	  </table>	
	</main>
</body>
</html>









