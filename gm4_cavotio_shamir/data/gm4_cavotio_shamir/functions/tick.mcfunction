execute as @a[gamemode=!spectator,predicate=gm4_cavotio_shamir:holding_cavotio] at @s run function gm4_cavotio_shamir:active_tool

scoreboard players reset @a gm4_use_pick_net
scoreboard players reset @a gm4_use_pick_dia
scoreboard players reset @a gm4_use_pick_gol
scoreboard players reset @a gm4_use_pick_iro
scoreboard players reset @a gm4_use_pick_sto
scoreboard players reset @a gm4_use_pick_woo

schedule function gm4_cavotio_shamir:tick 1t
