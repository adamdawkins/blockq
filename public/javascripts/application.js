$(document).ready(function(){
	var $quotes = $(".quote", $("#main"));
	$quotes.find("blockquote").click(function(){
		window.location = "/quotes/"+$(this).parent().attr("id").split("_")[1];
	});
	$quotes.ligatures();
});