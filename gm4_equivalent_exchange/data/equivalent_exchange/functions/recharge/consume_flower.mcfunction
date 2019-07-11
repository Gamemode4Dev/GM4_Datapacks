#@s = flower_checker area_effect_cloud inside a consumable block
#run from recharge/check_for_flower

#check what type of charge it should make
execute at @e[tag=gm4_ee_charge_stone,sort=nearest,limit=1] if block ~ ~ ~ dropper as @s at @s run function equivalent_exchange:recharge/alchemical_crafter/consume_flower
execute at @e[tag=gm4_ee_charge_stone,sort=nearest,limit=1] if block ~ ~ ~ cauldron as @s at @s run function equivalent_exchange:recharge/cauldron/consume_flower

#destroy the flower
setblock ~ ~ ~ air replace
#play sound
playsound entity.generic.eat block @a[distance=..8] ~ ~ ~ 0.2 0.75
playsound entity.turtle.egg_break block @a[distance=..8] ~ ~ ~ 0.2 1.3
particle block seagrass ~ ~.2 ~ 0 0 0 0 7

#summon pretty entity line
summon area_effect_cloud ~ ~ ~ {Duration:200,CustomName:'"gm4_ee_decorative_particle"',Tags:["gm4_ee_decorative_particle","gm4_unrotated_particle_cloud"]}
teleport @e[tag=gm4_unrotated_particle_cloud,limit=1] ~ ~ ~ facing entity @e[tag=gm4_ee_charge_stone,sort=nearest,limit=1] eyes
tag @e[tag=gm4_unrotated_particle_cloud] remove gm4_unrotated_particle_cloud
