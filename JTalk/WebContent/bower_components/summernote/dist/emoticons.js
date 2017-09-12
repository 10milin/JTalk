function insertem(index){
	var editor = $('.note-editable');
	var protocol = location.protocol;
	var host = location.host;
	var pathname = '/JTalk/dist/emoticons/';
	var url = protocol + '//' + host + pathname + index + '.gif';
	var tag = '<p><img src="' + url + '" width="80px" height="80px"></p>';
	$('.modal').last().modal('hide');
	editor.append(tag);
	
}