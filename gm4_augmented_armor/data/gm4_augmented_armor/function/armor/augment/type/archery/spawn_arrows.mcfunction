# spawn the amount of arrows specified
# @s = arrow shot by player wearing armor
# at @s
# run from armor/augment/type/archery/apply
# run from here

execute if entity @s[type=arrow] positioned ^ ^ ^ summon arrow run function gm4_augmented_armor:armor/augment/type/archery/init_arrow
execute if entity @s[type=spectral_arrow] positioned ^ ^ ^ summon spectral_arrow run function gm4_augmented_armor:armor/augment/type/archery/init_arrow

scoreboard players add $archery_arrows_spawned gm4_aa_data 1
execute if score $archery_arrows_spawned gm4_aa_data >= $archery_arrow_target gm4_aa_data run scoreboard players set $archery_arrows_spawned gm4_aa_data 0
execute if score $archery_arrows_spawned gm4_aa_data matches 1.. run function gm4_augmented_armor:armor/augment/type/archery/spawn_arrows
