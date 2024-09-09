# grant all players in range +20% attack speed and movement speed for 4 seconds
# @s = totem armor_stand
# at @s
# run from armor/augment/type/totem/process

particle entity_effect{color:[0.851,0.753,0.263,0.33]} ~ ~1.2 ~ 0.1 0.1 0.1 0.05 12

scoreboard players set $target_affected gm4_aa_data 0
execute positioned ~ ~1.25 ~ as @a[distance=..16,gamemode=!spectator] facing entity @s eyes positioned ^ ^ ^0.1 run function gm4_augmented_armor:armor/augment/type/totem/haste/los_raycast

scoreboard players set $particle_ring gm4_aa_data 180
execute if score $target_affected gm4_aa_data matches 1 positioned ~ ~1.25 ~ run function gm4_augmented_armor:armor/augment/type/totem/haste/particle_ring

