# removes the encasing speechmarks from a supplied dimension id
# @s = player consuming wormhole_bottle
# at @s
# run from player/wormhole_targeting/translate_numeric_dimension_id

# uses the fact that 'data modify ... set value "some_string"' and 'data modify ... set value some_string' result in the identical string "some_string" being stored in storage
$data modify storage gm4_zauber_cauldrons:temp/wormhole_targeting/destination cauldron_pos.dimension set value $(dimension)
