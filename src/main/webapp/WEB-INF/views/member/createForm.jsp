<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="createConfirm" method="POST" name="frm">
		<p>
			아이디 : <input type="text" id="user_id" name="user_id"
				placeholder="아이디를 입력하세요" required />
		</p>
		<p>
			비밀번호 : <input type="password" id="pwd" name="pwd"
				placeholder="비밀번호를 입력하세요" required />
		</p>
		<p>
			이름 : <input type="text" id="name" name="name" placeholder="이름을 입력하세요"
				required />
		</p>
		<p>
			이메일 : <input type="email" id="email" name="email"
				placeholder="이메일을 입력하세요" required />
		</p>
		<p>
			전화번호 : <input type="tel" id="phone" name="phone"
				placeholder="휴대폰번호를 입력하세요" required />
		</p>
		<p>
			성별 : <select name="gender" id="gender">
				<option value="1">남성</option>
				<option value="2">여성</option>
			</select>
		</p>
		<p>
			나이 : <input type="number" id="age" name="age" placeholder="나이를 입력하세요"
				required />
		</p>
		<input type="submit" value="전송" />
	</form>

</body>
</html>