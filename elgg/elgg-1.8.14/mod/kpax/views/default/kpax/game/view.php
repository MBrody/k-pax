<?php
/**
 * This template prints game content in full view
 *
 */
//TODO: This sould be a function prepare_game_read_vars($game)
$campusSession = $_SESSION["campusSession"];
$game = $vars['game'];
isset($game->name) ? $title = $game->name : $title = NULL; 
isset($game->slogan) ? $slogan = $game->slogan : $slogan = NULL;


if (isset($game->urlImage)) {
	//TODO: urlimages must be file entities file->grabfile()
	$image_vars = array(
		'file_path' => $game->urlImage,
		'alt' => $game->name,
		'title' => $game->name,
		'class' => 'rounded',
		);
	$image = elgg_view('image/view', $image_vars);
}else{
	$image = kpax_default_game_image($atts = array('class' => 'rounded', 'alt' => $title));
}

isset($game->created) ? $created = $game->dateCreation : $created = '00/00/00';
$created_label = elgg_echo('kpax:created');

isset($game->price) ? $price = $game->price : $price = '0,00 €';
$play_label = elgg_echo('kpax:game:play');
$buy_label = elgg_echo('kpax:game:buy');
$wishlist_label = elgg_echo('kpax:game:wishlist');

// TODO: getDeveloper($campusSession, $game->idCategory);
//$developername = $objKpax->getDeveloper($campusSession, $game->idDeveloper)->name;
isset($game->idDeveloper) ? $developer = $game->idDeveloper : $developer = 'Developer';
// TODO: detect if kpax user is developer $is_developer

isset($game->descripGame) ? $game_description = $game->descripGame : $game_description = NULL;
$description_label = elgg_echo('kPAX:game:description');

//$game_content['field'] = build_field($field_type, $field_name, $game);
//$game_content['developer'] = $objectKpax->getUser($campusSession, $game->idDeveloper)

// This part slows the process of loading games
// TODO: To improve its better to have game properties as obects not with ids 
$objKpax = new kpaxSrv(elgg_get_logged_in_user_entity()->username);
$category = $objKpax->getCategory($campusSession, $game->idCategory)->name;
$skill = $objKpax->getSkill($campusSession, $game->idSkill)->name;
$platform = $objKpax->getPlatform($campusSession, $game->idPlatform)->name;
$tags = $objKpax->getTagsGame($campusSession, $game->idGame);

// Create comments section
//$comments_label = elgg_echo('kpax:comments_label');
// TODO: Create a comment stats view like Google play
//$comments_stats
// TODO: Create a comment container
//$comments

// TODO: Create a TODAY section with changelog of game apps
//$today_label
//$today


// Create Rating section
//TODO: getRating($campusSession, $idGame);
$siteurl = elgg_get_site_url(); // or elgg_normalize_url('/kpax/view...')
$rating_container = '<div class="rating-container"><a href="'. $siteurl .'kpax/game/view/'.
					$game->idGame .'/#details" class="click-target" title="'.
					$game->name .'"><div class="star-rating-white"><div class="star-rating-black"></div></div></a></div>';

// Create Media section based on media game field
//TODO: Create view kpax/game/media & game field media
//$list_media_thumnails = elgg_view('kpax/game/media', array($game->media));


// Create More info section based on Game Metadata
$more_info_label = elgg_echo('kpax:more_info_label');
if (isset($game->metadatas)){
	$more_info = '<div class="meta-info-wrapper">';
	foreach ($game->metadatas as $key => $value) {
		if (isset($value)){
			$more_info .= "<div class='meta-info'><div class='title'>" .
			$value->keyMeta . "</div><div class='content'>". 
			$value->valueMeta . "</div></div>";
		}
	}
	$more_info .= '</div>';
}

/* Get similar games */
$recommend_label = elgg_echo('kpax:recommend_label');
$similarGameList = $objKpax->getListSimilarGames($game->idGame, $campusSession);
if (isset($similarGameList)){
	if (count($similarGameList) < 9) {
		$list_recommendations = elgg_view('kpax/game/row', array('objGameList' => $similarGameList));
	}
	else{
		$multiplelist_recomendations = array_chunk ( $similarGameList, 8 , TRUE);
		$list_recommendations = elgg_view('kpax/game/row', array('objGameList' => $multiplelist_recomendations[0]));
		//TODO: prepare for navigation with multiple list.
	}
}
/* Get same developer games */
$same_developer_label = elgg_echo('kpax:same_developer_label');
$same_dev_gamelist = NULL;//$objKpax->getListSameDeveloperGames($game->idDeveloper, $campusSession);
$list_same_developer = NULL

/*
$list_media_thumnails
*/
?>

<div class="game">
	<div id="details" class="game-details">
		<div class="game-image-wrapper">
			<div class="game-image">
					<?php print $image; ?>
			</div>
			<div class="game-info-wrapper">
				<h1 class="game-title" itemprop="name"><?php print $title; ?>
					<span class="slogan"><?php print $slogan; ?><span></h1>
				<div class="developer info-item" itemprop="author">
					<?php print $developer; ?>
				</div>
				<div class="created info-item">
					<?php print '-'. $created_label .': '. $created; ?>
				</div>
				<div class="skill info-item">
					<?php print '-'. $skill; ?>
				</div>
				<div class="category info-item">
					<?php print $category; ?>
				</div>
				<div class="action-buttons">
					<button id="play_button" ><?php print $play_label; ?></button>
					<button id="buy_button" ><?php print $buy_label.': '.$price; ?></button>
					<button id="wishlist_button"><?php print $wishlist_label; ?></button>
					<?php if (elgg_is_admin_logged_in() || $is_developer) : ?>
					<a class="edit_button" title="<?php elgg_echo('edit'); ?>"href="<?php print elgg_normalize_url('kpax/game/edit/'. $game->idGame); ?>"><?php echo elgg_echo('edit'); ?></button>
					<?php endif; ?>
				</div>
				<?php if (isset($rating_container)) : ?>
					<div class="separator"></div>
					<div class="feedback info-item">
					<?php print $rating_container; ?>
				</div>
				<?php endif; ?>
			</div>
		</div>
<!-- section with media files & screenshots for this game !-->
<?php //if (isset($list_media_thumnails)) : ?>
	<div class="details-section media-content">
		<div class="thumnails-wrapper">
			<?php //print $list_media_thumnails; ?>
			<h1><?php print 'Demo Content'; ?></h1>

			<div data-expand-target="thumbnails" class="thumbnails">
	<span class="details-trailer">
		<span class="video-image-wrapper">
			<img src="//i.ytimg.com/vi/NsVNMc7-QDs/hqdefault.jpg" class="video-image">
		</span>
		<span data-video-url="https://www.youtube.com/embed/NsVNMc7-QDs?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;autoplay=1" data-docid="com.djit.apps.edjing.expert" class="preview-overlay-container">
			<span data-video-url="https://www.youtube.com/embed/NsVNMc7-QDs?ps=play&amp;vq=large&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;autoplay=1" class="play-action-container">
				<span class="play-action"></span>
			</span>
		</span>
	</span>
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/wj_lpQ1eHvPg6sNaN9lRoDBMyR13rd0keXNJWQCVTZVst7PUH54DXnw_XLn5sC_VqMw=h310" data-expand-to="full-screenshot-0" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/VCYn6euR6J7zk-yvPiBSrMZb5cO2Hh5tuTuc1sScJth_KDIfl_0IJI67BqwIA4cEwqks=h310" data-expand-to="full-screenshot-1" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/kieajb1JYf-y-DIywHN0CnVdd7do42W2Nya4UqFEPdAsEwEqNACjJt5q93WGjYdNsoSw=h310" data-expand-to="full-screenshot-2" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/vWMlDI3m9dEhe6y6AqczhyV8iAsDFWYWGFehYUZ2ZRi-D-lLtJ1NlXP50_ft7KLpla4=h310" data-expand-to="full-screenshot-3" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/m-G37QVgsxUmWQyfoul8IYdVdaKeQKEDsIB_iglxG-NiBnvC8URIQM7hYWnvh0LsSrXy=h310" data-expand-to="full-screenshot-4" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/p7qlQofj4kiuwhgFl6cHAYmKLpLPd0AjlXLZcnkl8xbIUqHi75zvmlmATCVf7HOPxzNU=h310" data-expand-to="full-screenshot-5" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/LvSQGU5BcAsAQfm7RxtjKlB79PxWHwUNC-7CyZhnay52vFhMf8JOE0WyuqAUmrkU1g=h310" data-expand-to="full-screenshot-6" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/VObPbTlmxknLvMd0UGvW7j9JJfHOmn8FgNrtd5RXJ2ZtjCzLxYIg24coiHtZyviaQA=h310" data-expand-to="full-screenshot-7" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/4CbFKSakz0uX3ybM5frqYlKijU1onL1JS0LYOTDdPMBg2Nl4EGU_3IS_-WMEyRH-ng=h310" data-expand-to="full-screenshot-8" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/dtsmpbbO_Axm6CvGRvHwtOYPI2pTV4FTaiZZCXT5kpR_uqcaD927fZKA_KZpzYDie1x6=h310" data-expand-to="full-screenshot-9" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/9qsi_viNaNfGSnltrwjzkH_Fji9p-m0Fx6IpL8zXu9sS-Xa91_V0swnMsHotJMY6mg=h310" data-expand-to="full-screenshot-10" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/Xyo3ENNVzqLRDkEavPQ2UI1kxxsEpdOkNAOMc_j34MUT1du8NQACDuzyyzSh5OrFMw=h310" data-expand-to="full-screenshot-11" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/1rDHjdJchvimPNbS0v25ke-jrsAogycci99NMsNmZrOnsAQ2FJp1CxE7Xnmn4ljYLvE=h310" data-expand-to="full-screenshot-12" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/08OYOhV7nlMNktwKzZUU2j7tQ8edYGiQeEpFAxH_EZ_SAxuB2G-hl8RoKLbf-tLqZ74=h310" data-expand-to="full-screenshot-13" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/eENt4oIBjuRlKPf3rrKbTQTKgrCw5P1ZEA82-a_Hf6zoBPrcRDc7jIVB1C3Y9Q969w=h310" data-expand-to="full-screenshot-14" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/i06H2dO1IvRBW-_TwBwKC2QxUSy5rsNCkPXr_T0u6FYvQx2QN8roYnyMRhEobY2374Dg=h310" data-expand-to="full-screenshot-15" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/h0JvhtfoeJc-iN75IlliJiCxrU9ZErVl_YjfL-720WuqIUad9DuTbESK8MTKGAFOrAE=h310" data-expand-to="full-screenshot-16" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
	<img itemprop="screenshot" src="https://lh3.googleusercontent.com/jntroampfZU1ha-dcrpAKyBjNPmsiLlu-YV2NOjj_HQiOjzfsALirzogJqoagR2Tmlg=h310" data-expand-to="full-screenshot-17" alt="edjing PRO - consola de DJ - screenshot thumbnail" class="screenshot clickable">
</div>

		</div>
		<div class="pager">
			<span class="media-toggle"></span>
		</div>
	</div>
<?php //endif; ?>
<?php if (isset($game_description)) : ?>
	<div class="details-section game-description">
		<h1 class="section-title"><?php print $description_label; ?></h1>
		<div class="description"><?php print $game_description; ?></div>
	</div>
<?php endif; ?>
<!-- section with comments for this game !-->
<?php if (isset($comments)) : ?>
	<div class="details-section comments-conainer">
		<h1 class="section-title"><?php print $comments_label; ?></h1>
		<?php print $comments_stats; ?>
		<?php print $comments; ?>
		<div class="pager">
			<span class="media-toggle"></span>
		</div>		
	</div>
<?php endif; ?>
<!-- section with changelog for this game !-->
<?php if (isset($today) || isset($more_info)) : ?>
	<div class="details-section extra-container">
		<?php if (isset($today)) : ?>
			<h1 class="section-title"><?php print $today_label; ?></h1>
			<?php print $today; ?>
		<?php endif; ?>
		<?php if (isset($today) && isset($more_info)) : ?>
			<div class="separator"></div>
		<?php endif; ?>
		<?php if (isset($more_info)) : ?>
			<h1 class="section-title"><?php print $more_info_label; ?></h1>
			<?php print $more_info; ?>
		<?php endif; ?>
	</div>
<?php endif; ?>
<!-- section with recommendations for this game !-->
<?php if (isset($list_recommendations)) : ?>
	<div class="details-section recommendation-container">
		<h1 class="section-title"><?php print $recommend_label; ?></h1>
		<?php print $list_recommendations; ?>
	</div>
<?php endif; ?>
<!-- section with same developer !-->
<?php if (isset($list_same_developer)) : ?>
	<div class="details-section same-developer-container">
		<h1 class="section-title"><?php print $same_developer_label; ?></h1>
		<?php print $list_same_developer; ?>
	</div>
<?php endif; ?>
</div>
