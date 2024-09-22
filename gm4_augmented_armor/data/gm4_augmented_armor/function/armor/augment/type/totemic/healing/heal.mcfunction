
scoreboard players add @s gm4_sr_healstore 1
tag @s remove gm4_aa_healing_totem_target
execute at @s anchored eyes positioned ^ ^0.33 ^ run particle heart ~ ~ ~ 0.33 0.2 0.33 0 3

execute positioned ~ ~1.75 ~ facing entity @s eyes positioned ^ ^ ^0.1 run function gm4_augmented_armor:armor/augment/type/totemic/healing/particle_raycast
