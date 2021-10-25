#run from main and hit
# @s = @e[type=pig,tag=gm4_chairs] and NOT inside stair blocks

# spawn saddle item
loot spawn ~ ~ ~ loot gm4_chairs:drop_saddle
tag @e[type=minecraft:item,distance=..1,limit=1,sort=nearest] add gm4_chairs_ignore

# dismount if sitting on chair
execute as @a[predicate=gm4_chairs:sitting_in_chair,distance=..0.4] run tp @s @s

# remove chair
tp @s ~ -1000 ~
