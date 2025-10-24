# @s = gm4_soul_glass marker
# run from effect/check

data modify storage gm4_soul_glass:temp effect set from block ~ ~-1 ~ primary_effect
function gm4_soul_glass:effect/obtain_numeric_primary_id

data modify storage gm4_soul_glass:temp effect set from block ~ ~-1 ~ secondary_effect
execute if data storage gm4_soul_glass:temp effect run function gm4_soul_glass:effect/obtain_numeric_secondary_id

data remove block ~ ~-1 ~ primary_effect
data remove block ~ ~-1 ~ secondary_effect

playsound minecraft:entity.wither.spawn block @a[distance=..10] ~ ~ ~ .5 1.3
particle minecraft:witch ~ ~-1 ~ 0.5 0.5 0.5 0 40 force
advancement grant @a[distance=..4] only gm4:soul_glass
