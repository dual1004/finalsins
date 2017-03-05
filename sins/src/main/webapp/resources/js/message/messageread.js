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
	if($('selectid') == 'cont'){
		$('#select').val("cont").prop("selected", true);
	}else if($('selectid') == 'name'){
		$('#select').val("name").prop("selected", true);
	}else{
		$('#select').val("id").prop("selected", true);
	}
	
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

function pagefn(no) {
	$('#page').val(no);
	var form = document.seachform;
	 form. action =  'msgreadlist.j';
	 form.method = "post";
	 form.submit();
}
function userpage(userid) {
	
}

function msgdetail(msgno) {
	$('#msgno').val(msgno);
	var form = document.detailform;
	 form. action =  'msgrecivedetail.j';
	 form.method = "post";
	 form.submit();
}