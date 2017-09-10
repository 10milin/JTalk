$(document).ready(function() {
      $('.comment-edit').on( 'keyup', function (e){
    	  if(e.keyCode == 13 && $(this).val().length != 0){
    		  var text = $(this).parents('.comment-text').find('.comment-in');
        	  text.html($(this).val());
        	  $(this).parent().css('display', 'none');
        	  text.css('display', 'inline');
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