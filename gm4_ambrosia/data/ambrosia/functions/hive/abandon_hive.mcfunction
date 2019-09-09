# @s = beehive that has no bees left
# at @s
# run from ambrosia:hive/spawn_hive_loot

# kill hive
kill @s

# revert barrel
data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s","with":["Abandoned Beehive","translation.string.FORMISODE"]}'}

# particle
particle minecraft:block barrel ~ ~-2 ~ 0.3 0.3 0.3 0.5 13

# sound
playsound minecraft:block.wood.break block @a[distance=..16] ~ ~ ~ 0.5 0.4 0
