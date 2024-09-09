# restore 1 health to the most damaged player in range 
# @s = totem armor_stand
# at @s
# run from armor/augment/type/totem/process

particle entity_effect{color:[0.973,0.141,0.137,0.33]} ~ ~1.2 ~ 0.1 0.1 0.1 0.05 12

scoreboard players set $lowest_percentage_seen gm4_aa_data 100
execute positioned ~ ~1.25 ~ as @a[distance=..16,gamemode=!spectator,sort=nearest] facing entity @s eyes positioned ^ ^ ^0.1 run function gm4_augmented_armor:armor/augment/type/totem/healing/los_raycast

execute as @p[distance=..16,tag=gm4_aa_healing_totem_target] run function gm4_augmented_armor:armor/augment/type/totem/healing/heal
