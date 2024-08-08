# spawn the amount of arrows specified
# @s = arrow shot by player wearing armor
# at @s
# run from armor/augment/type/archer/apply
# run from here

execute if entity @s[type=arrow] positioned ^ ^ ^ summon arrow run function gm4_augmented_armor:armor/augment/type/archer/storm_arrow
execute if entity @s[type=spectral_arrow] positioned ^ ^ ^ summon spectral_arrow run function gm4_augmented_armor:armor/augment/type/archer/storm_arrow

scoreboard players add $storm_arrows_spawned gm4_aa_data 1
execute if score $storm_arrows_spawned gm4_aa_data >= $storm_arrow_target gm4_aa_data run scoreboard players set $storm_arrows_spawned gm4_aa_data 0
execute if score $storm_arrows_spawned gm4_aa_data matches 1.. run function gm4_augmented_armor:armor/augment/type/archer/spawn_arrows
