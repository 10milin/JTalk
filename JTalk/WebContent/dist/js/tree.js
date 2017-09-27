// 대나무숲 댓글 삭제
function anonycommentdelete(obj, num){
	$.ajax({ 
		url: '/JTalk/anonycmtdelete.ajax', 
		data: "num=" + num, 
		dataType: 'json', 
		type: 'POST',
		success: function(e){
			if(e.result > 0){
				$(obj).closest('.box-comment').remove();
			}
		}
	});
}

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
				if(e.active == '2' || e.active == '3'){
					rhtml += '<span class="margin-right-left"><a class="color-black" onclick="anonycommentdelete(this, \'' + e.num + '\')" style="cursor:pointer;"><i class="fa fa-trash"></i></a></span>';
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
var totalPage = $('#contents').attr('total');

$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
     if($(window).scrollTop() >= $(document).height() - $(window).height()){
    	 if(page <= totalPage){
    	 getListPage(page);
         page++;
         if(page==totalPage){
			 $('#loading').remove();
		 }
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
					rhtml += '<button type="button" class="btn btn-default btn-xs" style="margin-right: 3px;"><i class="fa fa-thumbs-o-up"></i> 좋아요</button>';
					if(result.active == '2' || result.active == '3'){
						rhtml += '<button type="button" class="btn btn-default btn-xs" onclick="actionparam(\'anony.action?command=delete\', \'' + result.anony[i].num + '\')"><i class="fa fa-trash"></i> 삭제</button>';
					}
					rhtml += '<span class="pull-right text-muted">';
					rhtml += '<a class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i>좋아요 ' + result.anony[i].awesome + '</a>';
					rhtml += '<a class="link-black text-sm"><i class="fa fa-comments-o margin-l-5 margin-r-5"></i>댓글 ' + result.anony[i].commentCount +'</a>';
					rhtml += '</span>';
					rhtml += '</div>';
					rhtml += '<div class="box-footer box-comments">';
					if(result.comment[i].length == 0){
						rhtml += '<div class="box-comment nocmt">';
						rhtml += '등록된 댓글이 없습니다.';
						rhtml += '</div>';
					}else{
						for(var j = 0; j<result.comment[i].length; j++){
							rhtml += '<div class="box-comment nocmt">';
							rhtml += '<img class="img-circle img-sm" src="/JTalk/dist/img/tree.png" alt="User Image">';
							rhtml += '<div class="comment-text">';
							rhtml += '<span class="username">';
							rhtml += 'J-Talk 대나무숲';
							rhtml += '<span class="pull-right">';
							if(result.active == '2' || result.active == '3'){
								rhtml += '<span class="margin-right-left"><a class="color-black" onclick=" anonycommentdelete(this, \'' + result.comment[i][j].num +'\')" style="cursor:pointer;"><i class="fa fa-trash"></i></a></span>';
							}
							rhtml += '<span class="text-muted">' + result.comment[i][j].writeDate + '</span>';
							rhtml += '</span>';
							rhtml += '</span>';
							rhtml += '<span>';
							rhtml += '<span class="comment-in">' + result.comment[i][j].content +'</span>';
							rhtml += '</span>';
							rhtml += '</div>';
							rhtml += '</div>';
						}
					}
					
					rhtml += '<form onsubmit="return anonycomment(this);">';
					rhtml += '<img class="img-responsive img-circle img-sm" src="/JTalk/dist/img/tree.png" alt="Alt Text">';
					rhtml += '<div class="img-push input-group">';
					rhtml += '<input type="hidden" name = "tableName" value = "anony"/>';
					rhtml += '<input type="hidden" name = "postNum" value = "' + result.anony[i].num + '"/>';
					rhtml += '<input type="text"  name = "content" class="form-control input-sm" placeholder="댓글을 입력해주세요." required>';
					rhtml += '<span class="input-group-btn">';
					rhtml += '<button type="submit" class="btn btn-sm btn-primary btn-flat"><i class="fa fa-pencil"></i> 댓글 등록</button>';
					rhtml += '</span>';
					rhtml += '</div>';
					rhtml += '</form>';
					rhtml += '</div>';
					rhtml += '</div>';
					//랜더링한 html을 붙인다.
					$('#contents').append(rhtml);
				}
				
			}
		});
	}
 }