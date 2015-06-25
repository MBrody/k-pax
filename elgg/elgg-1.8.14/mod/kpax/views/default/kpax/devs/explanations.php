<?php
/**
 * kPAX developers help page with content translation
 *
 */
$intro_content = elgg_echo('kpax:devs:explanations:section:intro:content');
$construction_title = elgg_echo('kpax:devs:explanations:section:construction:title');
$construction_content = elgg_echo('kpax:devs:explanations:section:construction:content');
$development_title = elgg_echo('kpax:devs:explanations:section:games_development:title');
$develpoment_content = elgg_echo('kpax:devs:explanations:section:games_development:content');
$apps_title = elgg_echo('kpax:devs:explanations:section:apps_development:title');
$apps_content = elgg_echo('kpax:devs:explanations:section:apps_development:content');

$content =
<<<HTML
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
echo $content;

?>