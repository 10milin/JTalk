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