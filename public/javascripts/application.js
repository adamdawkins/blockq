$(document).ready(function(){
	var $quotes = $(".quote", "#main");
	$quotes.ligatures();
	$quotes.find('.text').widowFix();
});