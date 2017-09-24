// 대나무숲 스크롤 페이징 처리
var page = 1;  //페이징과 같은 방식이라고 생각하면 된다.
 
$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
     if($(window).scrollTop() >= $(document).height() - $(window).height()){
    	 getListPage(page);
         page++;   
     } 
});
 
function getListPage(page){
	$.ajax({ 
		url: '/JTalk/anonypage.ajax', 
		data: "page=" + page, 
		dataType: 'json', 
		type: 'POST',
		success: function(result){
			
		}
	});
 }