/**
 * 
 */

$(function() {
	$('#msgallchk').click(function() {
		if($(this).is(':checked') == true){
			$('.msgchkbox').prop('checked', true);
		}else{
			$('.msgchkbox').prop('checked', false);
		}
	});
	if($('#selectid').val() == 'cont'){
		$('#select').val("cont").prop("selected", true);
	}else if($('#selectid').val() == 'name'){
		$('#select').val("name").prop("selected", true);
	}else{
		$('#select').val("id").prop("selected", true);
	}
});

function send_del() {
	$('input[name=check_no]').val(chk_values());
	var form = document.chkform;
	 form. action =  'msgsenddel.j';
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

function pagefn(no) {
	$('#page').val(no);
	var form = document.seachform;
	 form. action =  'msgsendlist.j';
	 form.method = "post";
	 form.submit();
}
function userpage(userid) {
	
}

function msgdetail(msgno) {
	$('#msgno').val(msgno);
	var form = document.detailform;
	 form. action =  'msgdetail.j';
	 form.method = "post";
	 form.submit();
}