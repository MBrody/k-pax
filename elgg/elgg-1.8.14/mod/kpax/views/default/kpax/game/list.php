<?php
/**
 * This template print game content in list format
 *
 * @param $vars['game'] game object
 *
 */

$game = $vars['game'];
if (!isset($game->urlImage)){
	//get a default image for games without image
	$image = kpax_default_game_image($atts = array('class' => 'default-image', 'alt' => $game->name, 'title' => $game->name));
}
else {
		$image_vars = array(
		'file_path' => $game->urlImage,
		'alt' => $game->name,
		'title' => $game->name,
		'class' => 'rounded',
		);
	$image = elgg_view('image/view', $image_vars);
}
//TODO: create a lib function game_content($idGame)
// that returns a game object with all game content
// like blog module does with lib/blog
$campusSession = $_SESSION["campusSession"];
$objectKpax = new kpaxSrv(elgg_get_logged_in_user_entity()->username);
// Create kpaxgetUserId($user->guid)
// $game->developer return user object to compare
//$game->idDeveloper == kpaxgetUserId(elgg_get_logged_in_user_entity()->username)) ? $is_developer = TRUE : $is_developer = FALSE;

$category = $objectKpax->getCategory($campusSession, $game->idCategory);
$skill = $objectKpax->getSkill($campusSession, $game->idSkill);
$tags = $objectKpax->getTagsGame($campusSession, $idGame);


// TODO: make view list for kpax games tags like elgg default ('output/tags')
//$output_tags = elgg_view('kpax/tags/list', $tags);
?>
<div class="games small">
	<div class="game-content">
	<?php if (elgg_is_admin_logged_in() || $is_developer) : ?>
		<div class="contextual-links">
			<span id="context-toggle-<?php print $game->idGame; ?>" class="elgg-icon elgg-icon-settings-alt "></span>
			<ul class="menu hidden">
				<li>
					<a title="<?php elgg_echo('edit'); ?>"href="<?php print elgg_normalize_url('kpax/game/edit/'. $game->idGame); ?>"><?php echo elgg_echo('edit'); ?></a>
				</li>
				<?php
				/** not implemented 
				<li> <a title="<?php elgg_echo('remove'); ?>"href="<?php print elgg_normalize_url('kpax/remove/'. $game->idGame); ?>"><?php echo elgg_echo('remove'); ?></a></li> */
				?>
			</ul>
		</div>
	<?php endif; ?>
		<div class="cover">
			<a href="<?php print elgg_normalize_url('kpax/game/view/'. $game->idGame); ?>" class="click-target" title="<?php print $game->name; ?>">
					<?php print $image; ?>
			</a>
		</div>
		<h2><a href="<?php print elgg_normalize_url('kpax/game/view/'. $game->idGame); ?>" class="title"><?php print $game->name; ?></a></h2>
		<div class="details">
			<div class="subtitle-container">
				<a href="<?php print elgg_normalize_url('profile/'. $game->idDeveloper); ?>" class="subtitle">Developer link</a>
				<span class="paragraph-end"></span>
			</div>
			<div class="description-container hidden">
			<?php print elgg_get_excerpt($game->descripGame); ?>
			</div>
			<div class="category">
			<?php print $category->name; ?>
				<span class="paragraph-end"></span>
			</div>
			<div class="skill">
			<?php print $skill->name; ?>
				<span class="paragraph-end"></span>
			</div>
		</div>
		<div class="extra">
			<div class="rating-container">
				<a href="<?php print elgg_normalize_url('kpax/game/view/'. $game->idGame .'/#details'); ?>" class="click-target" title="<?php print $game->name; ?>">
				<div class="star-rating-white">
					<div class="star-rating-black">
					</div>
				</div>
				</a>
				<div class="price-container">
					<span>0,00 €</span>
				</div>
			</div>
		</div>
	</div>
</div>