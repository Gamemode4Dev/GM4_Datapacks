# sets the specific relocator data
# @s = "smithed.block" entity inside the block
# located at the center of the block to be picked up
# run from gm4_ender_hoppers:relocate/pick_up_check

data modify storage gm4_relocators:temp merge_data set value {custom_block:"gm4_ender_hopper",lore:'{"translate":"block.gm4.ender_hopper","fallback":"Ender Hopper","color":"gray","italic":true}'}
data modify storage gm4_relocators:temp merge_data.entity_data.Rotation set from entity @s Rotation
execute positioned ~ ~-0.5 ~ run data modify storage gm4_relocators:temp merge_data.entity_data.ArmorItems set from entity @e[type=armor_stand,tag=gm4_ender_hopper_stand,limit=1,distance=..0.01] ArmorItems

execute positioned ~ ~-0.5 ~ run kill @e[type=armor_stand,tag=gm4_ender_hopper_stand,limit=1,distance=..0.01]
kill @s
scoreboard players set $found_marker gm4_rl_data 1
