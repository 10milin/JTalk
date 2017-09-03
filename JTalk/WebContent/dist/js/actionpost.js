function actionlink(href){
	var form = document.createElement('FORM');
	form.method='POST';
	form.action='/JTalk/' + href;
	document.getElementById('actionpost').appendChild(form);
	form.submit();
}