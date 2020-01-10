# @s = potion trading cleric villager converted from witch.
# run from initialise_brewer

data modify entity @s HandItems[1].tag.TargetMost set from entity @e[type=minecraft:item,limit=1,distance=..3,tag=gm4_gapple] Thrower.M
data modify entity @s HandItems[1].tag.TargetLeast set from entity @e[type=minecraft:item,limit=1,distance=..3,tag=gm4_gapple] Thrower.L

data modify entity @s Gossips append from entity @s HandItems[1].tag
data modify entity @s Gossips[0] merge value {Type:"minor_positive", Value:25}
