# run from armor/modifiers/type/trade/check
# @s = player wearing trade armour
# at @s

summon marker ^ ^ ^-5 {Tags:["gm4_ce_trader_spawn"]}
execute as @e[type=marker,tag=gm4_ce_trader_spawn] at @s run spreadplayers ~ ~ 0 5 false @s
execute as @e[type=marker,tag=gm4_ce_trader_spawn,distance=..12] at @s run function gm4_combat_evolved:armor/modifiers/type/trade/spawn_success 
kill @e[type=marker,tag=gm4_ce_trader_spawn]
