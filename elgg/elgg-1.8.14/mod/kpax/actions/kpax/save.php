<?php
/**
 * Save kpax game entity
 *
 * Can be called by clicking save button or preview button. If preview button,
 * we automatically save as draft. The preview button is only available for
 * non-published drafts.
 *
 * Drafts are saved with the access set to private.
 *
 * @package Game
 */
elgg_make_sticky_form('game'); //if saving fails, the input info. in the form is retained

$objKpax = new kpaxSrv(elgg_get_logged_in_user_entity()->username);
//TODO: improve better permission checking because gatekeeper is not the method
// normally kpax will need a kpax_can_edit($guid);
gatekeeper();

//TODO: improve validation info
// get the form input
$game['name'] = get_input('title');
//example validate title
strlen($game['name']) > 0 ? $empty_required_field = FALSE : $empty_required_field = TRUE;

$game['descripGame'] = get_input('description');
$tags = get_input('tags');
$game['tags'] = string_to_tag_array($tags);
//TODO: kpax_user_logged_in(); //return kpax user id
$game['idDeveloper'] = '6';
// IMAGE
//TODO: create a field screenshot. Improve save directories and detect file types
$image_src = get_input('src');
$game['urlImage'] = $image_src;
if (
    (isset($_FILES['image']['error']) && 0 == $_FILES['image']['error']) 
    ||
    (isset($image_src) && strlen($image_src) == 0)
    ) {
    if (isset($_FILES['image']['name'])) {
        $game['urlImage'] = kpax_upload_file_valid($input_field_name = 'image');
    }
}
$game['idCategory'] = get_input('category');
$game['idPlatform'] = get_input('platform');
$game['idSkill'] = get_input('skill');


//CSR_FILE
$csr = get_input('csr');
$game['csr_file'] = $csr;
if (
    (isset($_FILES['csr_file']['error']) && 0 == $_FILES['csr_file']['error'])
    ||
    (isset($csr) && strlen($csr) == 0)
    ) {
    //TODO: validate csr file before save
    // is_csr_valid($_FILES['csr_file']['name']);
    $game['csr_file'] = kpax_upload_file_valid($input_field_name = 'csr_file');
}
else if (!(isset($csr) && strlen($csr) > 0)) {
    //TODO: create a function like required_fields_empty($fieldname);
    register_error(elgg_echo('kpax:save:failed:empty_required_field'));
    register_error(elgg_echo('csr_file'));
    forward(REFERRER);
}

$published = get_input('published');
if (is_array($published)){
    $game['publicAcces'] = $published[0];
}
else{
    $game['publicAcces'] = get_input('published');
}
$date_creation = get_input('dateCreation');
$game['dateCreation'] = date('Y-m-d');
if (strlen($date_creation) > 0) {
    $game['dateCreation'] = $date_creation;
}

//HIDDEN FIELDS
$game['idGame'] = get_input('idGame');
$game['guid'] = get_input('guid');
$game['container_guid'] = get_input('container_guid', elgg_get_logged_in_user_guid());

if ($empty_required_field == TRUE){
    register_error(elgg_echo('kpax:save:failed:empty_required_field'));
    forward(REFERRER);
}

//TODO integrate this part with elgg entity management
/*
if ($guid == 0) { // New game
    $kPAXgame = new ElggObject;
    $kPAXgame->subtype = "kpax";
    $kPAXgame->container_guid = (int) get_input('container_guid', $_SESSION['user']->getGUID());
    $new = true;
} else { //Edit existing game (???)
    $kPAXgame = get_entity($guid);
    if (!$kPAXgame->canEdit()) {
        system_message(elgg_echo('kpax:save:failed:entity'));
        forward(REFERRER);
    }
}

// fill in the game object with the information from the form
$kPAXgame->title = $title;
$kPAXgame->description = $description;
$kPAXgame->idCategory = $category; //NOU
$kPAXgame->dateCreation = $dateCreation; //NOU

// by default, the game is not public
$kPAXgame->access_id = ACCESS_LOGGED_IN;

// by default, the developer is the logged in user
$kPAXgame->owner_guid = elgg_get_logged_in_user_guid();

// save tags as metadata
$kPAXgame->tags = $tags;

// save the game to the database
if ($kPAXgame->save()) {    
    elgg_clear_sticky_form('kpax');
    system_message(elgg_echo('kpax:save:success'));
} else {
    register_error(elgg_echo('kpax:save:failed'));
    forward("kpax");
}
*/

//if($objKpax->addGame($_SESSION["campusSession"],$title, $kPAXgame->getGUID())!="OK"){
// register_error(elgg_echo('kpax:save:failed:service'));
//}
//NOU

if (isset($game['idGame'])) {
    if ($objKpax->setGame($_SESSION["campusSession"], $game)!="OK") {
        register_error(elgg_echo('kpax:save:failed:service'));
        register_error('kpax:setGame'); // debug
        //TODO: delete files created if any
    }
    else {
        //TODO: This function delete and recreate tags its better a function to update game tags
        if (strlen($tags) > 0){
            if($objKpax->addDelTagsGame($_SESSION["campusSession"], $game['idGame'], $tags)!="OK") {
                register_error(elgg_echo('kpax:save:failed:service'));
                register_error('kpax:addDelTagsGame'); // debug
            }
        }
    }
    system_message(elgg_echo('kpax:save:success'));
    forward('kpax/game/view/' . $game['idGame']);

}
else{
    //TODO addGame have to return an idGame or 0;
    if ($objKpax->addGame($_SESSION["campusSession"], $game)!="OK") {
        register_error(elgg_echo('kpax:save:failed:service'));
        register_error('kpax:addGame'); // debug
    }
/*    else {
        if (strlen($tags) > 0){
            if($objKpax->addDelTagsGame($_SESSION["campusSession"], $game['idGame'], get_input('tags'))!="OK") {
                register_error(elgg_echo('kpax:save:failed:service'));
                register_error('kpax:addDelTagsGame'); // debug
            }
        }
    }*/
    system_message(elgg_echo('kpax:save:success'));
    forward('kpax/game/all');
}


//system_message(elgg_echo('kpax:save:success'));
// forward user to a page that displays the developer's games information
//system_message($kPAXgame->getURL());

//forward('kpax/play');
// forward user to view the lates game created/edited
//forward('kpax/view/'. $game['idGame']);

?>