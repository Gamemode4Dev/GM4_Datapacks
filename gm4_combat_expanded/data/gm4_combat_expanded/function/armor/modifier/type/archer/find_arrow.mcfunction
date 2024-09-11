# check the amount of arrows to spawn
# @s = player wearing archer armor shooting a (cross)bow
# at unspecified
# run from clocks/temp/archer

# store armor for checking
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_combat_expanded:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# check amount of archer pieces
# each level of archer armor means 2 arrows (so archery 1 will shoot 2 arrows, archery 12 will shoot 24)
# note that the level taken from nbt is read with a scale of 2 to double it
# original target is set to -1 as the first arrow does not need to be counted
scoreboard players set $storm_arrow_target gm4_ce_data -1

scoreboard players set $add_storm_arrows gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:archer} store result score $add_storm_arrows gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_combat_expanded.level 2
scoreboard players operation $storm_arrow_target gm4_ce_data += $add_storm_arrows gm4_ce_data

scoreboard players set $add_storm_arrows gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:archer} store result score $add_storm_arrows gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_combat_expanded.level 2
scoreboard players operation $storm_arrow_target gm4_ce_data += $add_storm_arrows gm4_ce_data

scoreboard players set $add_storm_arrows gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:archer} store result score $add_storm_arrows gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_combat_expanded.level 2
scoreboard players operation $storm_arrow_target gm4_ce_data += $add_storm_arrows gm4_ce_data

scoreboard players set $add_storm_arrows gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:archer} store result score $add_storm_arrows gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_combat_expanded.level 2
scoreboard players operation $storm_arrow_target gm4_ce_data += $add_storm_arrows gm4_ce_data

# spawn arrows
tag @s add gm4_ce_target
scoreboard players set $storm_arrow_fired gm4_ce_data 0
execute anchored eyes positioned ^ ^ ^2 as @e[type=#gm4_combat_expanded:arrow,tag=!gm4_ce_archer_arrow,distance=..2.5,sort=nearest] at @s run function gm4_combat_expanded:armor/modifier/type/archer/apply
tag @s remove gm4_ce_target
