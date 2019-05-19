tag @s add gm4_has_conduction

#initiate volt_time
execute unless score @s gm4_volt_time matches -1.. run function conduction_shamir:add_initial_charge

#decrease gm4_volt_time score
execute if score @s gm4_volt_time matches 0.. run function conduction_shamir:volt_timer

#remove charge and strike self
execute if score @s gm4_volt_time matches 0 unless score @s gm4_volt_damage matches 40.. at @s run function conduction_shamir:failed_to_deplete_charge

#remove charge, cast lightning at looking vector and restart cycle
execute if score @s gm4_volt_time matches 0 if score @s gm4_volt_damage matches 40.. at @s run function conduction_shamir:successfully_deplete_charge
