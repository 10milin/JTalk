// 메시지 알림 끄기
function newcmtreset(email){
	$.ajax({ 
			url: '/JTalk/newcmtreset.ajax', 
			data: "email=" + email, 
			dataType: 'json', 
			type: 'POST',
			success: function(e){
				$('#notifications-count').text('0');
				$('#notifications-ul').remove();
			}
		});
}

// 메시지 체크박스 토글
$('#checkedtoggle').click(function(){
	var check = $('#messagelist').attr('toggle');
	if(check == 0){
		$('input:checkbox').prop('checked',function(){
	        return true;
	    });
		$('#messagelist').attr('toggle', '1');
		$('#checkbtn').attr('class', 'fa fa-square-o');
	}else{
		$('input:checkbox').prop('checked',function(){
	        return false;
	    });
		$('#messagelist').attr('toggle', '0');
		$('#checkbtn').attr('class', 'fa fa-check-square-o');
	}
});

// 메시지 세부보기
function msgdetail(obj){
	var ck = $(obj).attr('detail');
	if(ck == 0){
		$(obj).closest('tr').next().css('display', 'table-row');
		$(obj).attr('detail', '1');
	}else{
		$(obj).closest('tr').next().css('display', 'none');
		$(obj).attr('detail', '0');
	}
}

// 메시지 목록, 쓰기 토글
function listtoggle(){
	$('#table-msglist').css('display', 'table');
	$('#div-msgwrite').css('display', 'none');
}

function writetoggle(){
	$('#table-msglist').css('display', 'none');
	$('#div-msgwrite').css('display', 'block');
}