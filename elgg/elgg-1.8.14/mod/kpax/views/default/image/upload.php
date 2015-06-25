<?php
/**
 * Image upload view
 * Seems better to use $vars['entity'] but not implemented
 * guid is needed to implement a remove button.
 *
 * @uses $vars['src']           Image path
 * @uses $vars['alt']            Alternate description
 * @uses $vars['title']          Title attribute
 */
$current_image = elgg_view('output/img', array(
	'src' => $vars['src'],
	'alt' => $vars['alt'] ? $vars['alt'] : '',
	'title' => $vars['title'] ? $vars['title'] : NULL,
));

$current_label = elgg_echo('kPAX:game:image');

$remove_button = '';
if ($vars['guid']) {
	$remove_button = elgg_view('output/url', array(
		'text' => elgg_echo('remove'),
		'title' => elgg_echo('remove'),
		'href' => 'action/kpax/image/remove?guid=' . elgg_get_page_owner_guid(),
		'is_action' => true,
		'class' => 'elgg-button elgg-button-cancel mll',
	));
}
$form_params = array('enctype' => 'multipart/form-data');
$upload_form = elgg_view_form('kpax/image/upload', $form_params, $vars);

?>

<p class="mtm">
	<?php echo elgg_echo('kpax:image:upload:instructions'); ?>
</p>

<?php

$image = <<<HTML
<div id="current-image" class="mrl prl">
	<label>$current_label</label><br />
	$current_image
</div>
$remove_button
HTML;

$body = <<<HTML
<div id="image-upload">
	$upload_form
</div>
HTML;

echo elgg_view_image_block($image, $upload_form);
