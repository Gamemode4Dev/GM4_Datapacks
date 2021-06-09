#run from main and hit
# @s = @e[type=pig,tag=gm4_chairs] and NOT inside stair blocks

# spawn saddle item
loot spawn ~ ~ ~ loot gm4_chairs:drop_saddle
tag @e[type=minecraft:item,distance=..1,limit=1,sort=nearest] add gm4_chairs_ignore

# remove chair
tp @s ~ -1000 ~
