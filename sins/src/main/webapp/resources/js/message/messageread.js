/**
 * 
 */
$(function() {
	/*두번 클릭시 체크가안됨*/
	$('#msgallchk').click(function() {
		if($(this).is(':checked') == true){
			$('.msgchkbox').attr('checked', true);
		}else{
			$('.msgchkbox').attr('checked', false);
		}
	});
});
function spamin() {
	$('input[name=check_no]').val(chk_values());
	var form = document.chkform;
	 form. action =  'msgspaminsert.j';
	 form.method = "post";
	 form.submit();
};
function recive_del() {
	$('input[name=check_no]').val(chk_values());
	var form = document.chkform;
	 form. action =  'msgrecivedel.j';
	 form.method = "post";
	 form.submit();
};

function chk_values() {
	var chk= new Array();
	
	$('.msgchkbox:checked').each(function() {
		chk.push($(this).val());
	});

	if(chk.length == 0){
		alert('하나이상 선택이 필요합니다.');
		brack;
	}
	  return chk;
};

