# run from armor/modifiers/type/trade/check
# @s = player wearing trade armour
# at @s

summon marker ~ ~ ~ {Tags:["gm4_ce_trader_spawn"]}
spreadplayers ~ ~ 8 16 false @e[type=marker,tag=gm4_ce_trader_spawn]
execute as @e[type=marker,tag=gm4_ce_trader_spawn,distance=..22] at @s run function gm4_combat_evolved:armor/modifiers/type/trade/spawn_success 
kill @e[type=marker,tag=gm4_ce_trader_spawn]
