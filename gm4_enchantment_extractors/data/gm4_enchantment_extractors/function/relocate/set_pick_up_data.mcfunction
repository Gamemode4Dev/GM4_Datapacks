# sets the specific relocator data
# @s = "smithed.block" entity inside the block
# located at the center of the block to be picked up
# run from gm4_enchantment_extractors:relocate/pick_up_check

data modify storage gm4_relocators:temp merge_data set value {custom_block:"gm4_enchantment_extractor",lore:'{"translate":"block.gm4.enchantment_extractor","fallback":"Enchantment Extractor","color":"gray","italic":true}'}
data modify storage gm4_relocators:temp merge_data.entity_data.Rotation set from entity @s Rotation
execute positioned ~ ~-1.2 ~ run data modify storage gm4_relocators:temp merge_data.entity_data.ArmorItems set from entity @e[type=armor_stand,tag=gm4_enchantment_extractor_stand,distance=..0.1,limit=1] ArmorItems

execute positioned ~ ~-1.2 ~ run kill @e[type=armor_stand,tag=gm4_enchantment_extractor_stand,limit=1,distance=..0.01]
kill @s
scoreboard players set $found_marker gm4_rl_data 1
