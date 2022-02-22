# @s = marker to find a teleportation anchor
# run from find_anchor

tp @s ^ ^ ^1
execute unless block ~ ~ ~ purpur_pillar unless block ~ ~ ~ lodestone run tag @s add gm4_ta_kill
kill @s[tag=gm4_ta_kill]
execute if block ~ ~ ~ lodestone align xyz positioned ~0.5 ~0.5 ~0.5 if entity @e[type=marker,tag=gm4_teleportation_anchor,distance=..0.1] at @s run function gm4_teleportation_anchors:blocks/anchor/link

# rotate if at a junction
execute at @s[tag=!gm4_ta_found_anchor] unless blocks ~ ~ ~ ~ ~ ~ ^ ^ ^-1 all run function gm4_teleportation_anchors:blocks/anchor/rotate

scoreboard players add scan_count gm4_ta_data 1
execute unless entity @s[tag=gm4_ta_kill] unless score scan_count gm4_ta_data matches 128.. at @s[tag=!gm4_ta_found_anchor] run function gm4_teleportation_anchors:blocks/anchor/scan
