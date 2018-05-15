/* Global functions */

/* Body Lock Scroll */
function changeBodyOverflow(hidden){
	if(hidden == true){
		document.body.classList.add('no-scroll');
		document.getElementsByClassName('flipped')[0].classList.add('no-scroll');
	} else {
		document.body.classList.remove('no-scroll');
		document.getElementsByClassName('flipped')[0].classList.remove('no-scroll');
	}
}


/* Triggers */
AUI().ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/

	function() {
	}
);

Liferay.Portlet.ready(

	/*
	This function gets loaded after each and every portlet on the page.

	portletId: the current portlet's id
	node: the Alloy Node object of the current portlet
	*/

	function(portletId, node) {
	}
);

Liferay.on(
	'allPortletsReady', function(){

	/*
	This function gets loaded when everything, including the portlets, is on
	the page.
	*/

	/* Get the checkbox and watch for changes */
	let checkbox = document.getElementById('menu-checker');

	checkbox.addEventListener('change', function(){
		changeBodyOverflow(checkbox.checked);
	});

	$(window).on('load', function(){
		console.log('jquery')
	})

});