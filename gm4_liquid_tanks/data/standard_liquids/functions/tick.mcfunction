#run from liquid_tanks:pulse_check

#furnace fuel
#CONVERT TO EXECUTE SCHEDULE 1.14
execute if score standard_liquids_furnace_start gm4_lt_util matches 1.. as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_lt_furnace_start] at @s align xyz positioned ~ ~1 ~ at @e[type=area_effect_cloud,tag=gm4_lt_util_block,tag=gm4_ltu_furnace,dx=0,limit=4] positioned ^ ^-1 ^1 run function standard_liquids:util/furnace_fuel
scoreboard players reset standard_liquids_furnace_start gm4_lt_util

#experience deposit
execute if score standard_liquids_deposit_experience gm4_lt_util matches 1.. as @a[gamemode=!spectator,level=1..] at @s if block ~ ~-0.4 ~ hopper{CustomName:"{\"text\":\"Empty Tank\"}"} positioned ~ ~-0.4 ~ align xyz positioned ~0.5 ~ ~0.5 as @e[type=armor_stand,tag=gm4_liquid_tank,limit=1,distance=..0.5,tag=gm4_lt_empty] run function standard_liquids:liquid_init/experience
execute if score standard_liquids_deposit_experience gm4_lt_util matches 1.. as @a[gamemode=!spectator] at @s if block ~ ~-0.4 ~ hopper{CustomName:"{\"text\":\"Experience Tank\"}"} positioned ~ ~-0.4 ~ align xyz positioned ~0.5 ~ ~0.5 if score @e[type=armor_stand,tag=gm4_liquid_tank,limit=1,distance=..0.5,tag=gm4_lt_experience] gm4_lt_value matches ..1394 run function standard_liquids:util/deposit_experience

execute if score standard_liquids_deposit_experience gm4_lt_util matches 1 run scoreboard players set standard_liquids_deposit_experience gm4_lt_util 2

#experience withdraw
execute if score standard_liquids_withdraw_experience gm4_lt_util matches 1.. as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_lt_experience] at @s positioned ~ ~-2 ~ if entity @a[distance=..0.5,gamemode=!spectator] if score @s gm4_lt_value matches 1.. run function standard_liquids:util/withdraw_experience

execute if score standard_liquids_withdraw_experience gm4_lt_util matches 1 run scoreboard players set standard_liquids_withdraw_experience gm4_lt_util 2
