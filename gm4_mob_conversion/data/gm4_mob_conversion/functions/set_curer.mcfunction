# @s = potion trading cleric villager converted from witch.
# run from initialise_brewer

data modify entity @s Gossips append value {Type:"minor_positive", Value:25}
data modify entity @s Gossips[-1].Target set from entity @e[type=minecraft:item,limit=1,distance=..3,tag=gm4_gapple] Thrower
