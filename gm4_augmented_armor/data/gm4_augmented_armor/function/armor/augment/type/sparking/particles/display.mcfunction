# play particles around the affected entity
# @s = entity with a lightning charge
# at @s rotaed ~x ~
# run from weapon/modifier/lightning/particles/eval_rotation
# run from here

$particle electric_spark ^ ^$(height) ^$(scale) 0.015 0.015 0.015 0.05 1

scoreboard players remove $particles_to_display gm4_aa_data 1
$execute if score $particles_to_display gm4_aa_data matches 1.. rotated ~$(deg_pp) ~ run function gm4_augmented_armor:armor/augment/type/sparking/particles/display with storage gm4_augmented_armor:temp lightning
