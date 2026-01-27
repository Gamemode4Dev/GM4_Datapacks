# Revokes the breeding advancement and initiates baby tracking
# @s = player who bred livestock
# at @s
# run from advancement gm4_lavish_livestock:{{ entity_id }}/breed

advancement revoke @s only gm4_lavish_livestock:{{ entity_id }}/breed

# get parent sizes
scoreboard players set $parent_a gm4_lavish_livestock_size -1
scoreboard players set $parent_b gm4_lavish_livestock_size -1
execute as @e[type={{ entity_id }},distance=..10,limit=2,sort=nearest,nbt=!{InLove:0}] run function gm4_lavish_livestock:{{ entity_id }}/determine_parent

# if the parents differ in size, chose the smaller one
execute if score $parent_a gm4_lavish_livestock_size > $parent_b gm4_lavish_livestock_size run scoreboard players operation $parent_a gm4_lavish_livestock_size >< $parent_b gm4_lavish_livestock_size

# if both parents are the same size, roll dice for size increase
execute if score $parent_a gm4_lavish_livestock_size = $parent_b gm4_lavish_livestock_size if predicate {condition:"minecraft:random_chance",chance:0.025} run scoreboard players add $parent_a gm4_lavish_livestock_size 1

# store size onto marker and wait for baby to be born
execute summon marker run function gm4_lavish_livestock:{{ entity_id }}/initialize_marker
schedule function gm4_lavish_livestock:{{ entity_id }}/find_marker 1t
