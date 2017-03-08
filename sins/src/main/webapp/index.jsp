<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#m-fdiv2").hide();
		$("#m-sdiv2").hide();
		$("#m-fdiv3").hide();
		$("#m-sdiv3").hide();
		
		$("#enroll").click(function() {
			$("#m-fdiv").slideUp("slow");
			$("#m-sdiv").slideUp("slow");
			
			$("#m-fdiv2").slideDown("slow");
			$("#m-sdiv2").slideDown("slow");
			
			$("#email").focus();
		});
		
		$("#findPwd").click(function() {
			$("#m-fdiv").slideUp("slow");
			$("#m-sdiv").slideUp("slow");
			
			$("#m-fdiv3").slideDown("slow");
			$("#m-sdiv3").slideDown("slow");
		});
		
		$("#returnLogin").click(function(){
			$("#m-fdiv2").slideUp("slow");
			$("#m-sdiv2").slideUp("slow");
			
			$("#m-fdiv").slideDown("slow");
			$("#m-sdiv").slideDown("slow");
			
		});
		
		$(".returnlog").click(function(){
			$("#m-fdiv3").slideUp("slow");
			$("#m-sdiv3").slideUp("slow");
			
			$("#m-fdiv").slideDown("slow");
			$("#m-sdiv").slideDown("slow");
			
		});
		
		var idCheck=0;
		var idCopyCheck=0;
		var pwdCheck=0;
		var pwdcCheck=0;
		var nameCheck=0;
		var phoneCheck=0;
		var checkNumCheck=0;
		var checkNum;
		/* $('#email').blur(function(){ */
		$("#idCheck").click(function(){
			
			var id = $("#email").val();
			var check = /^[a-zA-Z]{1}[A-Za-z0-9-_]{4,13}\@[a-zA-Z]{1,6}.(com|co.kr|net)$/;

			
			if(check.test(id)){
				$("#email").css("border", "2px solid green");
				idCheck = 1;
				$.ajax({
					url : 'idCheck.p',
					type : "post",
					data : {"userid" : id},
		            success : function(data){
		            	console.log(data);
		            
						if(data.length == 1){
							idCopyCheck = 0;
							alert("아이디가 중복되었습니다.");
							idCheck = 0;
							$("#email").css("border", "2px solid red");
							$("email").focus();
						}
						else {
							checkNum = data;
							console.log(checkNum);
							idCheck = 1;
							idCopyCheck = 1;
							$("#email").css("border", "2px solid green");
							$("#check").focus();
						}
		            }
				});
				
			}
			else {
				idCheck = 0;
				idCopyCheck = 0;
				$("#email").css("border", "2px solid red");
				$("#email").focus();
			}
		});
		
		$("#checkbtn").click(function(){
			var check = $("#check").val();
			console.log(check);
			if(check == checkNum){
				$("#check").css("border", "2px solid green");
				$("#email").prop("readonly", "readonly");
				checkNumCheck=1;
				$("#pwd").focus();
			}
			else{
				$("#check").css("border", "2px solid red");
				$("#check").focus();
			}
		});
		
		var pwd;
		$("#pwd").blur(function(){
			pwd = $("#pwd").val();
			var check = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
			
			if(check.test(pwd)){
				pwdCheck = 1;
				$("#pwd").css("border", "2px solid green");
			}
			else{
				pwdCheck = 0;
				$("#pwd").css("border", "2px solid red");
				$("#pwd").focus();
				
			}
		});
		
		$("#pwdc").blur(function(){
			var pwdc = $("#pwdc").val();
			
			if(pwdc == pwd){
				pwdcCheck = 1;
				$("#pwdc").css("border", "2px solid green");
			}
			else {
				pwdcCheck = 0;
				$("#pwdc").css("border", "2px solid red");
				$("#pwdc").focus();
			}
		});
		
		$("#name").blur(function(){
			var check = /^[가-힣]{2,6}$/;
			var name = $("#name").val();
			
			if(check.test(name)){
				nameCheck = 1;
				$("#name").css("border", "2px solid green");
			}
			else {
				nameCheck = 0;
				$("#name").css("border", "2px solid red");
				$("#name").focus();
			}
		});
		
		$("#phone").blur(function(){
			var phone = $("#phone").val();
			var check = /^01[0179]-\d{3,4}-\d{4}$/;
			
			if(check.test(phone)){
				phoneCheck = 1;
				$("#phone").css("border", "2px solid green");
			}
			else {
				phoneCheck = 0;
				$("#phone").css("border", "2px solid red");
				$("#phone").focus();
			}
		});
		
		function enroll(){
			
			if(idCheck == 1 && idCopyCheck == 1 && pwdCheck == 1 && pwdcCheck == 1 && phoneCheck == 1 && checkNumCheck == 1 ){
				return true;
			}
			else if(idCheck == 0){
				$("#email").focus();				
				return false;
			}
			else if(idCopyCheck == 0){
				return false;
			}
			else if(pwdCheck == 0){
				$("#pwd").focus();				
				return false;
			}
			else if(pwdcCheck == 0){
				$("#pwdc").focus();				
				return false;
			}
			else if(phoneCheck == 0){
				$("#phone").focus();				
				return false;
			}
			else if(checkNumCheck == 0){
				$("#check").focus();				
				return false;
			}
		}
	});
</script>
<link rel="stylesheet" type="text/css" href="/sins/resources/css/index.css" />
</head>
<body>
	<div id="container">
		<div id="header"></div>

		<div id="mdiv">
			<div id="m-fdiv">
				<form action="loginCheck.k" method="post">
					<table id="m-f-ltable" style="cellpadding: 0; cellspacing: 0">
						<tr style="height: 100px;">
							<td><h2>로그인</h2></td>
						</tr>

						<tr style="height: 100px;">
							<td colspan="2">
								<table id="LT" style="cellpadding: 0; cellspacing: 0; height: 100px">
									<tr style="height: 50px;">
										<td><input id="tdd1" type="text" class="box" id="userid" name="userid" Autofocus tabindex="1"/></td>
										<td rowspan="2">&nbsp;<input type="submit" value="로그인" id="loginbtn" tabindex="3"/></td>
									</tr>
									<tr style="height: 50px;">
										<td><input id="tdd2" type="password" class="box" name="userpwd" tabindex="2"/></td>
										<td></td>
									</tr>
								</table>
							</td>
						</tr>

						<tr style="height: 100px;">
							
							<td><label id="enroll" style="border-right: 1px solid gray;" tabindex="4">회원가입
									&nbsp; &nbsp;</label> &nbsp; &nbsp;
									<label id="findPwd" tabindex="5">아이디/비밀번호 찾기</label></td>
							
						</tr>
					</table>
				</form>
			</div>
			<div id="m-sdiv"></div>

			<div id="m-fdiv2">
				<table id="m-f-ctable" style="cellpadding: 0; cellspacing: 0">
					<tr>
						<td><h2>이용약관</h2></td>
					</tr>
					<tr>
						<td><textarea id="yakwan" readonly>글자가 무수히 많이 들어갈 것 입니다.</textarea></td>
					</tr>
					<tr>
						<td style="float:right">동의합니다 <input type="radio" /> </td>
					</tr>
				</table>
			</div>

			<div id="m-sdiv2">
			<form action="enroll.k" method="post">
               <table id="m-s-enrolltable">
                  <tr class="tr1"><td class="std" style="text-align : center"><h2>회원가입</h2></td></tr>
                  <tr class="tr1"><td class="std"><input type="email" size="25" maxlength="25" name="userId" id="email" tabindex="1" placeholder="아이디@이메일"/></td><td class="ttd"><input type="button" id="idCheck" value="중복확인" tabindex="2" /></td></tr>
                  <tr class="tr1"><td class="std"><input type="text" size="25" maxlength="25" name="check" id="check" tabindex="3" placeholder="인증번호"/><td class="ttd"><input type="button" id="checkbtn" value="인증확인" /></td></tr>
                  <tr class="tr1"><td class="std"><input type="password" size="25" maxlength="25" name="userPwd" id="pwd" tabindex="3" placeholder="비밀번호" /></td><td class="ttd"></td></tr>
                  <tr class="tr1"><td class="std"><input type="password" size="25" maxlength="25" name="pwdc" id="pwdc" tabindex="4" placeholder="비밀번호 확인"/></td><td class="ttd"></td></tr>
                  <tr class="tr1"><td class="std"><input type="text" size="25" maxlength="15" name="userName" id="name" tabindex="5" placeholder="이름"/></td><td class="ttd"></td></tr>
                  <tr class="tr1"><td class="std"><input type="phone" size="25" maxlength="13" name="phone" id="phone" tabindex="6" placeholder="핸드폰번호"/></td><td class="ttd"></td></tr>
                  <tr class="tr1"><td class="std">
                        <input type="radio" name="gender" value="M" tabindex="7" checked>남
                        &nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="F" tabindex="8">여</td>
                     <td class="ttd"></td></tr>
                  <tr id="rtr"><td><input type="reset" value="지우기" style="margin-left : 16.5px; margin-right : 16.5px;" tabindex="9" /><input type="submit" value="가입하기" style="margin-right : 16.5px" tabindex="10" onsubmit="return enroll()" /><input type="button"  id="returnLogin" value="취소" tabindex="11" /></td></tr>
              </table>
            </form>
            </div>
			
			<div id="m-fdiv3">
			<form action="" method="post">
			<table id="idt">
			<tr><td><h2>아이디 찾기</h2></td></tr>
			<tr><td><input class="box" name="userName" placeholder="이  름" /></td></tr>
			<tr><td><input class="box" name="phone" placeholder="전화번호" /></td></tr>
			<tr><td><input type="submit" class="btn" value="아이디 찾기"/>&nbsp;&nbsp;<input type="button" class="btn" class="returnlog" value="취소"/></td></tr>
			</table>
			</form>
			</div>
			
			<div id="m-sdiv3">
			<form action="findPwd.p" method="post">
			<table id="pwdt">
			<tr><td><h2>비밀번호 찾기</h2></td></tr>
			<tr><td><input type="email" class="box" name="userid" placeholder="이메일형식 아이디" /></td></tr>
			<tr><td><input type="submit" class="btn" value="비밀번호 찾기"/>&nbsp;&nbsp;<input type="button" class="btn" class="returnlog" value="취소"/></td></tr>
			</table>
			</form>
			</div>
		</div>

		<div id="footer"><p id="c">copyright ⓒ SINS77 Allright reserved.</p></div>
	</div>
	<div id="spot1"></div>
	<div id="spot2"></div>
</body>
</html>