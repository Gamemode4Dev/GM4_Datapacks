# @s = player who placed a brewing stand
# run from advancement gm4_brewing:place_brewing_stand

execute if score gm4_brewing load.status matches 1 if score gm4_brewing_minor load.status matches 0 run function gm4_brewing-1.0:place_brewing_stand
