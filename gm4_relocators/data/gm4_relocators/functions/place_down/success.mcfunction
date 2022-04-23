# returns the empty relocator to the player
# @s = player who placed the relocator
# located at the center of the placed relocator
# run from gm4_relocators:machine/verify_place_down

# return relocator
playsound minecraft:block.beacon.activate block @a[distance=..8] ~ ~ ~ 1 2
execute at @s[gamemode=!creative,gamemode=!spectator] run loot spawn ~ ~.3 ~ loot gm4_relocators:items/relocator_empty
data merge entity @e[type=item,distance=..7,nbt={Age:0s,Item:{id:"minecraft:player_head",Count:1b,tag:{gm4_machines:{id:"relocator_empty"}}}},limit=1] {PickupDelay:0}
