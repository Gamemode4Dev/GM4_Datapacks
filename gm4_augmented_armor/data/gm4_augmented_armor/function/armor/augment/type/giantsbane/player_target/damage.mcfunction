
scoreboard players operation $giantsbane_damage gm4_aa_data += $damage_dealt gm4_aa_data
execute store result storage gm4_augmented_armor:temp giantsbane.damage float 0.01 run scoreboard players get $giantsbane_damage gm4_aa_data
function gm4_augmented_armor:armor/augment/type/giantsbane/player_target/eval_damage with storage gm4_augmented_armor:temp giantsbane
data remove storage gm4_augmented_armor:temp giantsbane
