/**
 * 
 */

function spamin() {
	$('input[name=check_no]').val(chk_values());
	var form = document.chkform;
	 form. action =  'msgspaminsert.j';
	 form.method = "post";
	 form.submit();
}

function chk_values() {
	var chk= new Array();
	
	$('.cmsgchkbox:checked').each(function() {
		chk.push($(this).val());
	});

	if(chk.length == 0){
		alert('하나이상 선택이 필요합니다.');
		black;
	}
	  return chk;
};
