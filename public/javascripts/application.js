$(document).ready(function(){
	var $main = $('#main'),
	 $quotes = $('.quote', $main);
	$quotes.ligatures();
	$('p, blockquote', $main).widowFix();
});