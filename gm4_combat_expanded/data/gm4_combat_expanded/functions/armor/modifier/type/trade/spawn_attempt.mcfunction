# attempt to spawn a wandering trader near player wearing trade armor
# @s = player wearing armour
# at @s
# run from armor/modifier/type/trade/check

# extra kill to prevent double spawn
kill @e[type=marker,tag=gm4_ce_trader_spawn]

summon marker ^ ^ ^-5 {Tags:["gm4_ce_trader_spawn"]}
execute as @e[type=marker,tag=gm4_ce_trader_spawn] at @s run spreadplayers ~ ~ 0 5 false @s
execute as @e[type=marker,tag=gm4_ce_trader_spawn,distance=..12] at @s run function gm4_combat_expanded:armor/modifier/type/trade/spawn_success 
kill @e[type=marker,tag=gm4_ce_trader_spawn]
