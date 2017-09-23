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