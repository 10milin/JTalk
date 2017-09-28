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
 
function actiondownload(href, fileName, originFileName){
	var form = document.createElement('FORM');
	form.method='POST';
	form.action='/JTalk/' + href;
	
	var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "fileName");
    hiddenField.setAttribute("value", fileName);
    form.appendChild(hiddenField);
    
    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "originFileName");
    hiddenField.setAttribute("value", originFileName);
    form.appendChild(hiddenField);
    
	document.getElementById('actionpost').appendChild(form);
	form.submit();
}

function anonydelete(href, num, main){
	var form = document.createElement('FORM');
	form.method='POST';
	form.action='/JTalk/' + href;
	
	var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "num");
    hiddenField.setAttribute("value", num);
    form.appendChild(hiddenField);
    
    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "main");
    hiddenField.setAttribute("value", main);
    form.appendChild(hiddenField);
    
	document.getElementById('actionpost').appendChild(form);
	form.submit();
}