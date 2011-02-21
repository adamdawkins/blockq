$(document).ready(function(){
	var $main = $('#main'),
	 $quotes = $('.quote', $main);
	$quotes.ligatures();
	$('p, blockquote', $main).widowFix().ligatures();
	$('input:not[type=submit]','#users_new').focus(function(){
		var $this = $(this),
			$label = $this.siblings('label');
		$label.hide();
	}, function(){
		if ($this.val() === '') {
			$label.show();
		}
	});
});