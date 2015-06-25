<?php
/**
 * Image upload form
 * 
 * Reference avatar upload
 */
?>
<div>
	<label><?php echo elgg_echo("kpax:image:upload"); ?></label><br />
	<?php echo elgg_view("input/file",array('name' => 'image')); ?>
</div>
<div class="elgg-foot">
	<?php echo elgg_view('input/hidden', array('name' => 'src', 'value' => $vars['file_path'])); ?>
	<?php //echo elgg_view('input/submit', array('value' => elgg_echo('upload'))); //TODO: Implement ajax upload ?>
</div>
