# disable the glider if the gm4_horses is not mounted
# @s = tamed gm4_horse
# at @s
# run from horse_processing/glider/process

execute if score $grounded gm4_horse_data matches 0 run function gm4_horsemanship:horse_processing/glider/ground
tag @s add gm4_horse.glider_disabled
