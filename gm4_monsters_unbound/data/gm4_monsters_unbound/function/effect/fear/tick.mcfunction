# tick fear effect for this player
# @s = player with fear effect
# at @s
# run from clocks/effect/fear

# tick down effect, remove if it reaches 0
scoreboard players remove @s gm4_mu_feared_time 1
execute if score @s gm4_mu_feared_time matches ..0 run return run function gm4_monsters_unbound:effect/fear/remove

# re-apply effects
effect give @s[scores={gm4_mu_feared_time=9..}] blindness 3 0 true
effect give @s[scores={gm4_mu_feared_time=9..}] darkness 3 0 true
effect give @s[scores={gm4_mu_feared_time=9..}] nausea 3 0 true
effect give @s wither 1 0 true

# particles
particle dust{color:[0.000,0.000,0.000],scale:1} ~ ~0.9 ~ 0.3 0.65 0.3 2 6 normal
particle ash ~ ~0.9 ~ 0.3 0.65 0.3 0 6 normal

# keep clock running
scoreboard players set $keep_tick.feared_entity gm4_mu_keep_tick 1
