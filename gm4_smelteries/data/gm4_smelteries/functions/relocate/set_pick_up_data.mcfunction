# sets the specific relocator data
# @s = "smithed.block" entity inside the block
# located at the center of the block to be picked up
# run from gm4_smelteries:relocate/pick_up_check

data modify storage gm4_relocators:temp merge_data set value {custom_block:"gm4_smeltery",lore:'{"translate":"%1$s%3427655$s","with":["Smeltery",{"translate":"block.gm4.smeltery"}],"color":"gray","italic":true}'}
data modify storage gm4_relocators:temp merge_data.entity_data.Rotation set from entity @s Rotation
data modify storage gm4_relocators:temp merge_data.entity_data.ArmorItems set from entity @e[type=armor_stand,tag=gm4_smeltery_stand,distance=..0.5,limit=1] ArmorItems

execute positioned ~ ~-0.3 ~ run kill @e[type=armor_stand,tag=gm4_smeltery_stand,limit=1,distance=..0.01]
scoreboard players operation $current gm4_smelt_id = @s gm4_smelt_id
execute positioned ^ ^-1.5 ^-1 as @e[type=armor_stand,tag=gm4_smeltery_cauldron,limit=1,distance=..0.01] if score @s gm4_smelt_id = $current gm4_smelt_id run kill @s
kill @s
scoreboard players set $found_marker gm4_rl_data 1
