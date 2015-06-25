<?php

elgg_register_event_handler('init', 'system', 'kpax_init');

function kpax_init() {

    $root = dirname(__FILE__);

    if (!update_subtype('object', 'kpax', 'ElggKpax')) {
            add_subtype('object', 'kpax', 'ElggKpax');
    }

//    elgg_register_view('kpax/devs_explanations');

    elgg_register_page_handler('kpax', 'kpax_page_handler');

    elgg_register_entity_url_handler('object', 'kpax', 'kpax_url');

    elgg_register_entity_type('object', 'kpax');


    elgg_register_library('elgg:kpax', "$root/lib/kpax.php");
    elgg_register_library('elgg:kpaxSrv', "$root/lib/kpaxSrv.php");
    elgg_register_library('elgg:kpaxOauth', "$root/lib/kpaxOauth.php");
    elgg_register_library('elgg:kpaxOauthLib', "$root/lib/Oauth.php");
    elgg_register_library('elgg:kpax:game', "$root/lib/game.php");

    elgg_load_library('elgg:kpax');
    elgg_load_library('elgg:kpaxSrv');
    elgg_load_library('elgg:kpaxOauth');
    elgg_load_library('elgg:kpaxOauthLib');
    elgg_load_library('elgg:kpax:game');

    // actions
    $action_path = "$root/actions/kpax";
    elgg_register_action('kpax/save', "$action_path/save.php");
    elgg_register_action('kpax/delete', "$action_path/delete.php");

    // menus

    elgg_register_menu_item('site', array(
        'name' => 'All Games',
        'text' => elgg_echo('kpax:all'),
        'href' => 'kpax/game/all'
    ));

    elgg_register_menu_item('site', array(
        'name' => 'Help',
        'text' => elgg_echo('kpax:help'),
        'href' => 'kpax/help'
    ));
    elgg_register_menu_item('site', array(
        'name' => 'My Own Games',
        'text' => elgg_echo('kPAX:myowngames'),
        'href' => 'kpax/game/own'
    ));
	// translations
	register_translations($root."/languages",true);
	reload_all_translations();

	
    // WS AUTH USER
    /* La funcion mi_eco($string) es la funcion que publicaremos */
    function auth_user($username="", $password = "") {

        $credentials = array('username' => $username, 'password' => $password);

        $user = get_user_by_username($credentials['username']);
        if (!empty($user)) {
            if ($user->password !== generate_user_password($user, $credentials['password'])) {
                log_login_failure($user->guid);
                throw new LoginException(elgg_echo('LoginException:PasswordFailure'));
                return "ERROR";
            }
            return "OK";
        } else {
            return "ERROR";
        }
    }

    expose_function("user.auth", "auth_user", array("username" => array('type' => 'String', 'required' => true), "password" => array('type' => 'String', 'required' => true)), 'Auth user elgg', 'GET', true, false);

    function auth_sign($username="") {

        $credentials = array('username' => $username);

        $user = get_user_by_username($credentials['username']);
        if (!empty($user)) {
            return "OK";
        } else {
            $user = get_user_by_username("uoc.edu_".$credentials['username']);
            if(!empty ($user))return "OK";
            return "ERROR";
        }
    }

    expose_function("auth.sign", "auth_sign", array("username" => array('type' => 'String', 'required' => true)), 'Auth sign ellg', 'GET', true, false);
}

/**
 * //TODO UPDATE All this info to represent all accessible paths
 * Dispatches kpax pages.
 * // Comments based on blog plugin
 * URLs take the form of
 *  All blogs:       blog/all
 *  User's blogs:    blog/owner/<username>
 *  Friends' blog:   blog/friends/<username>
 *  User's archives: blog/archives/<username>/<time_start>/<time_stop>
 *  Blog post:       blog/view/<guid>/<title>
 *  New post:        blog/add/<guid>
 *  Edit game:       kpax/edit/<guid>/<revision>
 *  Preview post:    blog/preview/<guid>
 *  Group blog:      blog/group/<guid>/all
 *
 * Title is ignored
 *
 * @todo no archives for all blogs or friends
 *
 * @param array $page
 * @return bool
 */
function kpax_page_handler($page) {
    // old group usernames
    if (substr_count($page[0], 'group:')) {
        preg_match('/group\:([0-9]+)/i', $page[0], $matches);
        $guid = $matches[1];
        if ($entity = get_entity($guid)) {
            kpax_url_forwarder($page);
        }
    }

    // user usernames
    $user = get_user_by_username($page[0]);
    if ($user) {
        kpax_url_forwarder($page);
    }

    $pages = dirname(__FILE__) . '/pages/kpax';
    $page_type = $page[0];
    $format = 'one_column';

    switch ($page_type) {
        case "owner":
            include "$pages/owner.php";
            break;

        case "friends":
            include "$pages/friends.php";
            break;

        case "read":
            break;

        case 'group':
            group_gatekeeper();
            include "$pages/owner.php";
            break;

        case "bookmarklet":
            set_input('container_guid', $page[1]);
            include "$pages/bookmarklet.php";
            break;

        case "help":
            $params = kpax_help_page();
            $format = 'content';
           break;

        case "game":
            //ensure only loged in user view this content
            gatekeeper();
            if (isset($page[1])){
                switch ($page[1]) {
                    case 'own':
                        $username = elgg_get_logged_in_user_entity()->username;
                        $params = get_own_games_read($page, $username);
                        break;
                    case 'all':
                        $params = get_own_games_read($page);
                        break;
                    case "add":
                        elgg_push_breadcrumb(elgg_echo('kPAX:myowngames'), 'kpax/game/own');
                        $params = game_get_page_content_edit($page[1]);
                        $format = 'content';
                        break;
                    case "edit":
                        elgg_push_breadcrumb(elgg_echo('kPAX:myowngames'), 'kpax/game/own');
                        $params = game_get_page_content_edit($page[1], $page[2]);
                        $format = 'content';
                        //set_input('guid', $page[1]);
                        //include "$pages/edit.php";
                        break;
                    case "view":
                        $referer = explode(elgg_get_site_url(), $GLOBALS['_SERVER']['HTTP_REFERER']);
                        elgg_push_breadcrumb(elgg_echo('kpax:games'), $referer[1]);
                        $params = game_get_page_content_read($page[2]);
                        break;
                    case "play":
                        include "$pages/play.php";
                    break;
                }
            }
        break;

        default:
            return false;
    }

    elgg_pop_context();

    if(isset($params) && isset($format)){
    $body = elgg_view_layout($format, $params);

    echo elgg_view_page($params['title'], $body);

    }

    return true;
}

/**
 * Forward to the new style of URLs
 *
 * @param string $page
 */
function kpax_url_forwarder($page) {
    global $CONFIG;

    if (!isset($page[1])) {
        $page[1] = 'items';
    }

    switch ($page[1]) {
        case "read":
            $url = "{$CONFIG->wwwroot}kpax/game/view/{$page[2]}";
            break;
        case "inbox":
            $url = "{$CONFIG->wwwroot}kpax/inbox/{$page[0]}";
            break;
        case "friends":
            $url = "{$CONFIG->wwwroot}kpax/friends/{$page[0]}";
            break;
        case "add":
            $url = "{$CONFIG->wwwroot}kpax/game/add/{$page[0]}";
            break;
        case "items":
            $url = "{$CONFIG->wwwroot}kpax/owner/{$page[0]}";
            break;
        case "bookmarklet":
            $url = "{$CONFIG->wwwroot}kpax/bookmarklet/{$page[0]}";
            break;
    }

    register_error(elgg_echo("changebookmark"));
    forward($url);
}

/**
 * Populates the ->getUrl() method for bookmarked objects
 *
 * @param ElggEntity $entity The bookmarked object
 * @return string bookmarked item URL
 */
function kpax_url($entity) {
    global $CONFIG;

    $title = $entity->title;
    $title = elgg_get_friendly_title($title);
    return $CONFIG->url . "kpax/game/view/" . $entity->getGUID() . "/" . $title;
}

?> 