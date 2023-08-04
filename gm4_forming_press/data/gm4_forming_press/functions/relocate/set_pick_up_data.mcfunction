# sets the specific relocator data
# @s = "smithed.block" entity inside the block
# located at the center of the block to be picked up
# run from gm4_forming_press:relocate/pick_up_check

data modify storage gm4_relocators:temp merge_data set value {custom_block:"gm4_forming_press",lore:'{"translate":"block.gm4.forming_press","fallback":"Forming Press","color":"gray","italic":true}'}
data modify storage gm4_relocators:temp merge_data.entity_data.Rotation set from entity @s Rotation
data modify storage gm4_relocators:temp merge_data.entity_data.ArmorItems set from entity @e[type=armor_stand,tag=gm4_forming_press_stand,distance=..0.5,limit=1] ArmorItems

execute positioned ~ ~-0.4 ~ run kill @e[type=armor_stand,tag=gm4_forming_press_stand,limit=1,distance=..0.01]
kill @s
scoreboard players set $found_marker gm4_rl_data 1
