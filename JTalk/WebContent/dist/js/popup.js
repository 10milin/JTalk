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
				$('#popup-member').modal('show');
			}
		});
	}
	
	
}
