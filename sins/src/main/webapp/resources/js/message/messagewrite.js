/**
 * 
 */

$( function() {
    var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
    $( "#reciveid" ).autocomplete({
      source: availableTags
    });
  } );
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