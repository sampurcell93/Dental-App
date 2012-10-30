/* Use this script if you need to support IE 7 and IE 6. */

window.onload = function() {
	function addIcon(el, entity) {
		var html = el.innerHTML;
		el.innerHTML = '<span style="font-family: \'icomoon\'">' + entity + '</span>' + html;
	}
	var icons = {
			'icon-enter' : '&#x22;',
			'icon-folder-1' : '&#x23;',
			'icon-upload' : '&#x21;',
			'icon-book' : '&#x24;',
			'icon-zoom-in' : '&#x25;',
			'icon-upload-2' : '&#x26;',
			'icon-upload-1' : '&#x27;',
			'icon-plus' : '&#x28;',
			'icon-plus-1' : '&#x29;',
			'icon-cog' : '&#x2a;',
			'icon-backspace' : '&#x2b;',
			'icon-backspace-1' : '&#x2c;'
		},
		els = document.getElementsByTagName('*'),
		i, attr, html, c, el;
	for (i = 0; i < els.length; i += 1) {
		el = els[i];
		attr = el.getAttribute('data-icon');
		if (attr) {
			addIcon(el, attr);
		}
		c = el.className;
		c = c.match(/icon-[^\s'"]+/);
		if (c) {
			addIcon(el, icons[c[0]]);
		}
	}
};