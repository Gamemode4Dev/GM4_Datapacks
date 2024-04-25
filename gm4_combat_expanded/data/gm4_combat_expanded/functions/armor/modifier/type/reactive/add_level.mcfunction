# add absorption to player that got hit (red health hits only)
# @s = player wearing armor
# at @s
advancement revoke @s only gm4_combat_expanded:damaged/armor/reactive

# store armor for checking
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_combat_expanded:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# add level of absorption to player total for each armor piece
scoreboard players set $level gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:reactive} store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_combat_expanded.level
scoreboard players operation @s gm4_ce_absorp += $level gm4_ce_data

scoreboard players set $level gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:reactive} store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_combat_expanded.level
scoreboard players operation @s gm4_ce_absorp += $level gm4_ce_data

scoreboard players set $level gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:reactive} store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_combat_expanded.level
scoreboard players operation @s gm4_ce_absorp += $level gm4_ce_data

scoreboard players set $level gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:reactive} store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_combat_expanded.level
scoreboard players operation @s gm4_ce_absorp += $level gm4_ce_data

# cooldown
scoreboard players set @s gm4_ce_t_reactive 37

# grant effect
function gm4_combat_expanded:player/shield/prep
