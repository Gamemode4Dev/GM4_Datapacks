# returns the relocator if the block can't be picked up
# @s = player who placed the relocator
# located at the center of the block to be picked up
# run from gm4_relocators:pick_up/check_block_validity

execute at @s[gamemode=!creative,gamemode=!spectator] run loot spawn ~ ~.3 ~ loot gm4_relocators:items/relocator_empty
data merge entity @e[type=item,distance=..7,nbt={Age:0s,Item:{id:"minecraft:player_head",Count:1b,tag:{gm4_machines:{id:"relocator_empty"}}}},limit=1] {PickupDelay:0}

particle minecraft:smoke ~ ~ ~ .3 .3 .3 0 10
playsound minecraft:block.fire.extinguish block @a[distance=..8] ~ ~ ~ 0.6 1.5
