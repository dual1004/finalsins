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
	$('.atagname').mouseenter(function(id) {
		 var ex_obj = $('#lay');
		    if(!e) e = window.Event;
		    pos = abspos(e);
		    ex_obj.style.left = pos.x+"px";
		    ex_obj.style.top = (pos.y+10)+"px";
		    ex_obj.style.display = ex_obj.style.display=='none'?'block':'none';
	});
	
	$('.atagname').mouseleave();
	
});
function abspos(e){
    this.x = e.clientX + (document.documentElement.scrollLeft?document.documentElement.scrollLeft:document.body.scrollLeft);
    this.y = e.clientY + (document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop);
    return this;
}
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
	alert(userid);
}

function msgdetail(msgno) {
	$('#msgno').val(msgno);
	var form = document.detailform;
	 form. action =  'msgdetail.j';
	 form.method = "post";
	 form.submit();
}