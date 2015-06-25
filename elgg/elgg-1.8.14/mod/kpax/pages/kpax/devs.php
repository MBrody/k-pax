<?php
$title = elgg_echo('kpax:devs:explanations:title');

// "My games" button
elgg_register_menu_item('title', array(
                 'name' => 'dev_games',
                 'href' => 'kpax/dev_games',
                 'text' => elgg_echo('kPAX:myGames'),
                 'link_class' => 'elgg-button elgg-button-action',
             ));

// "Add games" button
elgg_register_menu_item('title', array(
                 'name' => 'add',
                 'href' => 'kpax/add',
                 'text' => elgg_echo('kPAX:add'),
                 'link_class' => 'elgg-button elgg-button-action',
             ));

$intro_content = elgg_echo('kpax:devs:explanations:section:intro:content');
$construction_title = elgg_echo('kpax:devs:explanations:section:construction:title');
$construction_content = elgg_echo('kpax:devs:explanations:section:construction:content');
$development_title = elgg_echo('kpax:devs:explanations:section:games_development:title');
$develpoment_content = elgg_echo('kpax:devs:explanations:section:games_development:content');
$apps_title = elgg_echo('kpax:devs:explanations:section:apps_development:title');
$apps_content = elgg_echo('kpax:devs:explanations:section:apps_development:content');
//$content = elgg_view_menu('title');
$content .= <<<HTML
<div class="elgg-content">
    $intro_content
    <h3 class="section-title">$construction_title</h3>
    $construction_content
    <h3 class="section-title">$development_title</h3>
    $development_content
    <h3 class="section-title">$apps_title</h3>
    $apps_content
</div>
HTML;

$params = array(
'content' => $content,
'title' => $title,
'filter' => false,  // All, Mine and Friends tabs are not shown
);

$body = elgg_view_layout('content', $params);

echo elgg_view_page($params['title'], $body);

?>