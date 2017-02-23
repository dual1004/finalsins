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
	});
</script>
<style>
	* {
		margin: 0px;
		padding: 0px;
	}
	
	#container {
		width: 100%;
		height: 770px;
		margin: 0px auto;
		background-color: #E7E4F9;
	}
	
	#header {
		height: 40px;
		/* margin-bottom: 10px; */
		background-color: #9581BF;
	}
	
	#mdiv {
		width: 1100px;
		height: 500px;
		margin: auto;
		margin-top: 100px;
		margin-bottom: 98px;
		background-color: #E7E4F9;
	}
	
	#m-fdiv, #m-sdiv, #m-fdiv2, #m-sdiv2 {
		display: inline-block;
		float: left;
		width: 500px;
		height: 500px;
		background-color: white;
		-moz-box-shadow: 1px 1px #888888;
		-webkit-box-shadow: 1px 1px #888888;
		box-shadow: 1px 1px #888888;
	}
	
	
	#m-fdiv, #m-fdiv2 {
		margin-left: 40px;
		margin-right: 20px;
	}
	
	#m-sdiv {
		background-image: url("resources/images/파이널로고.jpg");
		background-size: 450px 450px;
		background-position: center center;
	}
	
	#m-f-ltable {
		width: 400px;
		height: 300px;
		margin-top: 100px;
		margin-left: 50px;
	}
	
	#loginbtn {
		height: 84px;
		width: 90px;
		font-size: 20px;
		margin-left: 6px;
	}
	
	#tdd1 {
		padding-top: 3px;
		padding-bottom: 3px;
	}
	
	#tdd2 {
		padding-bottom: 3px;
	}
	
	#m-f-ctable {
		width: 400px;
		height: 500px;
		margin-left: 50px;
	}
	
	#tr1 {
		height: 100px;
		width : 400px;
	}
	
	#tr2 {
		height: 340px;
		width : 400px;
	}
	
	#tr3 {
		height: 50px;
		width : 400px;
	}
	
	.box {
		height: 30px;
		width: 280px;
		font-size: 20px;
	}
	
	#footer {
		height: 30px;
		clear: both;
		border: 1px solid #9581BF;
		background-color: white;
	}
	
	@media screen and (max-width:500px) {
		#container {
			width: auto;
		}
		#m-fdiv, #m-sdiv {
			display: block;
			float: none;
			width: auto;
			margin: auto;
		}
		#m-fdiv {
			margin-top: 50px;
			margin-bottom: 40px;
		}
	}
</style>
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
							<td></td>
							<td></td>
						</tr>

						<tr style="height: 100px;">
							<td colspan="2">
								<table style="cellpadding: 0; cellspacing: 0; height: 100px">
									<tr style="height: 50px;">
										<td id="tdd1"><input type="text" size="25" class="box"
											name="userid" /></td>
										<td rowspan="2">&nbsp;<input type="submit" value="로그인"
											id="loginbtn" /></td>
									</tr>
									<!-- <tr><td style="width : 30px;"><div style="width : 13.3px"></div></td></tr> -->
									<tr style="height: 50px;">
										<td id="tdd2"><input type="password" size="25"
											class="box" name="userpwd" /></td>
										<td></td>
									</tr>
								</table>
							</td>
						</tr>

						<tr style="height: 100px;">
							<td></td>
							<td><label id="enroll" style="border-right: 1px solid gray;">회원가입
									&nbsp; &nbsp;</label><label> &nbsp; &nbsp;아이디/비밀번호 찾기</label></td>
							<td></td>
						</tr>
					</table>
				</form>
			</div>
			<div id="m-sdiv"></div>

			<div id="m-fdiv2">
				<table id="m-f-ctable" style="cellpadding: 0; cellspacing: 0">
					<tr id="tr1">
						<td><h2>이용약관</h2></td>
					</tr>
					<tr id="tr2">
						<td><textarea style="width : 400px; height : 340px;resize: none;" readonly>글자가 무수히 많이 들어갈 것 입니다.</textarea></td>
					</tr>
					<tr id="tr3">
						<td style="text-align : right">동의합니다 <input type="radio" /> </td>
					</tr>
				</table>
			</div>

			<div id="m-sdiv2">
				<table id="m-s-enrolltable">
					<tr><td><label>아이디</label></td><td></td><td></td></tr>
					<tr><td><label>비밀번호</label></td><td></td><td></td></tr>
					<tr><td><label>비밀번호 확인</label></td><td></td><td></td></tr>
					<tr><td><label>이름</label></td><td></td><td></td></tr>
					<tr><td><label>전화번호</label></td><td></td><td></td></tr>
					<tr><td><label>성별</label></td><td></td><td></td></tr>
					<tr><td><input type="button" value="지우기" /></td><td><input type="button" value="취소" /></td><td><input type="button" value="가입하기" /></td></tr>
				</table>
			</div>


		</div>

		<div id="footer">FOOTER</div>
	</div>
	<div id="spot1"></div>
	<div id="spot2"></div>
</body>
</html>