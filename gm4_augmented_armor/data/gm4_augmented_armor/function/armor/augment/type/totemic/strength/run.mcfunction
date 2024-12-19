# grant all players in range +1 attack damage for 4 seconds
# @s = totem armor_stand
# at @s
# run from armor/augment/type/totemic/process

particle entity_effect{color:[1.000,0.843,0.000,0.33]} ~ ~1.2 ~ 0.1 0.1 0.1 0.05 12

particle trial_spawner_detection ~ ~0.85 ~ 0.4 0.01 0.4 0 6
execute as @a[distance=..16,gamemode=!spectator] run function gm4_augmented_armor:armor/augment/type/totemic/strength/add_buff
effect give @e[predicate=gm4_augmented_armor:technical/pvp_able,tag=!smithed.strict,distance=..16] glowing 6 0
