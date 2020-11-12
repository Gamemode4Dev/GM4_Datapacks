# @s = teleportation jammer that just jammed an entity
# run from both player/jam_player and mob/move_mob

summon area_effect_cloud ~ ~-1 ~ {Rotation:[0f,90f],Tags:["gm4_ta_anchor_finder"],Duration:1,Raduis:0f,Particle:"block air"}

scoreboard players reset scan_count gm4_ta_data
execute as @e[type=area_effect_cloud,tag=gm4_ta_anchor_finder,limit=1,distance=..1.1] at @s run function gm4_teleportation_anchors:blocks/find_anchor_scan
execute as @e[type=area_effect_cloud,tag=gm4_ta_found_anchor,limit=1] at @s run tp @s ^ ^ ^-1
scoreboard players operation @e[type=area_effect_cloud,tag=gm4_ta_found_anchor,limit=1] gm4_ta_jam_id = @s gm4_ta_jam_id

tag @e[type=area_effect_cloud] remove gm4_ta_anchor_finder
