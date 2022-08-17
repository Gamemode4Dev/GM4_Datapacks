# Gives the curer a discount for the newly cured Potion Cleric
# @s = Potion Cleric villager converted from witch.
# at @s
# run from initialise_potion_cleric

# Builds the gossips array on storage to avoid a bug with modifying gossips
data merge storage gm4_mob_curing:temp {Gossips:[{Type:"minor_positive",Value:20}]}
data modify storage gm4_mob_curing:temp Gossips[0].Target set from entity @e[type=minecraft:item,limit=1,distance=..3,tag=gm4_gapple] Thrower
data modify entity @s Gossips set from storage gm4:temp Gossips

execute store result score $curer gm4_mob_curing_data run data get storage gm4_mob_curing:temp Gossips[0].Target[3] 0.001
execute as @a[distance=..16] store result score @s gm4_mob_curing_data run data get entity @s UUID[3] 0.001
execute as @a[distance=..16] if score @s gm4_mob_curing_data = $curer gm4_mob_curing_data run advancement grant @s only gm4:mob_curing

data remove storage gm4_mob_curing:temp {}
