<?php
/**
 * This template prints a search row of games items
 * If list is empty prints a message to the user
 *
 * @param $vars['objGameList'] Array of game objects
 */
?>

<?php if (isset($vars['objGameList'])):?>
	<div class='contenedor_juegos'>
		<div class='contenedor_filas'>
		<?php foreach ($vars['objGameList'] as $game) :?>
			<?php print elgg_view('kpax/game/list', array('game' => $game)); ?>

		<?php endforeach; ?>
		</div>
	</div>
	<?php else:?> 
	<?php elgg_echo('kpax:nogames');?>
	<?php endif; ?>