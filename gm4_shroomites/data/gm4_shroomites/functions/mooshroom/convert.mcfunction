# converts an existing cow into a mooshroom
# @s = cow to be converted
# at @s (after move)
# run from gm4_shroomites:spore/move/postmovement

# turn cow into mooshroom
summon mooshroom
teleport @e[type=mooshroom,limit=1,distance=0] @s
particle minecraft:mycelium ~ ~.8 ~ .4 .4 .4 0 50
playsound minecraft:block.chorus_flower.grow hostile @a[distance=..10] ~ ~ ~ 0.625
particle block red_mushroom_block ~ ~1 ~ .3 .3 .3 20 20

# add to age
scoreboard players operation @s gm4_shroom_data += #conversion_cost gm4_shroom_data

# kill cow
tp @s ~ -4096 ~

