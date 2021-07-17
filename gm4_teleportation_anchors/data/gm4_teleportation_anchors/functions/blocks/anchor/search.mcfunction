# @s = teleportation jammer that just jammed an entity
# run from both player/jam_player and mob/move_mob

summon marker ~ ~-1 ~ {CustomName:'"gm4_ta_anchor_finder"',Rotation:[0f,90f],Tags:["gm4_ta_anchor_finder"]}

scoreboard players reset scan_count gm4_ta_data
tag @s add gm4_ta_selected_jammer
execute as @e[type=marker,tag=gm4_ta_anchor_finder,limit=1,distance=..1.1] at @s run function gm4_teleportation_anchors:blocks/anchor/scan
tag @s remove gm4_ta_selected_jammer

tag @e[type=marker] remove gm4_ta_anchor_finder
