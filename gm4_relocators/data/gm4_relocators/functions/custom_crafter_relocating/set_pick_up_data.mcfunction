# sets the specific relocator data
# @s = "smithed.block" entity inside the block
# located at the center of the block to be picked up
# run from gm4_relocators:custom_crafter_relocating

data modify storage gm4_relocators:temp merge_data set value {lore:'{"translate":"%1$s%3427655$s","with":["Custom Crafter",{"translate":"block.gm4.custom_crafter"}],"color":"gray","italic":true}'}
data modify storage gm4_relocators:temp merge_data.entity_data.Rotation set from entity @s Rotation

execute at @s positioned ~ ~-0.4 ~ run kill @e[type=armor_stand,tag=gm4_custom_crafter_stand,limit=1,distance=..0.01]
kill @s
scoreboard players set $found_marker gm4_rl_data 1
