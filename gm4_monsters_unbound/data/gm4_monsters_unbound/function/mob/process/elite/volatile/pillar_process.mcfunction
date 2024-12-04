# process volatile pillar
# @s = pillar marker
# at @s
# run from clocks/elite/volatile_pillar

particle block{block_state:"purple_glazed_terracotta"} ~ ~5 ~ 0.2 8 0.2 1 32

scoreboard players set $particle_ring gm4_mu_data 360
function gm4_monsters_unbound:mob/process/elite/volatile/pillar_particle_ring

scoreboard players add @s gm4_mu_timer 1

execute if score @s gm4_mu_timer matches 60 run playsound minecraft:entity.breeze.inhale hostile @a ~ ~ ~ 2 2
execute if score @s gm4_mu_timer matches 70.. run return run function gm4_monsters_unbound:mob/process/elite/volatile/pillar_explode

scoreboard players set $keep_tick.elite_pillar_volatile gm4_mu_keep_tick 1
