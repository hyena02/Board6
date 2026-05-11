<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@taglib  prefix="c"  uri="jakarta.tags.core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet" />

<style>
main {
	width  : 900px;
	margin : 50px auto;
	padding: 30px;
}
table {
	width : 100%;
	border-collapse : collapse;
	overflow:hidden;
	border-radius:10px;
}
 td {
    padding:5px 10px;
    text-align : center; 
 }
 tr > td:first-child {
 	background-color:gray;
 	color : white;
 }
 tr:last-child > td {
     background: gray;
 
 }
   
  input[type="text"], input[type=number], input[type=password]  {
     width : 100%;
  }
  input[type=submit], input[type=button] {
     width : 100px;
  }
  input[name=userid] {
     width : 65%;
  }
  
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</head>

<body>
	<main>
	  <%@include file="/WEB-INF/include/menus.jsp" %> 
	
	  <h2 class="h2">${ menu.menu_name } 게시물 목록</h2>
	  <table id="list" class="table  table-hover">
 
	    <tr>
	      <td>번호</td>
	      <td>제목</td>
	      <td>글쓴이</td>
	      <td>날짜</td>
	      <td>조회수</td>	
	      <td>삭제</td>	
	      <td>수정</td>	
	    </tr>

	    <tr>
	      <td  colspan="7">
	       |<a href="/Board/WriteForm?menu_id=${ menu_id }">새 글 등록</a>|&nbsp;&nbsp;&nbsp; 
	       |<a href="/">Home</a>|
	      </td>
	    </tr>
	    
	    <c:forEach  var="board"  items="${ bList }">
	    <tr>
	      <td> ${  board.idx      }  </td>    <!-- menu.getMenu_id() -->
	      <td class="title"> 
	        <a href ="/Board/View?idx=${board.idx}&menu_id=${menu_id}">
	        ${ board.title    }
	        </a>  
	      </td>
	      <td> ${ board.writer   }  </td>
	      <td> ${ board.regdate  }  </td>
	      <td> ${ board.hit      }  </td>
	      <td> <a href="/Board/Delete?idx=${board.idx}">삭제</a></td>
	      <td> <a href="/Board/UpdateForm?idx=${board.idx}">수정</a></td>
	    </tr>
	    </c:forEach>
	  </table>	
	  <%@include file="/WEB-INF/include/paging.jsp" %>
	</main>
</body>
</html>









