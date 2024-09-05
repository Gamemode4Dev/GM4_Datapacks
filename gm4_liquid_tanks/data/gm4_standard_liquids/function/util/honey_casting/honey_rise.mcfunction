#@s = gm4_honey_display
#run from standard_liquids:util/honey_casting/scheduled_honey_rise

teleport @s ~ ~0.0375 ~
scoreboard players add @s gm4_lt_util 1

execute unless block ~ ~1.2 ~ #minecraft:cauldrons run kill @s

execute if score @s gm4_lt_util matches 16.. run function gm4_standard_liquids:util/honey_casting/honey_stop
