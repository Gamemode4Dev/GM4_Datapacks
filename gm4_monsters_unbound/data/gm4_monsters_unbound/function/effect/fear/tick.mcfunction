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

# sounds
scoreboard players operation $playsound gm4_mu_data = @s gm4_mu_feared_time
scoreboard players operation $playsound gm4_mu_data %= #4 gm4_mu_data
execute if score $playsound gm4_mu_data matches 0 if predicate {condition:"random_chance",chance:0.666} run function gm4_monsters_unbound:effect/fear/playsound

# particles
execute anchored eyes run particle dust{color:[0.000,0.000,0.000],scale:4} ^ ^ ^0.15 0.2 0.2 0.2 2 6 force @s
execute anchored eyes run particle dust{color:[0.000,0.000,0.000],scale:4} ^ ^ ^0.75 0.4 0.4 0.4 2 18 force @s

# keep clock running
scoreboard players set $keep_tick.feared_entity gm4_mu_keep_tick 1
