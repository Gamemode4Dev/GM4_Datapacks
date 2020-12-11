# @s = teleportation jammer that just jammed an entity
# run from both player/jam_player and mob/move_mob

summon area_effect_cloud ~ ~-1 ~ {CustomName:'"gm4_ta_anchor_finder"',Rotation:[0f,90f],Tags:["gm4_ta_anchor_finder"],Duration:1,Raduis:0f,Particle:"block air"}

scoreboard players reset scan_count gm4_ta_data
tag @s add gm4_ta_selected_jammer
execute as @e[type=area_effect_cloud,tag=gm4_ta_anchor_finder,limit=1,distance=..1.1] at @s run function gm4_teleportation_anchors:blocks/anchor/scan
tag @s remove gm4_ta_selected_jammer

tag @e[type=area_effect_cloud] remove gm4_ta_anchor_finder
