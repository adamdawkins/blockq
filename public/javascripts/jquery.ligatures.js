/*
  Ligatures Plugin for jQuery
  Version: v0.1

  Copyright (C) 2010 by Lutz Issler

  Systemantics GmbH
  Am Lavenstein 3
  52064 Aachen
  GERMANY

  Web:    www.systemantics.net
  Email:  hello@systemantics.net

  This plugin is distributed under the terms of the
  GNU Lesser General Public license. The license can be obtained
  from http://www.gnu.org/licenses/lgpl.html.

*/

(function() {
	var lg = [
	// ASD: ff, ffi and ffl not supported in Georgia
			//	["ffi", 64259],
				["fi", 64257],
		//		["ff", 64256],
				["fl", 64258],
	//			["ffi", 64259],
		//		["ffl", 64260]
			];
	function ligatures(el) {
		var e = jQuery(el);
		if (el.nodeType==3) {
			var text = e.text();
			for (var i=0; i<lg.length; i++) {
				text = text.replace(lg[i][0], String.fromCharCode(lg[i][1]));
			}
			e.replaceWith(text);
		} else {
			e.contents().each(function() {
				ligatures(this);
			});
		}
	};
	jQuery.fn.ligatures = function() {
		this.each(function() {
			ligatures(this);
		});
	}
})();
