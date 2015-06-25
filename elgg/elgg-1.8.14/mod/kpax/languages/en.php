<?php

/**
 * Bookmarks English language file
 */
$english = array(
    /**
     * Menu items and titles
     */
    'kpax:all' => "All products",
    'kpax:add' => "Add game",
    'kpax:delete' => "Delete game",
    'kpax:save' => "Save game",
    'kpax:send' => "Send game",
    'kpax:created' => "Created",
    'kpax:save:success' => "save product",
    'kpax:save:failed:entity' => "Error get entity",
    'kpax:save:failed' => "Fail save product",
    'kpax:save:failed:empty_required_field' => "Validation failed: Required field is empty",
    'kpax:delete:failed' => "delete failed product",
    'kpax:delete:success' => "delete product",
    'kpax:none' => "No products",
    'kpax:unknown_kpax' => "unknow product",
    'kpax:friends' => "friends product",
    'kpax:owner' => "owner product",
    'kpax:edit' => "edit product",
    'kpax:game:score' => "Game score",
    'kpax:connection:problem' => 'There is a connection problem with kPAX server',
    'kpax:connection:noresponse' => 'There is no response from kPAX server',
    'kPAX:all' => "All",
    'kPAX:any' => "Any",
    'kPAX:play' => "Games",
    'kPAX:devs' => "Develop",
    'kPAX:add' => "Add game",
    'kPAX:error:cannot_edit_game' => 'Not enought permissions to edit this content',
    'kPAX:game:name' => "Game name (*)",
    'kPAX:game:description' => "Description",
    'kPAX:game:skills' => "Skills (*)",
    'kPAX:game:category' => "Game category/ies",
    'kPAX:game:platforms' => "Available platforms",
    'kPAX:game:dateCreation' => "Creation date",
    'kPAX:game:tags' => 'Related tags',
    'kPAX:game:csr_file' => "Certificate request file [.csr] (*)",
    'kPAX:game:send' => "Send my game!",
    'kPAX:myGames' => "My games",
    'kPAX:myowngames' => "My own games",
    'kPAX:noGames' => "You do not have games in kPAX yet.",
    'kPAX:my_dev_games' => "My (developed) games",
    'kpax:tagline' => 'Play seriously!',
    'kpax:dragdrop' => 'You can drag and drop an image from the desktop',
	'kpax:games' => 'Games',
    'kpax:game:category' => 'Category',
    'kpax:game:category' => 'Categories',
	'kpax:game:allcategories' => 'All',
	'kpax:game:name' => 'Name',
	'kpax:game:tag' => 'Tag',
    'kpax:image:upload:instructions' => 'Image upload instructions',
    'kpax:image:upload' => 'Upload a new image',
	'kpax:game:metadata' => 'Metadata',
	'kpax:game:allmetadata' => 'All',
    'kpax:game:platform' => 'Platform',
    'kpax:game:platforms' => 'Platforms',
	'kpax:game:allplatforms' => 'All',
    'kpax:game:skill' => 'Skill',
    'kpax:game:input:skill' => 'skill',
    'kpax:game:skills' => 'Skills',
	'kpax:game:allskills' => 'All',
	'kpax:game:sort' => 'Sort',
    'kpax:game:sortby' => 'Sort by',
	'kpax:game:search' => 'Search',
	'kpax:game:previous' => 'Previous',
	'kpax:game:next' => 'Load More',
    'kpax:game:play' => 'Play',
    'kpax:game:buy' => 'Buy',
    'kpax:game:wishlist' => 'Add to wishlist',
	'kpax:list:success' => 'Success list',
	'kpax:list:failed' => 'Error list',
	'kpax:game:description' => 'Description',
	'kpax:play' => 'Play',
	'kpax:similarGames' => 'Similar games',
	'kpax:comments' => 'Comments',
	'kpax:gamestatisticssocialnetworks' => 'Game statistics and social networks',
	'kpax:listgames' => 'Game&apos;s list',
	'kpax:nogames' => 'No hi ha jocs d&apos;acord amb aquests criteris de filtratge',
    'kpax:all' => 'Games',
    'kpax:more_info_label' => 'More Info',
    'kpax:recommend_label' => 'Similar Games',
    'kpax:help' => 'Help',
    'kpax:game:input:access' => 'Access control:',
    'kpax:game:input:created:info' => 'If empty, game date will be replaced with server time',
    'kpax:game:input:created:placeholder' => 'Now:',
    'kpax:game:input:security:title' => 'Security',
    'kpax:game:input:security:content' => '<p>In order to connect your game to kPAX, it is necessary to 
        create a specific public/private key pair.
        It can be done using <A HREF=http://www.openssl.org/>openSSL</A>. You only need to run the command:</p>
        <p><code>openssl req -out requestUser.csr -new -newkey rsa:2048 -nodes -keyout private.key</code></p>
        <!-- <p><code>openssl req -passout pass:abcdefg -subj "/C=US/ST=IL/L=Chicago/O=IBM Corporation/OU=IBM 
        Software Group/CN=Rational Performance Tester CA/emailAddress=rpt@abc.ibm.com" -new > waipio.ca.cert.csr</p> -->
        <p>Once you have run it, you should have two text files: the private key (.pml), which is only for your eyes, and the
        certificate request file (.csr), which you must include below. kPAX will create and store a certificate in your 
        game\'s information sheet.</p>',


    /* KPAX DEVS MULTILANGUAGE CONTENT*/
    'kpax:devs:explanations:title' => 'Instructions for developers',
    'kpax:devs:explanations:section:intro:content' => '<p>kPAX philosophy is based in free software and open source. All the code is available under the 
    <A HREF="http://opensource.org/licenses/gpl-2.0.php">GNU General Public License, version 2 (GPL-2.0)</A>. For those developers interested in participating in 
    the kPAX project, there are two ways to do it: On the one hand, it is possible to <strong>add functions/improvements to the platform</strong>. On the 
    other hand, new external <strong>games, apps, etc.</strong> to offer to users (players) are welcome. Let us see how to do it.</p>',
    'kpax:devs:explanations:section:construction:title' => 'Platform construction',
    'kpax:devs:explanations:section:construction:content' => '<p>In case you want to participate in the kPAX platform construction, the code of the stable
     version is public in github. There, you can find both:</p>
     <ul>
        <li> 1.- <strong>elgg plugins</strong> -  <A HREF=https://github.com/jsanchezramos/mods-kpax>mods-kpax repository</A>
        <li> 2.- <strong>kPAX services</strong> - <A HREF=https://github.com/jsanchezramos/k-pax>k-pax repository</A>
    </ul>
    <br>
    <p>Both, the information on how to install a local version of kPAX and a few ideas on desired improvements can be found 
    in the <A HREF=https://github.com/jsanchezramos/k-pax/wiki>k-pax repository wiki</A>. Feel free to complement/fix/etc. it.
    </p>',
    'kpax:devs:explanations:section:games_development:title' => 'Games development',
    'kpax:devs:explanations:section:games_development:content' => '<p> If you want to develop a game (do not forget kPAX is only for 
        educative ones) you only need to insert in your code the necessary calls to kPAX engine which validate users, the game itself, 
        and send/receive information to/from the database.
        The most simple relationship between a game and kPAX might imply user and game validation, and at the end, send the score to be 
        incorporated to the user\'s game information to update the database.</p>
        <p> To do this, some security has to be added to communication between games and the platform. Security issues in kPAX are dealed 
        with by means of: the validation of games using a public/private key pair, and users autorisation, using <A HREF=http://oauth.net/>OAuth</A>.
        This means the developer has to create the game\'s public/private key pair and include the public one in the game\'s form. The private is
        used to sign every message sent to kPAX, which can certify it corresponds to the corresponding game.</p>',
    'kpax:devs:explanations:section:apps_development:title' => 'Apps development',
    'kpax:devs:explanations:section:apps_development:content' => '<p>Bla bla bla (pensar si les aplicacions tambe han de estar donades d\'alta a la plataforma o no)</p>',

);

add_translation('en', $english); 

?>