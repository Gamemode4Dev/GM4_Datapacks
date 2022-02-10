# @s =  player with crystal in off-hand
# at @s
# run from player/crystal/process

# play activation sound
playsound minecraft:block.beacon.activate player @a[distance=..8] ~ ~ ~ 0.3 1.7
playsound minecraft:block.amethyst_cluster.hit player @a[distance=..8] ~ ~ ~ 0.3 1.2

# setup score to grant effects
scoreboard players set @s gm4_zc_crystal 4
