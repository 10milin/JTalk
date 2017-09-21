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
	var read = $(obj).attr('read');
	if(ck == 0){
		if(read == 0){
			$.ajax({ 
				url: '/JTalk/messagecheck.ajax', 
				data: "num=" + $(obj).closest('tr').attr('id'), 
				dataType: 'json', 
				type: 'POST',
				success: function(e){
					$(obj).attr('read', '1');
				}
			});
		}
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

//이름으로 email목록 찾기
function namefindemail(){
	if($('#emailserach-input').val().length == 0 || $('#emailserach-input').val()=='관리자'){
		$('#emailserach-input').closest('.form-group').addClass('has-error');
		$('#emailserach-div').css('display', 'none');
	}else{
		$('#emailserach-input').closest('.form-group').removeClass('has-error');
		$.ajax({ 
			url: '/JTalk/findemail.ajax', 
			data: "name=" + $('#emailserach-input').val(), 
			dataType: 'json', 
			type: 'POST',
			success: function(e){
				if(e.length == 0){
					var render = '<tr><td colspan="5" class="text-center"><i class="fa fa-search"></i> 검색 결과가 없습니다.</td></tr>';
					$('#emailserach-table').empty();
					$('#emailserach-table').append(render);
				}else{
					$('#emailserach-table').empty();
					for(var i = 0; i<e.length; i++){
						var render = '<tr>';
						render += '<td><i class="fa fa-user"></i></td>';
						render += '<td>' + e[i].period + '기</td>';
						render += '<td>' + e[i].name + '</td>';
						render += '<td>' + e[i].email + '</td>';
						render += '<td><a class="emailchoicea" href="javascript:void(0)" onclick="emailchoice(this)"><i class="fa fa-check"></i></a></td>';
						render += '</tr>';
						$('#emailserach-table').append(render);
					}
				}
				
				$('#emailserach-div').css('display', 'block');

			}
		});
	}
}

//이름으로 email 목록찾기 이벤트 추가
$('#emailserach-input').keydown(function(key){
	if(key.keyCode == 13){
		namefindemail();
		return false;
	}
});

// 찾은사람 선택
function emailchoice(obj){
	var email = $(obj).parent().prev().text();
	$(obj).closest('tbody').children('tr').removeAttr('class', 'emailchoice');
	$(obj).closest('tr').attr('class', 'emailchoice');
	$('#reciveId').val(email);
}

//메시지 작성
function sendmessage(){
	if($('#sendId').val() == $('#reciveId').val()){
		$('#msg-complete').modal('show');
		$('#modal-msg').text('자신에게 메시지를 보낼 수 없습니다.');
	}else if($('#reciveId').val().length == 0){
		$('#msg-complete').modal('show');
		$('#modal-msg').text('받는이를 선택해주세요.');
	}else{
		$.ajax({ 
			url: '/JTalk/messagesend.ajax', 
			data: $('#send-action').serialize(),
			dataType: 'json', 
			type: 'POST',
			success: function(e){
				$('#msg-complete').modal('show');
				$('#modal-msg').text($('#emailserach-input').val() + '(' + e.receiveId + ')님께 메시지를 전송하였습니다.');
				$('#profile-msg-title').val('');
				$('#profile-msg-content').val('');
			}
		});
	}
	return false;
}

function sendmessagemodal(){
	$.ajax({ 
		url: '/JTalk/messagesend.ajax', 
		data: $('#message-form').serialize(),
		dataType: 'json', 
		type: 'POST',
		success: function(e){
			$('#msg-title').val('');
			$('#msg-content').val('');
			$('#message-div').css('display', 'block');
			$('#message-p').text($('#pop-name2').text() + '(' + e.receiveId + ')님께 메시지를 전송하였습니다.');
		}
	});
	return false;
}