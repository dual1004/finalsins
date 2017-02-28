<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#m-fdiv2").hide();
		$("#m-sdiv2").hide();
		$("#m-fdiv3").hide();
		$("#m-sdiv3").hide();
		
		$("#enroll").click(function() {
			/* $("#m-fdiv").slideUp("slow", function() {
				$("#m-fdiv2").slideDown("show");
			});
			$("#m-sdiv").slideUp("slow", function() {
				$("#m-sdiv2").slideDown("show");
			}); */
			$("#m-fdiv2").css({
				"display" : "none",
				"position" : "relative"
				
			});
			
			$("#m-sdiv2").css({
				"display" : "none",
				"position" : "relative"
				
			});
			
			$("#m-fdiv2").show();
			$("#m-sdiv2").show();
			
			$("#m-fdiv").slideUp("slow");
			$("#m-sdiv").slideUp("slow");
		});
		
		$("#findPwd").click(function() {
			$("#m-fdiv3").css({
				"display" : "none",
				"position" : "relative"
			});
			$("#m-sdiv3").css({
				"display" : "none",
				"position" : "relative"
			});
			
			$("#m-fdiv3").show();
			$("#m-sdiv3").show();
			
			$("#m-fdiv").slideUp("slow");
			$("#m-sdiv").slideUp("slow");
		});
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
										<td><input id="tdd1" type="text" class="box" name="userid" /></td>
									</tr>
									<tr style="height: 50px;">
										<td><input id="tdd2" type="password" class="box" name="userpwd" /></td>
										<td rowspan="2">&nbsp;<input type="submit" value="로그인" id="loginbtn" /></td>
										<td></td>
									</tr>
								</table>
							</td>
						</tr>

						<tr style="height: 100px;">
							
							<td><label id="enroll" style="border-right: 1px solid gray;">회원가입
									&nbsp; &nbsp;</label> &nbsp; &nbsp;
									<label id="findPwd">아이디/비밀번호 찾기</label></td>
							
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
			<form action="" method="post">
               <table id="m-s-enrolltable">
                  <tr class="tr1"><td class="std" style="text-align : center"><h2>회원가입</h2></td></tr>
                  <tr class="tr1"><td class="std"><input type="email" size="25" maxlength="25" placeholder="아이디@이메일"/></td><td class="ttd"><input type="button" value="중복확인" /></td></tr>
                  <tr class="tr1"><td class="std"><input type="password" size="25" maxlength="25" placeholder="비밀번호"/></td><td class="ttd"></td></tr>
                  <tr class="tr1"><td class="std"><input type="password" size="25" maxlength="25" placeholder="비밀번호 확인"/></td><td class="ttd"></td></tr>
                  <tr class="tr1"><td class="std"><input type="text" size="25" maxlength="15" placeholder="이름"/></td><td class="ttd"></td></tr>
                  <tr class="tr1"><td class="std"><input type="phone" size="25" maxlength="13" placeholder="핸드폰번호"/></td><td class="ttd"></td></tr>
                  <tr class="tr1"><td class="std">
                        <input type="radio" name="gender" value="M">남
                        &nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="F">여</td>
                     <td class="ttd"></td></tr>
                  <tr id="rtr"><td><input type="reset" value="지우기" style="margin-left : 16.5px; margin-right : 16.5px;" /><input type="button" value="가입하기" style="margin-right : 16.5px" /><input type="button" value="취소" /></td></tr>
              </table>
            </form>
            </div>
			
			<div id="m-fdiv3">
			<form action="" method="post">
			<table id="idt">
			<tr><td><h2>아이디 찾기</h2></td></tr>
			<tr><td><input class="box" name="userName" placeholder="이  름" /></td></tr>
			<tr><td><input class="box" name="phone" placeholder="전화번호" /></td></tr>
			<tr><td><input type="submit" value="아이디 찾기"/></td></tr>
			</table>
			</form>
			</div>
			
			<div id="m-sdiv3">
			<form action="findPwd.p" method="post">
			<table id="pwdt">
			<tr><td><h2>비밀번호 찾기</h2></td></tr>
			<tr><td><input type="email" class="box" name="userid" placeholder="이메일형식 아이디" /></td></tr>
			<tr><td><input type="submit" value="비밀번호 찾기"/></td></tr>
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