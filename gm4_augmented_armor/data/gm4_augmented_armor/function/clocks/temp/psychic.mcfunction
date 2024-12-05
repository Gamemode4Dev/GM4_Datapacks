# use this tick clock only when needed
# @s = unspecified
# at unspecified
# run from main
# schedule from here

scoreboard players set $keep_tick.psychic gm4_aa_keep_tick 0

scoreboard players add $check.psychic gm4_aa_keep_tick 1
execute as @a[predicate=gm4_augmented_armor:modified_armor/augment/psychic,gamemode=!spectator] at @s run function gm4_augmented_armor:armor/augment/type/psychic/prep
execute as @e[type=item_display,tag=gm4_aa_psychic.sword] unless score @s gm4_aa_keep_tick = $check.psychic gm4_aa_keep_tick run kill @s

execute if score $keep_tick.psychic gm4_aa_keep_tick matches 1 run schedule function gm4_augmented_armor:clocks/temp/psychic 1t
