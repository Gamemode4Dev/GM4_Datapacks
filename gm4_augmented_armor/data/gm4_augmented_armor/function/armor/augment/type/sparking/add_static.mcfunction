
# if the augment clock was not running first clear any old stacks
execute if score $keep_tick.sparking gm4_aa_keep_tick matches 0 as @e[scores={gm4_aa_augment.sparking.static_stacks=1..}] run function gm4_augmented_armor:armor/augment/type/sparking/remove_static

scoreboard players operation @s gm4_aa_augment.sparking.static_stacks += $level gm4_aa_data
scoreboard players set @s gm4_aa_augment.sparking.timer 160

execute unless score $keep_tick.sparking gm4_aa_keep_tick matches 1 run schedule function gm4_augmented_armor:clocks/temp/sparking 1t
scoreboard players set $keep_tick.sparking gm4_aa_keep_tick 1
