# use this tick clock only when needed
# @s = unspecified
# at unspecified
# schedule from here

scoreboard players set $keep_tick.gleaming gm4_aa_keep_tick 0

scoreboard players add $gleaming_timer gm4_aa_data 1
execute if score $gleaming_timer gm4_aa_data matches 61.. run scoreboard players set $gleaming_timer gm4_aa_data 1
execute as @a[tag=gm4_aa_gleaming.active] at @s run function gm4_augmented_armor:armor/augment/type/gleaming/tick

execute if score $keep_tick.gleaming gm4_aa_keep_tick matches 1 run schedule function gm4_augmented_armor:clocks/temp/gleaming 1t
