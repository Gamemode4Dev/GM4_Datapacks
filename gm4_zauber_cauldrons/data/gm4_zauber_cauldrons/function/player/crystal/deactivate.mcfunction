# @s = player
# at world spawn
# run from player/submain

# play deactivation sound
playsound minecraft:block.beacon.deactivate player @a[distance=..8] ~ ~ ~ 0.3 1.7
playsound minecraft:block.amethyst_cluster.hit player @a[distance=..8] ~ ~ ~ 0.3 0.8

# clear score
scoreboard players reset @s gm4_zc_crystal
