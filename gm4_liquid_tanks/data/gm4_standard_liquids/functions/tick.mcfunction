#run from liquid_tanks:pulse_check

#experience deposit
execute if score standard_liquids_deposit_experience gm4_lt_util matches 1.. as @a[gamemode=!spectator,level=1..] at @s if block ~ ~-0.4 ~ hopper positioned ~ ~-0.4 ~ align xyz positioned ~0.5 ~ ~0.5 as @e[type=armor_stand,tag=gm4_liquid_tank,limit=1,distance=..0.5,tag=gm4_lt_empty] run function gm4_standard_liquids:liquid_init/experience
execute if score standard_liquids_deposit_experience gm4_lt_util matches 1.. as @a[gamemode=!spectator] at @s if block ~ ~-0.4 ~ hopper positioned ~ ~-0.4 ~ align xyz positioned ~0.5 ~ ~0.5 if score @e[type=armor_stand,tag=gm4_liquid_tank,limit=1,distance=..0.5,tag=gm4_lt_experience] gm4_lt_value matches ..1394 run function gm4_standard_liquids:util/deposit_experience

execute if score standard_liquids_deposit_experience gm4_lt_util matches 1 run scoreboard players set standard_liquids_deposit_experience gm4_lt_util 2

#experience withdraw
execute if score standard_liquids_withdraw_experience gm4_lt_util matches 1.. as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_lt_experience] at @s positioned ~ ~-2 ~ if entity @a[distance=..0.5,gamemode=!spectator] if score @s gm4_lt_value matches 1.. run function gm4_standard_liquids:util/withdraw_experience

execute if score standard_liquids_withdraw_experience gm4_lt_util matches 1 run scoreboard players set standard_liquids_withdraw_experience gm4_lt_util 2
