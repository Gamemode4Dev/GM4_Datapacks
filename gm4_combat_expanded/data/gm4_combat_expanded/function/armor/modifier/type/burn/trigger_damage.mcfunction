# activate burn armor on wearer getting hit
# @s = player wearing armor
# at @s
advancement revoke @s only gm4_combat_expanded:damaged/armor/burn

item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_combat_expanded:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

scoreboard players set $burn_pieces gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:36} run scoreboard players add $burn_pieces gm4_ce_data 1
execute if data storage gm4_combat_expanded:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:36} run scoreboard players add $burn_pieces gm4_ce_data 1
execute if data storage gm4_combat_expanded:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:36} run scoreboard players add $burn_pieces gm4_ce_data 1
execute if data storage gm4_combat_expanded:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:36} run scoreboard players add $burn_pieces gm4_ce_data 1

scoreboard players operation @s gm4_ce_burning.level += $burn_pieces gm4_ce_data
scoreboard players set @s[scores={gm4_ce_burning.level=9..}] gm4_ce_burning.level 8
scoreboard players set @s gm4_ce_burning.duration 20

execute unless score $keep_tick.burn gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/burn 1t
