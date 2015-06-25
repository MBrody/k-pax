<?php
/**
 * Elgg title element
 *
 * @uses $vars['title'] The page title
 * @uses $vars['class'] Optional class for heading
 */
if (empty($vars['class'])) {
	$vars['class'] = 'page-title';
}
$class= '';
if (isset($vars['class'])) {
	$class = " class=\"{$vars['class']}\"";
}

echo "<h1{$class}>{$vars['title']}</h1>";
