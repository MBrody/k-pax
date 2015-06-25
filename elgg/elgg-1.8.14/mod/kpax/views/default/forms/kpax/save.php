<?php
/**
 * Edit or Create game form
 *
 * @package Game
 */
//var_dump(array_keys($vars));
$objKpax = new kpaxSrv(elgg_get_logged_in_user_entity()->username);
$campusSession = $_SESSION["campusSession"];

// Separate build fields & inputs from output in html
// Draft is not implemented at the moment
$draft_warning = elgg_extract('draft_warning', $vars, NULL);
if ($draft_warning) {
  $draft_warning = '<span class="message warning">' . $draft_warning . '</span>';
}
// HIDDEN FIELDS
// Some fields aren't used at all cause are default fields in elgg entities but
// at the moment kpax games are not elgg entities.
//$container_guid = elgg_extract('container_guid', $vars); NOT USED
if (isset($container_guid)) {
  $input_container_guid = elgg_view('input/hidden', array('name' => 'container_guid', 'value' => $container_guid));
}
//$guid = elgg_extract('guid', $vars); NOT USED
if (isset($guid)) {
  $input_guid = elgg_view('input/hidden', array('name' => 'guid', 'value' => $guid));
}
$idGame = elgg_extract('idGame', $vars, NULL);
if (isset($idGame)) {
  $input_idGame = elgg_view('input/hidden', array('name' => 'idGame', 'value' => $idGame));
}
// TITLE
$title = elgg_extract('name', $vars, NULL);
$title_label = elgg_echo('kPAX:game:name');
$input_title = elgg_view('input/text', array(
  'name' => 'title',
  'value' => isset($title) ? $title : NULL,
  'id' => 'edit-title',
  'size' => 60,
  'maxlength' => 255,
  )
);
// DESCRIPTION
$description = elgg_extract('descripGame', $vars, NULL);
$description_label = elgg_echo('kPAX:game:description');
$input_description = elgg_view('input/longtext', array(
  'name' => 'description', 
  'value' => isset($description) ? $description : NULL,
  'id' => 'edit-description',
  )
);

// CATEGORY
$category = elgg_extract('idCategory', $vars, NULL);
if(isset($category)){
  $category = $objKpax->getCategory($campusSession, $category);
}
$options = array();
$categories = $objKpax->getCategories($campusSession);
foreach ($categories as $key => $avl_category) {
  $options[$avl_category->name] = $avl_category->idCategory;
}
$category_label = elgg_echo('kPAX:game:category');
$input_category = elgg_view('input/radio', array(
  'name' => 'category',
  'value' => isset($category->idCategory) ? $category->idCategory : NULL,
  'options' => $options,
  'id' => 'edit-categories-' . $category->idCategory,
  )
);

// PLATFORM
$platform = elgg_extract('idPlatform', $vars, NULL);
if(isset($platform)){
  $platform = $objKpax->getPlatform($campusSession, $platform);
}
$options = array();
$platforms = $objKpax->getPlatforms($campusSession);
foreach ($platforms as $key => $avl_platform) {
  $options[$avl_platform->name] = $avl_platform->idPlatform;
}
$platform_label = elgg_echo('kPAX:game:platforms');
$input_platform = elgg_view('input/radio', array(
  'name' => 'platform',
  'value' => isset($platform->idPlatform) ? $platform->idPlatform : NULL,
  'options' => $options,
  'id' => 'edit-platforms-' . $platform->idPlatform,
  )
);

// SKILL
$skill = elgg_extract('idSkill', $vars, NULL);
if(isset($skill)){
  $skill = $objKpax->getSkill($campusSession, $skill);
}
$options = array();
$skills = $objKpax->getSkills($campusSession);
foreach ($skills as $key => $avl_skill) {
  $options[$avl_skill->name] = $avl_skill->idSkill;
}
$skill_label = elgg_echo('kPAX:game:skills');
$input_skill = elgg_view('input/radio', array(
  'name' => 'skill',
  'value' => isset($skill->idSkill) ? $skill->idSkill : NULL,
  'options' => $options,
  'id' => 'edit-skills-' . $skill->idSkill,
  )
);

// TAGS
//TODO: need review this is not full functional
$tags = elgg_extract('tags', $vars, NULL);
$field_tags = array();
if (isset($tags)) {
  foreach ($tags as $key => $tag) {
    if (isset($tag)){
      $field_tags[$tag->idTag] = $tag->tag;
    }
  }
}
$tags_label = elgg_echo('kPAX:game:tags');
$input_tags = elgg_view('input/tags', array('name' => 'tags', 'value' => $field_tags)); 

// SECURITY
$csr_file = elgg_extract('csr_file', $vars, NULL);
$security_title = elgg_echo('kpax:game:input:security:title');
$security_content = elgg_echo('kpax:game:input:security:content');
$security_label = elgg_echo('kPAX:game:csr_file');
if(isset($csr_file)){
  $filename = end(explode('/', $csr_file));
  $security_filename = '<div><strong>' . $filename . '</strong></div></br>';
  $csr_file_input = elgg_view('input/hidden', array('name' => 'csr', 'value' => $csr_file));
}
$input_security = elgg_view('input/file', array(
  'name' => 'csr_file',
  'value' => $filename,
//  'disabled' => isset($csr_file) ? TRUE : FALSE,
  )
);
//TODO: create a checkbox to enable csr_file update

// IMAGE
$image_file = elgg_extract('urlImage', $vars, NULL);
//$image_content = elgg_extract('images', $vars, NULL); Should be an image array of file objects
$image_label = elgg_echo('kPAX:game:image');
if (isset($image_file)){
  $image_vars = array(
    'file_path' => $image_file,
    'class' => 'thumbnail',
    'title' => $title ? $title : NULL,
    );
  $image = elgg_view('image/view', $image_vars);

  $upload_form = elgg_view_form('kpax/image/upload', $form_params, $image_vars);
  $output_image =  elgg_view_image_block($image, $upload_form);
}
else{
    $image = NULL;
    $variables = NULL;
    $form_params = NULL;
    $upload_form = elgg_view_form('kpax/image/upload', $form_params, $variables);
    $output_image =  elgg_view_image_block($image, $upload_form);
}
/* Alternative method to upload files
$input_image = elgg_view('input/file', array(
  'name' => 'image_file',
  'value' => isset($image_file) ? $image_file : NULL,
  )
);*/
// SCREENSHOTS
//TODO: create a game field to upload screenshots of the game
/*$screenshots_list = elgg_extract('screenshots', $vars, NULL);
$screenshots_label = elgg_echo('kPAX:game:screenshots');
if(isset($screenshots_list)){
  $screenshots = elgg_view('kpax/image/screenshots', $screenshots_list);
  $screenshots .= elgg_view_form('kpax(image/upload', $form_params, $variables);
}
else{
  $screenshots .= elgg_view_form('kpax(image/upload', $form_params, $variables);
}
*/

// CREATED DATE
// TODO: could be interesting create a view that show a jquery calendar popup for easy input dates
$dateCreation = elgg_extract('dateCreation', $vars, NULL);

$label_created = elgg_echo('kPAX:game:dateCreation');
//$info_created = elgg_echo('kpax:game:input:created:info');
$input_created = elgg_view('input/date', array(
  'name' => 'dateCreation',
  'value' => isset($dateCreation) ? strtotime($dateCreation) : NULL,
  'size' => 20,
  'disabled' => isset($dateCreation) ? TRUE : FALSE,
  )
);
//var_dump($dateCreation);
//var_dump(date('Y/m/d HH:i:s', $dateCreation));

// PUBLISHED
if (elgg_is_admin_logged_in()) {
  $is_public = elgg_extract('publicAcces', $vars, 0);
  $label_is_public = elgg_echo('kpax:game:input:access');
  $input_is_public = elgg_view('input/checkboxes', array(
            'name' => 'published',
            'value' => isset($is_public) ? $is_public : NULL,
            'options' => array(
                'Public Access' => 1,
            ),
            'align'=> 'vertical'
        ));
}
// ACTIONS
$action_save = elgg_view('input/submit', array('value' => elgg_echo('kpax:save'), 'class' => array('btn btn-default')));
if (isset($idGame)) {
  // add a delete button if editing
  $delete_url = "action/kpax/game/delete?guid={$idGame}";
  $action_delete = elgg_view('output/confirmlink', array(
    'href' => $delete_url,
    'text' => elgg_echo('delete'),
    'class' => 'elgg-button elgg-button-delete float-alt'
    )
  );
}
$action_buttons = $action_save . $action_delete;
?>
<?php

echo <<<___HTML

$draft_warning

<div class="form-item field-title">
    <label for="edit-title">$title_label</label>
    $input_title
</div>

<div class="form-item field-tags">
    <label>$tags_label</label>
    $input_tags
</div>
<div class="form-item field-image">
    $output_image
</div>
<div class="form-item field-screenshots">
    $output_screenshots
</div>
<div class="form-item field-description">
    <label for="edit-description">$description_label</label>
    $input_description
</div>

<div class="form-item field-categories">
    <label for="edit-categories">$category_label</label>
    $input_category
</div>
<div class="form-item field-platforms">
    <label for="edit-platforms">$platform_label</label>
    $input_platform
</div>

<div class="form-item field-skills">
    <label for="edit-skills">$skill_label</label><br />
    $input_skill
</div>

<div class="form-item field-security">
    <h3>$security_title</h3>
    $security_content
    $security_filename
    <label>$security_label</label>
    $input_security
    $csr_file_input
</div>

<fieldset class="form-fieldset game-properties">
    <div class="form-item field-is-public">
    <label>$label_is_public</label>
    $input_is_public
  </div>
  <div class="form-item field-created">
    <label>$label_created</label>
    $info_created
    $input_created
  </div>
</fieldset>

<div class="elgg-foot">
  $input_idGame
  $guid_input
  $container_guid_input

  $action_buttons
</div>

___HTML;

