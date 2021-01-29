<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${boardDAO.selectOne(param.idx) }" />
<main>
<div class="viewBoard">
	<p class="boardTitle">${dto.title }</p>
	<div class="wrap">
		<div>${dto.writer } (${dto.ipaddr }) | ${dto.creationDate }</div>
		<div>조회 ${dto.viewcount }</div>
	</div>
	
	<div class="boardContext">
		<c:if test="${dto.uploadfile != 'default.jpg' }">
		<img src="${cpath }/uploadFolder/${dto.uploadfile}" height="200px">
		</c:if>
		<pre>${dto.context }</pre>
	</div>
</div>
<div class="wrap">
	<div>
		<a href="${cpath }/board.jsp?page=${param.page}"><button>목록</button></a>
	</div>
	<div>
		<c:if test="${login.idx == dto.writer }">
		<a href="${cpath }/update.jsp?idx=${dto.idx}"><button>수정</button></a>
		<button id="deleteBtn">삭제</button>
		</c:if>
	</div>
</div>
</main>

<script>
	const deleteBtn = document.getElementById('deleteBtn');
	deleteBtn.onclick = () => {
		const select = confirm('정말 게시글을 삭제하시겠습니까?');
		if(select) {
			location.replace('delete.jsp?idx=${dto.idx}');
		}
	};
</script>



