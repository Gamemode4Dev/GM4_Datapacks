# converts an existing cow into a brown mooshroom
# @s = cow to be converted
# at @s (after move)
# run from gm4_shroomites:spore/move/postmovement

# turn cow into a brown mooshroom
summon mooshroom ~ ~ ~ {Type:"brown",Tags:["gm4_new_shroomite_mooshroom"]}
teleport @e[type=mooshroom,tag=gm4_new_shroomite_mooshroom,limit=1,distance=0] @s
data modify entity @e[type=mooshroom,tag=gm4_new_shroomite_mooshroom,limit=1,distance=0] {} merge from entity @s {}
execute as @e[type=mooshroom,limit=1,distance=0] run function gm4_shroomites:mooshroom/initialize/brown

# particles and sound
particle minecraft:mycelium ~ ~.8 ~ .4 .4 .4 0 50
playsound minecraft:block.chorus_flower.grow hostile @a[distance=..10] ~ ~ ~ 0.625
particle block brown_mushroom_block ~ ~1 ~ .3 .3 .3 20 20

# add to age
scoreboard players operation @s gm4_shroom_data += #conversion_cost gm4_shroom_data

# kill cow
tp @s ~ -4096 ~

