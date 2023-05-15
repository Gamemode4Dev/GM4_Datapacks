# sets the specific relocator data
# @s = "smithed.block" entity inside the block
# located at the center of the block to be picked up
# run from gm4_liquid_tanks:relocate/pick_up_check

data modify storage gm4_relocators:temp merge_data set value {custom_block:"gm4_liquid_tank",lore:'{"translate":"block.gm4.liquid_tank","fallback":"Liquid Tank","color":"gray","italic":true}'}
data modify storage gm4_relocators:temp merge_data.entity_data.Rotation set from entity @s Rotation

tag @s remove gm4_relocating_block
data modify storage gm4_relocators:temp merge_data.entity_data.marker.Tags set from entity @s Tags
tag @s add gm4_relocating_block
data modify storage gm4_relocators:temp merge_data.entity_data.marker.data set from entity @s data

data modify storage gm4_relocators:temp merge_data.entity_data.stand.ArmorItems set from entity @e[type=armor_stand,tag=gm4_liquid_tank_stand,distance=..0.5,limit=1] ArmorItems
data modify storage gm4_relocators:temp merge_data.entity_data.stand.Tags set from entity @e[type=armor_stand,tag=gm4_liquid_tank_stand,distance=..0.5,limit=1] Tags

execute positioned ~ ~-0.75 ~ run data modify storage gm4_relocators:temp merge_data.entity_data.display set from entity @e[type=armor_stand,tag=gm4_liquid_tank_display,distance=..0.3,limit=1] {}
data remove storage gm4_relocators:temp merge_data.entity_data.display.Pos

execute store result storage gm4_relocators:temp merge_data.entity_data.lt_value int 1 run scoreboard players get @s gm4_lt_value
execute store result storage gm4_relocators:temp merge_data.entity_data.lt_max int 1 run scoreboard players get @s gm4_lt_max
execute store result storage gm4_relocators:temp merge_data.entity_data.lt_prior_value int 1 run scoreboard players get @s gm4_lt_prior_value

function #gm4_liquid_tanks:relocate/set_data

execute positioned ~ ~-0.5 ~ run kill @e[type=armor_stand,tag=gm4_liquid_tank_stand,limit=1,distance=..0.01]
execute positioned ~ ~-0.75 ~ run kill @e[type=armor_stand,tag=gm4_liquid_tank_display,distance=..0.3,limit=1]
execute positioned ~ ~0.5 ~ run kill @e[type=area_effect_cloud,distance=..0.5,tag=gm4_lt_util_block]
kill @s
scoreboard players set $found_marker gm4_rl_data 1
