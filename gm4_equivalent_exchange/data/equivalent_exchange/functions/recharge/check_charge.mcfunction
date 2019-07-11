#@s = @e[tag=alchemical_crafter] with recharge altar unless stone is fully charged
#Run from recharge/slow_timer

tag @s add gm4_ee_charge_stone
summon area_effect_cloud ~-4 ~ ~-4 {Duration:10,CustomName:'"gm4_ee_flower_checker"',Tags:["gm4_ee_flower_checker"]}

#calculate random position
execute store result score randomX gm4_ee_charge run data get entity @e[tag=gm4_ee_flower_checker,limit=1] UUIDMost 0.00000000023283064365386962890625
scoreboard players operation randomZ gm4_ee_charge = randomX gm4_ee_charge

scoreboard players set 10 gm4_ee_charge 10
scoreboard players operation randomZ gm4_ee_charge %= 10 gm4_ee_charge

scoreboard players set 9 gm4_ee_charge 9
scoreboard players operation randomX gm4_ee_charge %= 9 gm4_ee_charge
scoreboard players operation randomZ gm4_ee_charge %= 9 gm4_ee_charge

#move the entity
execute as @e[tag=gm4_ee_flower_checker] at @s run function equivalent_exchange:recharge/check_for_flower

tag @s remove gm4_ee_charge_stone
