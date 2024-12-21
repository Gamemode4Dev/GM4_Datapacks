# freeze closest mob for 2 seconds
# @s = totem armor_stand
# at @s
# run from armor/augment/type/totemic/process

particle entity_effect{color:[0.545,0.686,0.878,0.33]} ~ ~1.2 ~ 0.1 0.1 0.1 0.05 12
scoreboard players set $attempts_left gm4_aa_data 5
execute positioned ~ ~1.25 ~ run function gm4_augmented_armor:armor/augment/type/totemic/freezing/find_target
tag @e[predicate=gm4_augmented_armor:technical/pvp_able,tag=!smithed.strict,tag=gm4_mu_tried,distance=..16] remove gm4_mu_tried
