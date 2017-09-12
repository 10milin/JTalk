function actionlink(href){
	var form = document.createElement('FORM');
	form.method='POST';
	form.action='/JTalk/' + href;
	document.getElementById('actionpost').appendChild(form);
	form.submit();
}

function actionparam(href, param){
	var form = document.createElement('FORM');
	form.method='POST';
	form.action='/JTalk/' + href;
	
	var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "num");
    hiddenField.setAttribute("value", param);
    form.appendChild(hiddenField);
    
	document.getElementById('actionpost').appendChild(form);
	form.submit();
}
 