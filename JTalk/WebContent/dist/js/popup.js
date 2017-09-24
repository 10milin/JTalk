function showmember(email){
	if($('#sendId').val() != email){
		$.ajax({ 
			type: 'POST',
			url: '/JTalk/profile.ajax', 
			data: "email=" + email, 
			dataType: 'json', 
			success: function(member){
				$('#pop-profile').attr('src', '/JTalk/upload/' + member.profile);
				$('#pop-name1').text(member.name);
				$('#pop-period1').text(member.period);
				$('#pop-date').text(member.registerDate);
				$('#pop-email').text(member.email);
				$('#pop-name2').text(member.name);
				$('#pop-period2').text(member.period);
				$('#pop-pr').html(member.pr);
				$('#receiveId').val(member.email);
				
				if(member.ban == 0){
					$('#ban-0').css('display','block');
				}else{
					$('#ban-1').css('display','block');
				}
				
				if(member.active == 1){
					$('#active-1').css('display','block');
				}else if(member.active == 2){
					$('#active-2').css('display','block');
				}
				
				$('#popup-member').modal('show');
			}
		});
	}
}

function resetpassword(){
	$.ajax({ 
		type: 'POST',
		url: '/JTalk/adminpw.ajax', 
		data: "email=" + $('#pop-email').text(), 
		dataType: 'json', 
		success: function(e){
			if(e.result > 0){
				$('#message-admin-p').html('비밀번호가 1234로 초기화 되었습니다.');
				$('#message-admin-div').css('display' , 'block');
			}
		}
	});
}

function userban(status){
	$.ajax({ 
		type: 'POST',
		url: '/JTalk/adminban.ajax', 
		data: {"email":  $('#pop-email').text(), "status" : status}, 
		dataType: 'json', 
		success: function(e){
			if(e.result > 0){
				if(status == 0){
					$('#message-admin-p').html('정상 상태로 변경되었습니다.');
					$('#ban-0').css('display', 'block');
					$('#ban-1').css('display', 'none');
				}else{
					$('#message-admin-p').html('정지 상태로 변경되었습니다.');
					$('#ban-1').css('display', 'block');
					$('#ban-0').css('display', 'none');
				}
				$('#message-admin-div').css('display' , 'block');
			}
		}
	});
}

function adminassign(status){
	$.ajax({ 
		type: 'POST',
		url: '/JTalk/adminassign.ajax', 
		data: {"email":  $('#pop-email').text(), "status" : status}, 
		dataType: 'json', 
		success: function(e){
			if(e.result > 0){
				if(status == 1){
					$('#message-admin-p').html('일반 유저로 변경되었습니다.');
					$('#active-1').css('display', 'block');
					$('#active-2').css('display', 'none');
				}else{
					$('#message-admin-p').html('관리자 권한이 부여되었습니다.');
					$('#active-2').css('display', 'block');
					$('#active-1').css('display', 'none');
				}
				$('#message-admin-div').css('display' , 'block');
			}
		}
	});
}