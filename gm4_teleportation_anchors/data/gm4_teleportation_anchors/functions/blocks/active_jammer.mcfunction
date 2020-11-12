# @s = teleportation jammer with fuel
# run from blocks/process_jammer

# check if purpur pillar "wire" is attached
execute if block ~ ~-1 ~ purpur_pillar[axis=y] run tag @s add gm4_ta_wired

# tag nearby entities based on pyramid level
tag @e[type=#gm4_teleportation_anchors:affected,distance=..16] add gm4_ta_new_jammed
execute if predicate gm4_teleportation_anchors:has_pyramid_2 run tag @e[type=#gm4_teleportation_anchors:affected,distance=..32] add gm4_ta_new_jammed
execute if predicate gm4_teleportation_anchors:has_pyramid_3 run tag @e[type=#gm4_teleportation_anchors:affected,distance=..64] add gm4_ta_new_jammed

# track which jammed affected which entity and set decay score
scoreboard players set @e[type=#gm4_teleportation_anchors:affected,tag=gm4_ta_new_jammed,distance=..33] gm4_ta_jam_time 3
scoreboard players operation @e[type=#gm4_teleportation_anchors:affected,tag=gm4_ta_new_jammed,distance=..33] gm4_ta_jam_id = @s gm4_ta_jam_id
tag @e[type=#gm4_teleportation_anchors:affected,tag=gm4_ta_new_jammed,distance=..33] add gm4_ta_jammed
tag @e[type=#gm4_teleportation_anchors:affected,distance=..33] remove gm4_ta_new_jammed

particle minecraft:reverse_portal ~ ~0.5 ~ 0.01 0.7 0.01 0.01 30 force
