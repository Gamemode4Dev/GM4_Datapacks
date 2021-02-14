# @s = soul fragment with a linked player, a player holding a soul lantern, or placed soul revealing blocks nearby
# from soul_fragment/process

# emit particles if revealed
particle minecraft:soul ~ ~ ~ .05 0 .05 .015 1 force

# hum if revealed
playsound minecraft:block.beacon.ambient neutral @a[distance=..16] ~ ~ ~ .6 .4 .6

scoreboard players reset @s gm4_sf_reveal
