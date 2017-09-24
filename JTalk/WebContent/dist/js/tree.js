// 대나무숲 댓글 등록
function anonycomment(obj){
	$.ajax({ 
		url: '/JTalk/anonycomment.ajax', 
		data: $(obj).serialize(),
		dataType: 'json', 
		type: 'POST',
		success: function(e){
			if(e.result > 0){
				var rhtml ='';
				rhtml += '<div class="box-comment">';
				rhtml += '<img class="img-circle img-sm" src="/JTalk/dist/img/tree.png" alt="User Image">';
				rhtml += '<div class="comment-text">';
				rhtml += '<span class="username">';
				rhtml += 'J-Talk 대나무숲';
				rhtml += '<span class="pull-right">';
				if(admin == 'active'){
					rhtml += '<span class="margin-right-left"><a class="color-black" onclick="" style="cursor:pointer;"><i class="fa fa-trash"></i></a></span>';
				}
				rhtml += '<span class="text-muted">' + e.writeDate + '</span>';
				rhtml += '</span>';
				rhtml += '</span>';
				rhtml += '<span>';
				rhtml += '<span class="comment-in">' + $(obj).find('.input-sm').val() + '</span>';
				rhtml += '</span>';
				rhtml += '</div>';
				rhtml += '</div>';
				$(obj).parent().find('.nocmt').remove();
				var cmtcount = $(obj).parent().parent().find('.comment-count').text();
				$(obj).parent().parent().find('.comment-count').text(parseInt(cmtcount) + 1);
				$(obj).before(rhtml);
				$(obj).find('.input-sm').val('');
			}
		}
	});
	return false;
}

// 대나무숲 스크롤 페이징 처리
var page = 1;  //페이징과 같은 방식이라고 생각하면 된다.
var totalPage = $('#contents').attr('totalPage');

$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
     if($(window).scrollTop() >= $(document).height() - $(window).height()){
    	 if(page <= totalPage){
    	 getListPage(page);
         page++;   
    	 }else{
    		 
    	 }
     } 
});
 
function getListPage(page){
	if(page <= totalPage){
		$.ajax({ 
			url: '/JTalk/anonypage.ajax', 
			data: "page=" + page, 
			dataType: 'json', 
			type: 'POST',
			success: function(result){
				for(var i = 0; i < result.anony.length; i++){
					var rhtml = '';
					rhtml += '<div class="box box-default">';
					rhtml += '<div class="box-body">';
					rhtml += '<div class="user-block">';
					rhtml += '<img class="img-circle" src="/JTalk/dist/img/tree.png" alt="User Image">';
					rhtml += '<span class="username"><a>J-Talk 대나무숲</a></span>';
					rhtml += '<span class="description">대신 전해드립니다 -'+ result.anony[i].writeDate +'</span>';
					rhtml += '</div>';
					rhtml += '<div class="col-md-12 tree-content">';
					rhtml += '<p>' + result.anony[i].content +'</p>';
					rhtml +='</div>';
					rhtml += '<button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i> 좋아요</button>';
					if(admin == 'active'){
						rhtml += '<button type="button" class="btn btn-default btn-xs"><i class="fa fa-trash"></i> 삭제</button>';
					}
					rhtml += '<span class="pull-right text-muted">';
					rhtml += '<a class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i>좋아요 ' + result.anony[i].awesome + '</a>';
					rhtml += '<a class="link-black text-sm"><i class="fa fa-comments-o margin-l-5 margin-r-5"></i>댓글 ' + result.anony[i].commentCount +'</a>';
					rhtml += '</span>';
					rhtml += '</div>';
					 
					
				}
				
			}
		});
	}
 }