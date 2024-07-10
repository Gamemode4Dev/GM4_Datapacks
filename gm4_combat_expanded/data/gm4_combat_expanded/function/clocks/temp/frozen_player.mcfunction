
scoreboard players set $keep_tick.frozen_player gm4_ce_keep_tick 0
execute as @a[tag=gm4_ce_frozen] at @s run function gm4_combat_expanded:effect/freeze/tick_player

execute if score $keep_tick.frozen_player gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/frozen_player 1t
