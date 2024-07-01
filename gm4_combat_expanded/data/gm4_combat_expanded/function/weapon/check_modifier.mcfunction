# check the modifier on the used weapon
# @s = player wielding the weapon
# at @s
# run from weapon/process

execute if score $modifier gm4_ce_data matches 101 run function gm4_combat_expanded:weapon/modifier/poison/activate
execute if score $modifier gm4_ce_data matches 102 run function gm4_combat_expanded:weapon/modifier/weakness/activate
execute if score $modifier gm4_ce_data matches 105 run function gm4_combat_expanded:weapon/modifier/delay/activate
execute if score $modifier gm4_ce_data matches 110 run function gm4_combat_expanded:weapon/modifier/giant/activate
execute if score $modifier gm4_ce_data matches 111 run function gm4_combat_expanded:weapon/modifier/swift/activate
execute if score $modifier gm4_ce_data matches 112 run function gm4_combat_expanded:weapon/modifier/pierce/activate
execute if score $modifier gm4_ce_data matches 116 run function gm4_combat_expanded:weapon/modifier/lightning/activate
