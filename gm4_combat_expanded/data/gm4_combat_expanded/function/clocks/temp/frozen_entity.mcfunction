
scoreboard players set $keep_tick.frozen_entity gm4_ce_keep_tick 0
execute as @e[tag=gm4_ce_frozen] at @s run function gm4_combat_expanded:effect/freeze/tick

execute if score $keep_tick.frozen_entity gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/frozen_entity 5t
