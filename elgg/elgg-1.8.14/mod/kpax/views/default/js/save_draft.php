<?php
/**
 * Save draft through ajax
 *
 * @package Game
 */
?>
elgg.provide('kpax.game');

//TODO: Review and integrate save draft to kpax games

/*
 * Attempt to save and update the input with the guid.
 */
kpax.game.saveDraftCallback = function(data, textStatus, XHR) {
	if (textStatus == 'success' && data.success == true) {
		var form = $('form[id=kpax-game-edit]');

		// update the guid input element for new posts that now have a guid
		form.find('input[name=guid]').val(data.guid);

		oldDescription = form.find('textarea[name=description]').val();

		var d = new Date();
		var mins = d.getMinutes() + '';
		if (mins.length == 1) {
			mins = '0' + mins;
		}
		$(".game-save-status-time").html(d.toLocaleDateString() + " @ " + d.getHours() + ":" + mins);
	} else {
		$(".game-save-status-time").html(elgg.echo('error'));
	}
};

kpax.game.saveDraft = function() {
	if (typeof(tinyMCE) != 'undefined') {
		tinyMCE.triggerSave();
	}

	// only save on changed content
	var form = $('form[id=kpax-game-edit]');
	var description = form.find('textarea[name=description]').val();
	var title = form.find('input[name=title]').val();

	if (!(description && title) || (description == oldDescription)) {
		return false;
	}
//TODO: Create an action auto_save_revision for kpax games
	var draftURL = elgg.config.wwwroot + "action/kpax/auto_save_revision";
	var postData = form.serializeArray();

	// force draft status
	$(postData).each(function(i, e) {
		if (e.name == 'status') {
			e.value = 'draft';
		}
	});

	$.post(draftURL, postData, kpax.game.saveDraftCallback, 'json');
};

kpax.game.init = function() {
	// get a copy of the body to compare for auto save
	oldDescription = $('form[id=kpax-game-edit]').find('textarea[name=description]').val();
	
	setInterval(kpax.game.saveDraft, 60000);
};

elgg.register_hook_handler('init', 'system', kpax.game.init);