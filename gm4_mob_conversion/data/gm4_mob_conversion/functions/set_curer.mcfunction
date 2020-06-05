# @s = potion trading cleric villager converted from witch.
# run from initialise_brewer

# Builds the gossips array on storage to avoid a bug with modifying gossips
data merge storage gm4:temp {Gossips:[{Type:"minor_positive",Value:20}]}
data modify storage gm4:temp Gossips[0].Target set from entity @e[type=minecraft:item,limit=1,distance=..3,tag=gm4_gapple] Thrower
data modify entity @s Gossips set from storage gm4:temp Gossips
