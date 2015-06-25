<?php
/**
 * Elgg image view content.
 *
 */

$file_path = elgg_get_data_path() . $vars['file_path'];

$contents = file_get_contents($file_path);
unset($vars['file_path']);
$base64 = base64_encode($contents);
$vars['src'] = 'data:image/png;base64,' . $base64;

$attributes = elgg_format_attributes($vars);
echo "<img $attributes/>";
//$image = '<img src="data:image/png;base64,'. $base64 .'" alt="'. $vars['alt'] .'" />';
//echo $image;
