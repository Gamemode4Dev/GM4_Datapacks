# play particles around the affected entity
# @s = entity with a lightning charge
# at @s rotaed ~x ~
# run from weapon/modifier/lightning/particles/eval_rotation
# run from here

$particle electric_spark ^ ^$(height) ^$(scale) 0.015 0.015 0.015 0.05 1

scoreboard players remove $particles_to_display gm4_ce_data 1
$execute if score $particles_to_display gm4_ce_data matches 1.. rotated ~$(deg_pp) ~ run function gm4_combat_expanded:weapon/modifier/lightning/particles/display with storage gm4_combat_expanded:temp lightning
