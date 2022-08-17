# @s = teleportation jammer with fuel
# run from blocks/jammer/check_fuel

# check if purpur pillar "wire" is attached
execute if block ~ ~-1 ~ purpur_pillar[axis=y] run tag @s add gm4_ta_wired

# tag nearby entities based on pyramid level
tag @e[team=!gm4_invalid_team,type=!armor_stand,distance=..4,nbt=!{NoAI:1b}] add gm4_ta_new_jammed
execute if predicate gm4_teleportation_anchors:has_pyramid_1 run tag @e[team=!gm4_invalid_team,type=!armor_stand,distance=..16,nbt=!{NoAI:1b}] add gm4_ta_new_jammed
execute if predicate gm4_teleportation_anchors:has_pyramid_2 run tag @e[team=!gm4_invalid_team,type=!armor_stand,distance=..64,nbt=!{NoAI:1b}] add gm4_ta_new_jammed
execute if predicate gm4_teleportation_anchors:has_pyramid_3 run tag @e[team=!gm4_invalid_team,type=!armor_stand,distance=..128,nbt=!{NoAI:1b}] add gm4_ta_new_jammed

# track which jammed affected which entity and set decay score
scoreboard players set @e[tag=gm4_ta_new_jammed,distance=..129] gm4_ta_jam_time 3
tag @e[tag=gm4_ta_new_jammed,distance=..129] add gm4_ta_jammed
#  ZC compatibility
execute as @e[tag=gm4_ta_new_jammed,distance=..129] unless score @s gm4_zc_no_explode matches 3.. run scoreboard players set @s gm4_zc_no_explode 3
tag @e[distance=..129] remove gm4_ta_new_jammed

particle minecraft:reverse_portal ~ ~0.5 ~ 0.01 0.7 0.01 0.01 30 force
