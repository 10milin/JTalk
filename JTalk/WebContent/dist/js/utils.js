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