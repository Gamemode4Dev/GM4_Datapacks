#@s = flower_checker area_effect_cloud inside a consumable block
#run from block_handling/recharge_altar

execute as @e[tag=gm4_ee_charge_stone,limit=1,sort=nearest] at @s run function equivalent_exchange:recharge/alchemical_crafter/charge_xp

#remove levels
xp add @s -1 levels

#play sound
playsound item.bucket.empty_lava player @s ~ ~ ~ 0.3 1.2
particle block lime_concrete_powder ~ ~.2 ~ 0 0 0 0 3

#summon pretty entity line
summon area_effect_cloud ~ ~ ~ {Duration:200,CustomName:'"gm4_ee_decorative_particle"',Tags:["gm4_ee_decorative_particle","gm4_unrotated_particle_cloud"]}
teleport @e[tag=gm4_unrotated_particle_cloud,limit=1] ~ ~ ~ facing entity @e[type=armor_stand,tag=gm4_ee_charge_stone,sort=nearest,limit=1] eyes
tag @e[tag=gm4_unrotated_particle_cloud] remove gm4_unrotated_particle_cloud
