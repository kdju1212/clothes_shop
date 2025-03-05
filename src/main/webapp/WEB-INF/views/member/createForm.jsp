<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="/css/member-create.css">
</head>
<body>

	<div class="signup-container">
		<div class="signup-form">
			<h2>회원가입</h2>
			<form action="createConfirm" method="POST" name="frm">
				<div class="form-group">
					<label for="user_id">아이디:</label> <input type="text" id="user_id"
						name="user_id" placeholder="아이디를 입력하세요" required />
				</div>
				<div class="form-group">
					<label for="pwd">비밀번호:</label> <input type="password" id="pwd"
						name="pwd" placeholder="비밀번호를 입력하세요" required />
				</div>
				<div class="form-group">
					<label for="name">이름:</label> <input type="text" id="name"
						name="name" placeholder="이름을 입력하세요" required />
				</div>
				<div class="form-group">
					<label for="email">이메일:</label> <input type="email" id="email"
						name="email" placeholder="이메일을 입력하세요" required />
				</div>
				<div class="form-group">
					<label for="phone">전화번호:</label> <input type="tel" id="phone"
						name="phone" placeholder="휴대폰번호를 입력하세요" required />
				</div>
				<div class="form-group">
					<label for="gender">성별:</label> <select name="gender" id="gender">
						<option value="1">남성</option>
						<option value="2">여성</option>
					</select>
				</div>
				<div class="form-group">
					<label for="age">나이:</label> <input type="number" id="age"
						name="age" placeholder="나이를 입력하세요" required />
				</div>
				<div class="form-group">
					<input type="submit" value="회원가입" class="submit-btn" />
				</div>
			</form>
		</div>
	</div>

</body>
</html>
