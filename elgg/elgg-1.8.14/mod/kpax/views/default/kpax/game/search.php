<?php
/**
 * This template loads games owned by logged in kpax user
 * and allow developer search like in games section
 *
 * Developer games page template needs another
 * refactor to be more flexible to template changes
 *
 * Probably a better schema for this page should be
 * Call to a elgg_view left menu (vertical) with a flexible
 * filter type for example: by Platform/Category/...
 * Then call a create form search that builds all form options remembering last selected
 * Finally create an html/php template that prints all content structure
 *
 */
/* Get available categories, platforms and skills in kPAX probably on elgg cache*/
$objKpax = new kpaxSrv(elgg_get_logged_in_user_entity()->username);
$categories = $objKpax->getCategories($_SESSION["campusSession"]);
$platforms = $objKpax->getPlatforms($_SESSION["campusSession"]);
$skills = $objKpax->getSkills($_SESSION["campusSession"]);
$metadatas = $objKpax->getMetaDatas($_SESSION["campusSession"]);

/* Default search values + remember last form value */
isset($_POST['name']) ? $name = $_POST['name'] : $name = " ";
isset($_POST['categories']) ? $category = $_POST['categories'] : $category = "0";
isset($_POST['platform']) ? $platform = $_POST['platform'] : $platform = "0";
isset($_POST['skills']) ? $ski = $_POST['skills'] : $ski = "0";
isset($_POST['tag']) ? $tag = $_POST['tag'] : $tag = " ";
isset($_POST['metadatas']) ? $keyMeta = $_POST['metadatas'] : $keyMeta = "0";
isset($_POST['valuemeta']) ? $valueMeta = $_POST['valuemeta'] : $valueMeta = " ";
//$sort is optional (default value = 1)
isset($_POST['sort']) ? $sort = $_POST['sort'] : $sort = "1";
//The first time the application shows the results, it shows the first result ($offset = 0) and 9 results ($limit = 9).
//$limit is every time 9, but offset depends on pagination
$limit = 9;
isset($_POST['offset']) ? $offset = $_POST['offset'] : $offset = 0;
$action = $vars['page'][1];

//Set title for menu_vertical
$vars['username'] == 'all' ? $title = elgg_echo('kpax:all'): $title = elgg_echo('kPAX:myowngames');

/* Call kPAX */
$gameList = $objKpax->getListGamesSearch($name, $category, $platform, $ski, $tag,
 $keyMeta, $valueMeta, $sort, $offset, $limit, $_SESSION["campusSession"], $vars['username']);

//Show status call to kPAX
isset($gameList->games) ? system_message(elgg_echo('kpax:list:success')) :  register_error(elgg_echo('kpax:list:failed'));

/* Search form*/
	if (elgg_is_admin_user(elgg_get_logged_in_user_entity()->guid)) {
		$content.="<div class='listado_juegos is_admin'>";
	}
	else {
		$content.="<div class='listado_juegos'>";
	}
		//START VERTICAL MENU
		$content.="<div class='menu_vertical'>";
			$content .="<div class='content'>";
			$content .="<h3 class='menu-title'>".$title."</h3>";
			$content .="<ul class='nav'>";
			//TODO: Make a restful api and create links not input elements for easy navigation and lower maintenance
				
				$selected="";
				if("0" == $platform){
					$selected="active";
				}
				$content .= "<li class='menu-item'><form method='post' action='". $action ."'>";
				$content .= "<fieldset>";
				$content .= "<input type='hidden' name='platform' value='0' />";
				$content .= "<input class='".$selected."' type='submit' value='".elgg_echo('kpax:game:allplatforms')."' />";
				$content .= "</fieldset>";
				$content .= "</form></li>";
				foreach($platforms as $plat)
				{
					$selected="";
					if($plat->idPlatform == $platform){
						$selected="active";
					}
					$content .= "<li class='menu-item'><form method='post' action='". $action ."'>";
					$content .= "<fieldset>";
					$content .= "<input type='hidden' name='platform' value='".$plat->idPlatform."' />";
					$content .= "<input class='".$selected."' type='submit' value='".$plat->name."' />";
					$content .= "</fieldset>";
					$content .= "</form></li>";
				}

		$content.="</ul>";
		// Add more links menu to add useful links like Help
		$content.="<ul class='nav more-links'><li class='menu-item'><a class='help' title='".
			elgg_echo('kpax:help') . "' href='". elgg_get_site_url() ."kpax/help'>" . elgg_echo('kpax:help') . "</a></li>
			<li class='menu-item'><a class='help' title='".
			elgg_echo('kpax:add') . "' href='". elgg_get_site_url() ."kpax/game/add'>" . elgg_echo('kpax:add') . "</a></li>
			</ul>";
		$content.="</div>";
		//toggle button for mobile menu
		$content .="<button type='button' class='elgg-icon toggle'><span class='sr-only hidden'>Toggle menu games</span><span class='elgg-icon icon-arrow closed'></button>";
		// END MENU
		$content .= "</div>";
			
		$content.="<div class='search-filter'>";
		//insert pagination forms before search forms. Nesting forms is forbbiden.
		//Pagination
			$content .= "<div class='pager'>";
				//Previous
			if ($gameList->offset > 0){
				$content .= "<div class='previous enabled'>";
				$content .= "<form method='post' action='". $action ."'>";
				$content .= "<fieldset>";
				$content .= "<input type='hidden' name='name' value='".$name."'/>";
				$content .= "<input type='hidden' name='category' value='".$category."'/>";
				$content .= "<input type='hidden' name='platform' value='".$platform."'/>";
				$content .= "<input type='hidden' name='skill' value='".$ski."'/>";
				$content .= "<input type='hidden' name='tag' value='".$tag."'/>";
				$content .= "<input type='hidden' name='keymeta' value='".$keyMeta."'/>";
				$content .= "<input type='hidden' name='valuemeta' value='".$valueMeta."'/>";
				$content .= "<input type='hidden' name='sort' value='".$sort."'/>";
				$content .= "<input type='hidden' name='offset' value='".($offset-$limit)."'/>";
				$content .= "<input type='submit' value='".elgg_echo('kpax:game:previous')."' />";
				$content .= "</fieldset>";
				$content .= "</form>";
			}
			else{
				$content .= "<div class='previous'>";
			}
				$content .= "</div>";
			if ($gameList->offset + $gameList->limit < $gameList->total->integer){
				//Next
				$content .= "<div class='next enabled'>";
				$content .= "<form method='post' action='". $action ."'>";
				$content .= "<fieldset>";
				$content .= "<input type='hidden' name='name' value='".$name."'/>";
				$content .= "<input type='hidden' name='category' value='".$category."'/>";
				$content .= "<input type='hidden' name='platform' value='".$platform."'/>";
				$content .= "<input type='hidden' name='skill' value='".$ski."'/>";
				$content .= "<input type='hidden' name='tag' value='".$tag."'/>";
				$content .= "<input type='hidden' name='keymeta' value='".$keyMeta."'/>";
				$content .= "<input type='hidden' name='valuemeta' value='".$valueMeta."'/>";
				$content .= "<input type='hidden' name='sort' value='".$sort."'/>";
				$content .= "<input type='hidden' name='offset' value='".($offset+$limit)."'/>";
				$content .= "<input type='submit' value='".elgg_echo('kpax:game:next')."' />";
				$content .= "</fieldset>";
				$content .= "</form>";
			}
			else{
				$content .= "<div class='next'>";
			}
				$content .= "</div>";
			$content .= "</div>";


			$content .= "<form method='post' action='". $action ."'>";
					$content .= "<input type='hidden' name='platform' value='".$platform."'/>";
					$content.="<ul class='menu_horizontal_top'>";
					//elgg_view ('input')
							$content.="<li class='menu-item-name'>";
							$content.="<input class='' type='text' name='name' id='name' value='".$name."'/>";
							$content.="<label for='name'>".elgg_echo('kpax:game:name').": </label>";
							$content.="</li>";
							$content.="<li class='menu-item-tag'>";
							$content.="<input class='' type='text' name='tag' id='tag' value='".$tag."'/>";
							$content.="<label for='tag'>".elgg_echo('kpax:game:tag').": </label>";
							$content.="</li>";
							$content.="<li class='menu-item-metadata'>";
							$content.="<input class='' type='text' name='valuemeta' id='valuemeta' value='".$valueMeta."'/>";
							$content.="<label for='metadata'>".elgg_echo('kpax:game:metadata').": </label>";
							$content.="</li>";
							$search_options = array('name' => 'name','tag' =>'tag','metadata' =>'metadata');
							$search_vars =  array(
								'value' => 'name', //default_value
								'options_values' => $search_options,
								'class' => 'input_filters',
								'id' => 'search_input_filters',
								'name' => 'search text filters',
								'title' => 'select search text filters',
								);
							$content.= elgg_view('input/dropdown', $search_vars);
							$content.="<input id='search_button' name='search_button' type='submit' value='".elgg_echo('kpax:game:search')."' />";

					$content.="</ul>";
					
					$content.="<ul class='menu_horizontal_bottom'>";
							// getCategories
							$content.="<li class='menu-item'>";
							$options = array();
							foreach ($categories as $cat) {
								$options[$cat->idCategory] = $cat->name;
							}
							array_unshift($options, elgg_echo('kpax:game:category'). ':' .elgg_echo('kpax:game:allskills'));
							$cat_vars =  array(
								'value' => $category, //default_value
								'options_values' => $options,
								'class' => 'filter categories',
								'id' => 'category',
								'name' => 'categories',
								'title' => 'categories',
								);
							$content.= elgg_view('input/dropdown', $cat_vars);
							$content.="<label class='hidden' for='category'>".elgg_echo('kpax:game:category').": </label>";
							$content.= "</li>";
							// getSkills
							$content.="<li class='menu-item'>";
							$options = array();
							foreach ($skills as $skill) {
								$options[$skill->idSkill] = $skill->name;
							}
							array_unshift($options, elgg_echo('kpax:game:skills'). ':' .elgg_echo('kpax:game:allskills'));
							$variables =  array(
								'value' => $ski, //default_value
								'options_values' => $options,
								'class' => 'filter skills',
								'id' => 'skill',
								'name' => 'skills',
								'title' => 'skills',
								);
							$content.= elgg_view('input/dropdown', $variables);
							$content.="<label class='hidden' for='skill'>".elgg_echo('kpax:game:skill').": </label>";
							$content.= "</li>";
							// getMetadatas
							$content.="<li class='menu-item'>";
							$options = array();
							foreach ($metadatas as $metadata) {
								$options[$metadata] = $metadata;
							}
							array_unshift($options, elgg_echo('kpax:game:metadata'). ':' .elgg_echo('kPAX:any'));
							$variables =  array(
								'value' => $keyMeta, //default_value
								'options_values' => $options,
								'class' => 'filter metadata',
								'id' => 'metadata',
								'name' => 'metadatas',
								'title' => 'metadatas',
								);
							$content.= elgg_view('input/dropdown', $variables);
							$content.="<label class='hidden' for='skill'>".elgg_echo('kpax:game:metadata').": </label>";
							$content.= "</li>";

/* Sort games */
$selectedordenacio1 = "";
$selectedordenacio2 = "";
$selectedordenacio3 = "";
$selectedordenacio4 = "";
$selectedordenacio5 = "";
if("1" == $sort)
	$selectedordenacio1 = "selected='selected'";
else if("2" == $sort)
	$selectedordenacio2 = "selected='selected'";
else if("3" == $sort)
	$selectedordenacio3 = "selected='selected'";
else if("4" == $sort)
	$selectedordenacio4 = "selected='selected'";
else if("5" == $sort)
	$selectedordenacio5 = "selected='selected'";

						$content.="<li class='menu-item'>";
						$content.="<label class='hidden' for='sort'>".elgg_echo('kpax:game:sort').": </label>";
						$content.="<select class='' name='sort' id='sort' >";
							$content.="<option value='1' ".$selectedordenacio1.">".elgg_echo('kpax:game:sortby').' '.elgg_echo('kpax:game:name')."</option>";
							$content.="<option value='2' ".$selectedordenacio2.">".elgg_echo('kpax:game:sortby').' '.elgg_echo('kpax:game:category')."</option>";
							$content.="<option value='3' ".$selectedordenacio3.">".elgg_echo('kpax:game:sortby').' '.elgg_echo('kpax:game:platform')."</option>";
							$content.="<option value='4' ".$selectedordenacio4.">".elgg_echo('kpax:game:sortby').' '.elgg_echo('kpax:game:skill')."</option>";
						$content.="</select>";
						$content.="</li>";

				$content.="</ul>";
			$content.="</form>";
			
			$content.="</div>";


/* Show results */
if(isset($gameList->games) && sizeof($gameList->games) > 0) { 
	$content .= elgg_view('kpax/game/row', array('objGameList' => $gameList->games));
}
else {
    $content .= '<div><p>' . elgg_echo('kpax:nogames') . '</p></div>';
}
//Pagination
			$content .= "<div class='pagination'>";
			if ($gameList->offset > 0){
				//Previous
				$content .= "<div class='previous'>";
				$content .= "<form method='post' action='". $action ."'>";
				$content .= "<fieldset>";
				$content .= "<input type='hidden' name='name' value='".$name."'/>";
				$content .= "<input type='hidden' name='category' value='".$category."'/>";
				$content .= "<input type='hidden' name='platform' value='".$platform."'/>";
				$content .= "<input type='hidden' name='skill' value='".$ski."'/>";
				$content .= "<input type='hidden' name='tag' value='".$tag."'/>";
				$content .= "<input type='hidden' name='keymeta' value='".$keyMeta."'/>";
				$content .= "<input type='hidden' name='valuemeta' value='".$valueMeta."'/>";
				$content .= "<input type='hidden' name='sort' value='".$sort."'/>";
				$content .= "<input type='hidden' name='offset' value='".($offset-$limit)."'/>";
				$content .= "<input type='submit' value='".elgg_echo('kpax:game:previous')."' />";
				$content .= "</fieldset>";
				$content .= "</form>";
				$content .= "</div>";
			}
			if ($gameList->offset + $gameList->limit < $gameList->total->integer){
				//Next
				$content .= "<div class='next'>";
				$content .= "<form method='post' action='". $action ."'>";
				$content .= "<fieldset>";
				$content .= "<input type='hidden' name='name' value='".$name."'/>";
				$content .= "<input type='hidden' name='category' value='".$category."'/>";
				$content .= "<input type='hidden' name='platform' value='".$platform."'/>";
				$content .= "<input type='hidden' name='skill' value='".$ski."'/>";
				$content .= "<input type='hidden' name='tag' value='".$tag."'/>";
				$content .= "<input type='hidden' name='keymeta' value='".$keyMeta."'/>";
				$content .= "<input type='hidden' name='valuemeta' value='".$valueMeta."'/>";
				$content .= "<input type='hidden' name='sort' value='".$sort."'/>";
				$content .= "<input type='hidden' name='offset' value='".($offset+$limit)."'/>";
				$content .= "<input type='submit' value='".elgg_echo('kpax:game:next')."' />";
				$content .= "</fieldset>";
				$content .= "</form>";
				$content .= "</div>";
				
			}
			$content .= "</div>";
		$content.="</div>"; //contenido
	$content.="</div>"; //listado_juegos


/* CSS include gamelist.css */
$css_url = 'mod/kpax/views/default/css/elements/gamelist.css';
elgg_register_css('gamelist', $css_url);
elgg_load_css('gamelist');
/* CSS include game_small.css */
$css_url = 'mod/kpax/views/default/css/elements/game_small.css';
elgg_register_css('game_small', $css_url);
elgg_load_css('game_small');
/* JS include kpax.js*/
$js_url = 'mod/kpax/js/kpax.js';
elgg_register_js('games_kpax', $js_url);
elgg_load_js('games_kpax');

 echo $content;
?>


