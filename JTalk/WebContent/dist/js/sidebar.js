function toggle(){
		$.ajax({      
	        type:'POST',  
	        url:'/JTalk/toggle.ajax',
	        dataType: 'json',
	        success:function(result){   
	            
	        }
		});  
}