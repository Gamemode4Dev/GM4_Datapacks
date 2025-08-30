# temporary clock for fear effect
# @s = unspecified
# at unspecified
# schedule from here
# schedule from effect/fear/apply

scoreboard players set $keep_tick.feared_entity gm4_mu_keep_tick 0
execute as @a[tag=gm4_mu_feared] at @s run function gm4_monsters_unbound:effect/fear/tick

execute if score $keep_tick.feared_entity gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/effect/fear 5t
