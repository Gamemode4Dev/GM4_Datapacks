# Initializes the breeding site marker which sticks around awaiting birth
# @s = new breeding site marker
# at location of player who has fed the parent
# run from gm4_lavish_livestock:{{ entity_id }}/determine_parent

scoreboard players operation @s gm4_lavish_livestock_size = $parent_a gm4_lavish_livestock_size
tag @s add gm4_lavish_livestock_breeding_site
tag @s add gm4_lavish_livestock_{{ entity_id }}
