
scoreboard players operation $freeze_seconds gm4_mu_data = $total_level gm4_aa_data
$execute as @e[predicate=gm4_augmented_armor:technical/pvp_able,distance=..$(range),tag=!gm4_aa_augment_damager] run function gm4_augmented_armor:armor/augment/type/frostburst/apply
