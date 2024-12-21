# clock totem processing
# @s = unspecified
# at unspecified
# scheduled from armor/augment/type/totemic/activate
# scheduled from here
# run from main

scoreboard players set $keep_tick.totemic gm4_aa_keep_tick 0

execute as @a[tag=gm4_aa_totem_hasted] run function gm4_augmented_armor:armor/augment/type/totemic/haste/remove_buff
execute as @a[scores={gm4_aa_augment.totemic.strength_effect=1..}] run function gm4_augmented_armor:armor/augment/type/totemic/strength/remove_buff

execute as @e[type=armor_stand,tag=gm4_aa_totem] at @s run function gm4_augmented_armor:armor/augment/type/totemic/process

execute if score $keep_tick.totemic gm4_aa_keep_tick matches 1 run schedule function gm4_augmented_armor:clocks/temp/totemic 5s
