if (typeof jQuery == 'undefined') {
	var jQ = document.createElement('script');
	jQ.type = 'text/javascript';
	jQ.onload=init();
	jQ.src = 'http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js';
	document.body.appendChild(jQ);
} else {
	init();
}




function init() {
	var selectedText = "";
	var possibleAuthor;
	selectedText = getSelected();
	if(selectedText == "" || selectedText == null){
		alert("please select some text to add it to your blockq quotes.")
	}
	else {
		//possibleAuthor = $("cite:first").children().first().html();
		
		location.href = 'http://lvh.me:3000/quotes/new?t='+selectedText+'&amp;s='+window.location.href//+'&amp;a='+possibleAuthor;
		
		// Inline - we'll do that later
		/*	$("body").append("\
			<div id='blockqframe'>\
				<div id='blockqframe_veil' style=''>\
					<p>Citing...</p>\
				</div>\
				<iframe src='http://lvh.me:3000/quotes/new?t="+selectedText +"onload=\"$('#blockqframe iframe').slideDown(500);\">Enable iFrames.</iframe>\
				<style type='text/css'>\
					#blockqframe_veil { display: none; position: fixed; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(255,255,255,.25); cursor: pointer; z-index: 900; }\
					#blockqframe_veil p { color: black; font: normal normal bold 20px/20px Helvetica, sans-serif; position: absolute; top: 50%; left: 50%; width: 10em; margin: -10px auto 0 -5em; text-align: center; }\
					#blockqframe iframe { display: none; position: fixed; top: 10%; left: 10%; width: 80%; height: 80%; z-index: 999; border: 10px solid rgba(0,0,0,.5); margin: -5px 0 0 -5px; }\
				</style>\
			</div>");
			$("#blockqframe_veil").fadeIn(750);
			*/
	}
}

function getSelected() {
	if(window.getSelection) { return window.getSelection(); }
	else if(document.getSelection) { return document.getSelection(); }
	else {
		var selection = document.selection && document.selection.createRange();
  	if(selection.text) { return selection.text; }
  	return false;
	}
  return false;
}