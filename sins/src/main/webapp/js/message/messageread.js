/**
 * 
 */

function spam() {
	$('input[name=check_no]').val(chk_values());
	var check_no = $('input[name=check_no]').val();
	 var form = document.chkform;
	 form. action =  'msgspaminsert.j';
	 form.method = "post";
	  form.submit();
};

function chk_values() {
	var chk = "";
	
	$('.cmsgchkbox:checked').each(function() {
		chk += "," + $(this).val();
	});

	if(chk == ""){
		alert('하나이상 선택이 필요합니다.');
		black;
	}
	  return chk;
};
