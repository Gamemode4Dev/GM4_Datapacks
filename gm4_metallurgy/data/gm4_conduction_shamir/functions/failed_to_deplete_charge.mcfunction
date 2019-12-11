# @s = players holding conduction tool till the effect reached 0, but without having dealt enough damage. Runs only once.
# at @s
# ran from conduction_shamir:main

#self strike
function gm4_conduction_shamir:self_strike/prepare_lightning_self

#reset scores and put tool into "regular" mode
scoreboard players reset @s gm4_volt_damage
scoreboard players set @s gm4_volt_time -1
