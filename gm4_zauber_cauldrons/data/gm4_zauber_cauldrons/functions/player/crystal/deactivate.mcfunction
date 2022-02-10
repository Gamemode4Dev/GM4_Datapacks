# @s =  player with crystal in off-hand
# at world spawn
# run from player/submain

# play activation sound
playsound minecraft:block.beacon.deactivate player @a[distance=..8] ~ ~ ~ 0.3 1.7
playsound minecraft:block.amethyst_cluster.hit player @a[distance=..8] ~ ~ ~ 0.3 0.8

# clear score
scoreboard players reset @s gm4_zc_crystal
