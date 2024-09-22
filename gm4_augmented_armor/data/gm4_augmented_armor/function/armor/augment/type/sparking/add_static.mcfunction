
scoreboard players operation @s gm4_aa_augment.sparking.static_stacks += $level gm4_aa_data
scoreboard players set @s gm4_aa_augment.sparking.timer 160

execute unless score $keep_tick.sparking gm4_aa_keep_tick matches 1 run schedule function gm4_augmented_armor:clocks/temp/sparking 1t
