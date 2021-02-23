# @s = player who's died / raycast from player placing a soul in a lantern 
# at @s
# from player/died

# play visuals/sounds
particle minecraft:soul ~ ~1.5 ~ .2 0 .2 .03 5 normal
playsound minecraft:block.chorus_flower.grow player @a[distance=..16] ~ ~ ~ .9 1.5

# summon soul fragment
summon area_effect_cloud ~ ~.2 ~ {Radius:0,Age:-2147483648,Duration:2147483647,CustomName:'"gm4_soul_fragment"',Tags:["gm4_soul_fragment","gm4_new_soul_fragment"],Particle:"block air"}
