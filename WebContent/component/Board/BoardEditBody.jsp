<%@page import="cst.dto.BoardDTO"%>
<%@page import="cst.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >

<%
	// 게시판 정보	
	String bbsType = request.getParameter("bbs");
	String bbsName = null;
	
	// 게시물 정보 DTO
	BoardDTO board = null;
	
	// 유저 정보
	String userID = null;
	String userNick = null;
	String boardID = null;
	
	if(request.getParameter("bbsID") != null) {
		boardID = request.getParameter("bbsID");
	}
	
	
	// 게시물 정보 받기
	if(request.getAttribute("board") != null) {
		board = (BoardDTO) request.getAttribute("board");
	}
	
	// 유저 정보 받기
	if(session.getAttribute("user") != null) {
		UserDTO user = (UserDTO) session.getAttribute("user");
		
		userID = user.getUserID();
		userNick = user.getUserNick();
	}
	
	if(bbsType.equals("free"))
		bbsName = "자유게시판";
	else if(bbsType.equals("notice"))
		bbsName = "공시사항";
%>

<head>
<title>BbsBody</title>
</head>
	<body>
		<div class="ui vertical stripe segment">
        	<div class="ui middle aligned stackable grid container">
          		<div class="row">
	            	<div class="fifteen wide column" style="text-align:center;">
	            		
	            		<h2 class="ui horizontal divider header">게시물 수정</h2>
	            		
	            		<!-- 게시판 표시 -->
   						<form class="ui form" action="editAction.do" method="POST">
	   						<table class="ui red table center aligned">
							 	<thead>
							    	<tr>
							    		<th class="one wide">제목</th>
							    		<th class="fifteen wide">
							    			<div class="ui fluid input">
							    				<input type="text" name="boardTitle" value="<%= board.getBoardTitle() %>"></input>
							    				<input type="hidden" name="bbsType" value="<%= bbsType %>"></input>
							    				<input type="hidden" name="userID" value="<%= userID %>"></input>
							    				<input type="hidden" name="userNick" value="<%= userNick %>"></input>
							    				<input type="hidden" name="boardID" value="<%= boardID %>"></input>
							    			</div>
							    		</th>
							  		</tr>
						  		</thead>
							 	<tbody>
							    	<tr>
							      		<td colspan="2">
							      			<div class="field">
							      				<textarea class="ui fluid" name="boardContent" rows="20" cols="auto" placeholder="글 내용"><%= board.getBoardContent() %></textarea>
							      			</div>
							      		</td>
							    	</tr>
							  	</tbody>
							</table>
							
							<div style="text-align: right;">
								<a class="ui black button" href="list.do?bbs=<%= bbsType %>">목록</a>
								<a class="ui black button" href="view.do?bbs=<%= bbsType %>&bbsID=<%= board.getBoardID() %>">취소</a>
								<input type="submit" class="ui red button" value="수정"></a>
							</div>
						</form>
	            	</div>
          		</div>
        	</div>
      	</div>
    </body>
		
