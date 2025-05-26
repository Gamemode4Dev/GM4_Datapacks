# sets the specific relocator data
# @s = "smithed.block" entity inside the block
# located at the center of the block to be picked up
# run from gm4_relocators:custom_crafter_relocating/pick_up_check

data modify storage gm4_relocators:temp merge_data set value {custom_block:"gm4_custom_crafter",lore:{"translate":"block.gm4.custom_crafter","fallback":"Custom Crafter","color":"gray","italic":true}}
data modify storage gm4_relocators:temp merge_data.entity_data.Rotation set from entity @s Rotation
data modify storage gm4_relocators:temp merge_data.entity_data.item set from entity @e[type=item_display,tag=gm4_custom_crafter_display,distance=..0.5,limit=1] item

execute at @s positioned ~ ~0.5 ~ run kill @e[type=item_display,tag=gm4_custom_crafter_display,limit=1,distance=..0.01]
kill @s
scoreboard players set $found_marker gm4_rl_data 1
