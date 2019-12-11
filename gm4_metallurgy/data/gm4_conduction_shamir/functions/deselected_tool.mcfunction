# @s = players that used to hold a conduction tool but just deselected it
# at @s
# ran from metallurgy:main

#self strike unless the tool was equipped for a short time
execute if score @s gm4_volt_time matches 0..198 run function gm4_conduction_shamir:self_strike/prepare_lightning_self

#reset effects
effect clear @s haste
effect clear @s strength

#reset scores
scoreboard players reset @s gm4_volt_damage
scoreboard players reset @s gm4_volt_time
