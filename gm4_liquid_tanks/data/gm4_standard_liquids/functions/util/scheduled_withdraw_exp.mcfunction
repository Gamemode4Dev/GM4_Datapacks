# scheduled from standard_liquids:util_below

execute as @e[type=marker,tag=gm4_liquid_tank,tag=gm4_lt_experience] at @s if block ~ ~ ~ hopper[enabled=true] positioned ~ ~-2.5 ~ if entity @a[distance=..0.5,gamemode=!spectator] if score @s gm4_lt_value matches 1.. run function gm4_standard_liquids:util/withdraw_experience
scoreboard players set $schedule_withdraw_exp gm4_lt_util 2

schedule function gm4_standard_liquids:util/scheduled_withdraw_exp 1t
