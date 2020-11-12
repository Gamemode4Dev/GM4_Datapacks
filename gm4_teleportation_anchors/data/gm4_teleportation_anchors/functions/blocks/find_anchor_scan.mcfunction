# @s = AEC to find a teleportation anchor
# run from find_anchor

tp @s ^ ^ ^1
execute unless block ~ ~ ~ purpur_pillar unless block ~ ~ ~ lodestone run tag @s add gm4_ta_kill
kill @s[tag=gm4_ta_kill]
execute if block ~ ~ ~ lodestone align xyz if entity @e[type=armor_stand,tag=gm4_teleportation_anchor,dx=0,dy=0,dz=0] run tag @s add gm4_ta_found_anchor

# rotate if at a junction
execute at @s[tag=!gm4_ta_found_anchor] unless blocks ~ ~ ~ ~ ~ ~ ^ ^ ^-1 all run function gm4_teleportation_anchors:blocks/find_anchor_rotate

scoreboard players add scan_count gm4_ta_data 1
execute unless entity @s[tag=gm4_ta_kill] unless score scan_count gm4_ta_data matches 128.. at @s[tag=!gm4_ta_found_anchor] run function gm4_teleportation_anchors:blocks/find_anchor_scan
