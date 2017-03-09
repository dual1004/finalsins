/**
 * 
 */
function recivedel() {
	var form = document.message_no;
	 form. action =  'msgrecivedel.j';
	 form.method = "post";
	 form.submit();
}
function senddel() {
	var form = document.message_no;
	 form. action =  'msgsenddel.j';
	 form.method = "post";
	 form.submit();
}
// 답장 컨트롤러
function reference() {
	var form = document.message_no;
	 form. action =  'msgreference.j';
	 form.method = "post";
	 form.submit();
}