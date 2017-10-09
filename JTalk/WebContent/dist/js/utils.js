// Resolve conflict in jQuery UI tooltip with Bootstrap tooltip
  $.widget.bridge('uibutton', $.ui.button);

//action post
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

function actioncmtdelete(href, table, num){
	var form = document.createElement('FORM');
	form.method='POST';
	form.action='/JTalk/' + href;
	
	var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "table");
    hiddenField.setAttribute("value", table);
    form.appendChild(hiddenField);
	
	var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "num");
    hiddenField.setAttribute("value", num);
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

// 데이트 피커
var maxDate = new Date();
var dd = maxDate.getDate() + 15;
maxDate.setDate(dd);

$('#datepicker').datepicker({
    	autoclose: true,
    	endDate: maxDate
  })
// 데이트 레인지 피커
    $('#reservation').daterangepicker({
	  "locale": {
	        "format": "YYYY-MM-DD",
	        "separator": " ~ ",
	        "autoUpdateInput": false,
	        "applyLabel": "적용",
	        "cancelLabel": "취소",
	        "fromLabel": "From",
	        "toLabel": "To",
	        "customRangeLabel": "Custom",
	        "daysOfWeek": [
	            "일",
	            "월",
	            "화",
	            "수",
	            "목",
	            "금",
	            "토"
	        ],
	        "monthNames": [
	            "1월",
	            "2월",
	            "3월",
	            "4월",
	            "5월",
	            "6월",
	            "7월",
	            "8월",
	            "9월",
	            "10월",
	            "11월",
	            "12월"
	        ],
	        "firstDay": 1
	    }
  });
  
// 카테고리 체크
function categorycheck(obj){
	var category = obj.category;
	if(category.value == 'none'){
		$(category).closest('.input-group').addClass('has-error');
		return false;
	}else{
		$(category).closest('.input-group').removeClass('has-error');
		return true;
	}
}

$(document).ready(function() {
	   $('#category-default').css('color','gray');
	   $('#category-default').click(function() {
	        $('#category-default').css('color','black');
	   }); 
	});

//사이드바 토글
function toggle(){
	$.ajax({      
        type:'POST',  
        url:'/JTalk/toggle.ajax',
        dataType: 'json',
        success:function(result){   
        }
	});  
}

//팝업 라이브러리
function showmember(email){
	if($('#sendId').val() != email && email != 'admin'){
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

// 숫자만 입력제한
function onlyNumberInput(Ev) {
	    if (window.event) var code = window.event.keyCode;
	    else var code = Ev.which;
	
	    if ((code > 34 && code < 41) || (code > 47 && code < 58) || (code > 95 && code < 106) || code == 8 || code == 9 || code == 13 || code == 46)    {
	            window.event.returnValue = true;
	            return;
	    }
	
	    if (window.event) window.event.returnValue = false;
	    else Ev.preventDefault();
}

// 연락처 불러
function checkphone(obj){
	var regExp = /^\d{3}-\d{4}-\d{4}$/;
	var val = $(obj).val();
	if($(obj).val().length != 0){
		if(!val.match(regExp)){
			$(obj).val('');
			$(obj).closest('.input-group').addClass('has-error');
		}else{
			$(obj).closest('.input-group').removeClass('has-error');
		}
	}
}
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

//메시지 클릭시 작성으로 바로 이동
function writelink(name, email){
	$('#table-msglist').css('display', 'none');
	$('#div-msgwrite').css('display', 'block');
	$('#reciveId').val(email);
	$('#emailserach-input').val(name);
}

//메시지 선택 삭제
function deletechoice(){
	$('#check-form').submit();
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

//회원가입 유효성검사
function checkemail(obj){
	if($(obj).val().length == 0){
		$(obj).parent().removeClass('has-error');
		$('#msg-email').css('display', 'none');
		return;
	}
	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(!regEmail.test($(obj).val())){
		$('#msg-content').html('이메일 주소가 유효하지 않습니다.');
		$(obj).parent().addClass('has-error');
		$('#msg-email').css('display', 'block');
	}else{
		$.ajax({ 
			url: '/JTalk/emailcheck.ajax', 
			data: "email=" + $(obj).val(), 
			dataType: 'json', 
			type: 'POST',
			success: function(e){
				var result = e.result;
				if(result == 0){
					$('#msg-content').html('이미 존재하는 이메일 주소입니다.');
					$(obj).parent().addClass('has-error');
					$('#msg-email').css('display', 'block');
				}else{
					$(obj).parent().removeClass('has-error');
					$('#msg-email').css('display', 'none');
				}
			}
		});
	}
}

//비밀번호 확인 체크
function checkpass(){
	var a = $('#pass-a').val();
	var b = $('#pass-b').val();
	
	if(a.length == 0 || b.length == 0){
		$('#pass-a').parent().removeClass('has-error');
		$('#pass-b').parent().removeClass('has-error');
		$('#msg-pass').css('display', 'none');
		return;
	}
	
	if(a != b){
		$('#msg-content2').html('비밀번호가 일치 하지 않습니다.');
		$('#pass-a').parent().addClass('has-error');
		$('#pass-b').parent().addClass('has-error');
		$('#msg-pass').css('display', 'block');
	}else if(a.length < 4){
		$('#msg-content2').html('비밀번호는 최소 4자 이상입니다.');
		$('#pass-a').parent().addClass('has-error');
		$('#pass-b').parent().addClass('has-error');
		$('#msg-pass').css('display', 'block');
	}else{
		$('#pass-a').parent().removeClass('has-error');
		$('#pass-b').parent().removeClass('has-error');
		$('#msg-pass').css('display', 'none');
	}
}

// 회원가입 버튼 클릭
function checkval(){
	var check = $('#rg-form').find('.has-error');
	if(check.length == 0){
		return true;
	}
	return false;
}

// 코멘트 수정 Aajax
$(document).ready(function() {
	$('#address').on( 'keyup', function (e){
	  	  if(e.keyCode == 13 && $(this).val().length != 0){
	  		initialize();
	  	  }
	    });
	
    $('.comment-edit').on( 'keyup', function (e){
  	  if(e.keyCode == 13 && $(this).val().length != 0){
  		  var text = $(this).parents('.comment-text').find('.comment-in');
      	  text.html($(this).val());
      	  $(this).parent().css('display', 'none');
      	  text.css('display', 'inline');
      	  $.ajax({ 
				url: '/JTalk/cmtmodify.ajax', 
				data: $(this).parents('.cmt').serialize(), 
				dataType: 'json', 
				type: 'POST'
			});
      	  
  	  }else{
  		  $(this).focus();
  	  }
    });
    
    $('.comment-edit-btn').on( 'click', function (e){
		  var text = $(this).parents('.comment-text').find('.comment-in');
		  var edit = $(this).parents('.comment-text').find('.comment-edit');
		  if(edit.val().length != 0){
			  text.html(edit.val());
	    	  edit.parent().css('display', 'none');
	    	  text.css('display', 'inline');
	    	  $.ajax({ 
	  				url: '/JTalk/cmtmodify.ajax', 
	  				data: $(this).parents('.cmt').serialize(), 
	  				dataType: 'json', 
	  				type: 'POST'
	  			});
		  }else{
			  edit.focus();
		  }
  	  
    });
});

function editstart(obj){
	var obj = $(obj);
	var edit = obj.parents('.comment-text').find('.comment-edit');
	var editdiv = edit.parent();
	var text = obj.parents('.comment-text').find('.comment-in');
	edit.val(text.html());
	editdiv.css('display', 'table');
	text.css('display', 'none');
	edit.focus();
}

//information 판넬 스위칭
$('#it-btn').on('click', function(){
	  $('#it-panel').css('display','inline');
	  $('#jp-panel').css('display','none');
	  $('#rst-panel').css('display','none');
	  $('#life-panel').css('display','none');
});

$('#jp-btn').on('click', function(){
	  $('#it-panel').css('display','none');
	  $('#jp-panel').css('display','inline');
	  $('#rst-panel').css('display','none');
	  $('#life-panel').css('display','none');
});

$('#rst-btn').on('click', function(){
	  $('#it-panel').css('display','none');
	  $('#jp-panel').css('display','none');
	  $('#rst-panel').css('display','inline');
	  $('#life-panel').css('display','none');
});

$('#life-btn').on('click', function(){
	  $('#it-panel').css('display','none');
	  $('#jp-panel').css('display','none');
	  $('#rst-panel').css('display','none');
	  $('#life-panel').css('display','inline');
});

$('#it-btn').mouseenter(function(){
	$('#it-ico').css('opacity','0.6');
});

$('#it-btn').mouseleave(function(){
	$('#it-ico').css('opacity','1');
});

$('#jp-btn').mouseenter(function(){
	$('#jp-ico').css('opacity','0.6');
});

$('#jp-btn').mouseleave(function(){
	$('#jp-ico').css('opacity','1');
});

$('#rst-btn').mouseenter(function(){
	$('#rst-ico').css('opacity','0.6');
});

$('#rst-btn').mouseleave(function(){
	$('#rst-ico').css('opacity','1');
});

$('#life-btn').mouseenter(function(){
	$('#life-ico').css('opacity','0.6');
});

$('#life-btn').mouseleave(function(){
	$('#life-ico').css('opacity','1');
});

//검색창 열기
function searchbar(btn){
	  var st = $('#searchbar').attr('toggle');
	  if(st == 0){
		  $('#searchbar').css('display', 'inline-table');
		  $('#searchbar').find('.form-control').focus();
		  $('#searchbar').attr('toggle','1');
	  }else{
		  $('#searchbar').css('display', 'none');
		  $('#searchbar').attr('toggle','0');
	  }
}