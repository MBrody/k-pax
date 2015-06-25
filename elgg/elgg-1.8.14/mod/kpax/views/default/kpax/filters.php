<?php
$filter_options = $vars['filter'];
foreach ($filter_options as $filter) {
	//search id property name
	$properties = array_keys(get_object_vars($filter));
	$id_match = NULL;
	foreach ($properties as $key => $property_name) {
	    if (strpos($property_name, 'id') === 0) {
	        $base_name = explode('id', $property_name);
			if (strcasecmp($base_name[1], $vars['name']) == 0) {
				$id_match = $property_name;
			}
	    }
	}
	$id_match ? $options[$filter->{$id_match}] = $filter->name : $options[$filter->name] = $filter->name;
}
$options[0] = $vars['name'] .': '.elgg_echo('kPAX:any');
$variables =  array(
	'value' => $vars['default_value'],
	'options_values' => $options,
	'class' => 'filter categories',
	'id' => $vars['name'],
	'name' => $vars['name'],
	'title' => $vars['name'],
);
$output = elgg_view($vars['input_type'], $variables);
echo $output;
?>