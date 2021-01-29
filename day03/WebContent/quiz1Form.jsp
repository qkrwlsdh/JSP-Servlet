<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            background-color: #f5f6f7;
        }
        .root {
            display: flex;
            flex-flow: column;
            justify-content: center;
            align-items: center;
        }
        .logo {
            font-size: 50pt;
            font-weight: bold;
            color: #00c850;
            cursor: pointer;
            margin: 15px;
        }
        .inputName {
            font-weight: bold;
        }
        .inputField {
            width: 400px;
            margin: 10px 0 10px 0;
            border: 1px solid #dadada;
            background-color: white;
            padding: 10px;
        }
        input {
            all: unset;
            width: 70%;
            cursor: pointer;
            border: 0;
        }
        select {
            all: unset;
            width: 70%;
            border: 0;
        }
        .birth {
            width: 115px;
            display: inline-block;
        }
        .grey {
            float: right;
            color: silver;
        }
        input[type="submit"], input[type="button"] {
            margin: 20px auto;
            width: 420px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            border: 0;
            background-color: #00c850;
            color: white;

        }
    </style>
</head>
<body>
<input>
    <form action="quiz1Result.jsp" method="POST">
    <div class="root">
        <div class="logo">NAVER</div>

        <div class="">
            <div class="inputName userid">아이디</div>
            <div class="inputField">
                <input type="text" name="userid">
                <span class="grey">@naver.com</span>
            </div>
        </div>
        
        <div class="">
            <div class="inputName userpw">비밀번호</div>
            <div class="inputField">
                <input id="userpw" type="password" name="userpw">
            </div>
        </div>
        
        <div class="">
            <div class="inputName userpw2">비밀번호 재확인</div>
            <div class="inputField">
                <input id="userpw2" type="password" name="userpw2">
            </div>
        </div>
        
        <div class="">
            <div class="inputName username">이름</div>
            <div class="inputField">
                <input type="text" name="username">
            </div>
        </div>
        
        <div class="">
            <div class="inputName">생년월일</div>
            <div class="inputField birth">
                <input type="text" name="year" placeholder="년(4자)">
            </div>
            <div class="inputField birth">
                <select name="month">
                    <option>월</option>
                    <!-- for문 처리하자-->
                    <%
                    for(int i = 1; i <= 12; i++) {
                    	out.print("<option>" + i + "월</option>");
                    }
                    %>
                </select>
            </div>
            <div class="inputField birth">
                <input type="text" name="date" placeholder="일">
            </div>
        </div>
        
        <div class="">
            <div class="inputName gender">성별</div>
            <div class="inputField">
                <select name="gender">
                    <option>성별</option>
                    <option>남자</option>
                    <option>여자</option>
                    <option>선택 안함</option>
                </select>
            </div>
        </div>
        
        <div class="">
            <div class="inputName email">
                본인 확인 이메일
                <span class="grey">(선택)</span>
            </div>
            <div class="inputField">
                <input type="text" name="email" placeholder="선택입력">
            </div>
        </div>
        
        <div class="">
            <div class="inputName phone">휴대전화</div>
            <div class="inputField">
                <select name="locale">
                    <option>니카라과 +505</option>
                    <option selected>대한민국 +82</option>
                    <option>덴마크 +45</option>
                </select>
            </div>
            <div class="inputField">
                <input type="text" name="phoneNumber" placeholder="전화번호 입력">
            </div>
        </div>
        <div class="">
<!--             <input type="submit" value="가입하기">             -->
            <input id="submitBtn" type="button" value="가입하기">            
        </div>
        
    </div>
	</form>
	
	<script>
		const form = document.forms[0];
		const submitBtn = document.getElementById('submitBtn');
		
		const submitHandler = () => {
			const userpw = document.getElementById('userpw');
			const userpw2 = document.getElementById('userpw2');
			
 			if(userpw.value === '' || userpw2.value === '') {
 				alert('비밀번호를 입력하세요');
 				return;
 			}
			
 			if(userpw.value !== userpw2.value) {
 				alert('입력한 비밀번호가 일치하지 않습니다');
 				return;
 			}
			
			form.submit();
		};
		
		submitBtn.onclick = submitHandler;
	</script>
	
</body>
</html>