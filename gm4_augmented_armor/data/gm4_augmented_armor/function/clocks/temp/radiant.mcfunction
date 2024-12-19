# use this tick clock only when needed
# @s = unspecified
# at unspecified
# run from main
# schedule from here

scoreboard players set $keep_tick.radiant gm4_aa_keep_tick 0

scoreboard players add $check.radiant gm4_aa_keep_tick 1
execute as @a[predicate=gm4_augmented_armor:modified_armor/augment/radiant,gamemode=!spectator] at @s run function gm4_augmented_armor:armor/augment/type/radiant/prep
execute as @e[type=block_display,tag=gm4_aa_radiant] unless score @s gm4_aa_keep_tick = $check.radiant gm4_aa_keep_tick at @s run function gm4_augmented_armor:armor/augment/type/radiant/remove

execute if score $keep_tick.radiant gm4_aa_keep_tick matches 1 run schedule function gm4_augmented_armor:clocks/temp/radiant 2t
