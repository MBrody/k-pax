<?php
/**
 * Elgg header logo
 */

$site = elgg_get_site_entity();
$site_name = $site->name;
$site_url = elgg_get_site_url();
?>

<div class="logo">
	<a class="elgg-heading-site" href="<?php echo $site_url; ?>">
		<?php //TODO: print an image logo;  ?>
		<?php echo $site_name; ?>
	</a>
</div>
