
scoreboard players set $keep_tick.frozen_entity gm4_mu_keep_tick 0
execute as @e[tag=gm4_mu_frozen] at @s run function gm4_monsters_unbound:effect/freeze/tick

execute if score $keep_tick.frozen_entity gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/temp/frozen_entity 5t
