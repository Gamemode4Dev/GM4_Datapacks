# jam mobs every 8 ticks
function gm4_teleportation_anchors:mob/jam_mob
schedule function gm4_teleportation_anchors:mob/jam_mob 8t

# teleportation jammers
scoreboard players remove @e[type=#gm4_teleportation_anchors:affected,scores={gm4_ta_jam_time=1..}] gm4_ta_jam_time 1
scoreboard players reset @e[type=#gm4_teleportation_anchors:affected,scores={gm4_ta_jam_time=..0}] gm4_ta_pos_x
execute as @e[type=#gm4_teleportation_anchors:affected,tag=gm4_ta_jammed] unless score @s gm4_ta_jam_time matches 1.. run tag @s remove gm4_ta_jammed

execute as @e[type=armor_stand,tag=gm4_teleportation_jammer] at @s run function gm4_teleportation_anchors:blocks/process_jammer

# teleportation anchors
execute as @e[type=armor_stand,tag=gm4_teleportation_anchor] at @s run function gm4_teleportation_anchors:blocks/process_anchor


schedule function gm4_teleportation_anchors:main 16t
