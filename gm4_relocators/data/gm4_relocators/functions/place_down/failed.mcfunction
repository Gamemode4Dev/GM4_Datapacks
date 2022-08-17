# returns the full relocator to the player
# @s = player who placed the relocator
# located at the center of the placed relocator
# run from gm4_relocators:machine/verify_place_down

data modify storage gm4_relocators:temp lore set from entity @s SelectedItem.tag.display.Lore[0]
execute at @s[gamemode=!creative,gamemode=!spectator] run loot spawn ~ ~.3 ~ loot gm4_relocators:items/relocator_full
data merge entity @e[type=item,distance=..7,nbt={Age:0s,Item:{id:"minecraft:player_head",Count:1b,tag:{gm4_machines:{id:"relocator_full"}}}},limit=1] {PickupDelay:0}
data remove storage gm4_relocators:temp lore

particle minecraft:smoke ~ ~ ~ .3 .3 .3 0 10
playsound minecraft:block.fire.extinguish block @a[distance=..8] ~ ~ ~ 0.6 1.5
