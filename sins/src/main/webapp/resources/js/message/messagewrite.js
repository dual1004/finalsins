/**
 * 
 */

$( function() {
  $('#reciveid').keyup(function() {
	$.ajax({
		url : "autocomresiveid.j",
		type : "post",
		data : {"receivie_id" : $(this).val(),
				"send_id" : $('#send_id').val()},
		success : function(data) {
			$('#reciveid').autocomplete({
				source : data
			})
		}
	})
});
});
function subsub() {
	// ajax로 존재하는 유저인지 검색 후 서브밋
	var flag = false;
	var cnt = 0;
	var reciveid = $('#reciveid').val().split(",");
	$.ajax({
		url : "allmemberid.j",
		type : "get",
		success : function(data) {
			var allmemberid = data;
			for(var i = 0 ; i < allmemberid.length ; i++){
				for(var j = 0 ; j < reciveid.length ; j ++){
					if(allmemberid[j] == reciveid[i]){
						cnt++;
					}
				}
				
			}
		}
			
	})
	if(cnt == reciveid.length){
		flag = true;
	}
	
	 return flag;
}

/*$('#reciveid').autocomplete({
source: function(request, response) {
	$.ajax({
		url : "autocomresiveid.j",
		type : "post",
		//request.term >> 이거 자체가 text박스내에 입력된 값이다. 
		data : {"resiveid" : request.term},
		success : function(result) {
		//return 된놈을 response() 함수내에 다음과 같이 정의해서 뽑아온다. 
			response(
					$.map(result, function(item) {
						return {
							//label : 화면에 보여질 텍스트
							//value : 실제 text태그에 들어갈 값
							label : item.data,
							value : item.data
						}
					})
			);
		}
	});
},
// 최소 글자수 설정
minLength : 2,
//자동완성 목록에서 특정값 선택시 처리하는 동작구현
// 구현이없으면 단순 text가 들어감
select : function(event, ui) {
	
}
})*/
//});