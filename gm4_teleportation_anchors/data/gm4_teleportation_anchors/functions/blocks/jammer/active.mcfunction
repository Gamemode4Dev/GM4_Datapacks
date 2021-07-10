# @s = teleportation jammer with fuel
# run from blocks/jammer/check_fuel

# check if purpur pillar "wire" is attached
execute if block ~ ~-1 ~ purpur_pillar[axis=y] run tag @s add gm4_ta_wired

# tag nearby entities based on pyramid level
tag @e[team=!invalid_team,type=!armor_stand,distance=..4] add gm4_ta_new_jammed
execute if predicate gm4_teleportation_anchors:has_pyramid_1 run tag @e[team=!invalid_team,type=!armor_stand,distance=..16] add gm4_ta_new_jammed
execute if predicate gm4_teleportation_anchors:has_pyramid_2 run tag @e[team=!invalid_team,type=!armor_stand,distance=..32] add gm4_ta_new_jammed
execute if predicate gm4_teleportation_anchors:has_pyramid_3 run tag @e[team=!invalid_team,type=!armor_stand,distance=..64] add gm4_ta_new_jammed

# track which jammed affected which entity and set decay score
scoreboard players set @e[tag=gm4_ta_new_jammed,distance=..65] gm4_ta_jam_time 3
tag @e[tag=gm4_ta_new_jammed,distance=..65] add gm4_ta_jammed
tag @e[distance=..65] remove gm4_ta_new_jammed

particle minecraft:reverse_portal ~ ~0.5 ~ 0.01 0.7 0.01 0.01 30 force
