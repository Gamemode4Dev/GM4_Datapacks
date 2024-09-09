
scoreboard players set $attempts_left gm4_aa_data 0

# make the particle raycast
execute positioned ~0.8 ~0.8 ~0.8 run function gm4_augmented_armor:armor/augment/type/totem/freezing/particle_raycast

# freeze entities hit for 2 seconds, or apply a level of Chill to players
scoreboard players set $freeze_seconds gm4_mu_data 2
execute if entity @s[type=!player] run function gm4_monsters_unbound:effect/freeze/apply
execute if entity @s[type=player] run function gm4_monsters_unbound:effect/freeze/apply_chill
