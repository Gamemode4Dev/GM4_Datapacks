# add an additional tick of regen
# @s = player wearing sustain armour below 50% health
# at unspecified
# run from main

# need to run heal_calc here to make sure the regen happens now
function gm4_survival_refightalized:player/health/regen_combat_health
execute if score @s gm4_sr_healstore matches 1.. run function gm4_survival_refightalized:player/health/heal/heal_calc
