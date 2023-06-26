# stores random values in scoreboards and storage which can be used for identification
# @s = player wearing the armor
# at world spawn
# run from armor/identify/pick_mod

# use loot tables to fill shulker box with items
# slots 0-3 are reserved for armor pieces, slot 4 is reserved for the modifier
loot replace block 29999998 1 7134 container.5 loot gm4_combat_expanded:randomizer/armor
loot replace block 29999998 1 7134 container.6 loot gm4_combat_expanded:randomizer/damage
loot replace block 29999998 1 7134 container.7 loot gm4_combat_expanded:randomizer/speed
loot replace block 29999998 1 7134 container.8 loot gm4_combat_expanded:randomizer/atkspeed
loot replace block 29999998 1 7134 container.9 loot gm4_combat_expanded:randomizer/constep
loot replace block 29999998 1 7134 container.10 loot gm4_combat_expanded:randomizer/consume

# store in storage
data modify storage gm4_combat_expanded:temp Items set from block 29999998 1 7134 Items

# store results in scoreboards for permanent attributes
# armor 1 - 3
execute store result score $armor gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:5b}].Count
scoreboard players operation $armor- gm4_ce_data = $armor gm4_ce_data
scoreboard players operation $armor- gm4_ce_data -= #4 gm4_ce_data
# clamp $armor- to armor of piece
execute store result score $armor_clamp gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.armor_clamp
scoreboard players operation $armor- gm4_ce_data > $armor_clamp gm4_ce_data
# attack damage 0.5 - 2
execute store result score $damage gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:6b}].Count 5
scoreboard players operation $damage- gm4_ce_data = $damage gm4_ce_data
scoreboard players operation $damage- gm4_ce_data -= #25 gm4_ce_data
# get digits seperate
scoreboard players operation $damage_10 gm4_ce_data = $damage gm4_ce_data
scoreboard players operation $damage_10 gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $damage_01 gm4_ce_data = $damage gm4_ce_data
scoreboard players operation $damage_01 gm4_ce_data %= #10 gm4_ce_data
scoreboard players operation $damage-_10 gm4_ce_data = $damage- gm4_ce_data
scoreboard players operation $damage-_10 gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $damage-_01 gm4_ce_data = $damage- gm4_ce_data
scoreboard players operation $damage-_01 gm4_ce_data %= #10 gm4_ce_data
# movement speed 5 - 20
execute store result score $speed gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:7b}].Count
scoreboard players operation $speed- gm4_ce_data = $speed gm4_ce_data
scoreboard players operation $speed- gm4_ce_data -= #21 gm4_ce_data
# attack speed 10 - 25
execute store result score $atkspeed gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:8b}].Count
scoreboard players operation $atkspeed- gm4_ce_data = $atkspeed gm4_ce_data
scoreboard players operation $atkspeed- gm4_ce_data -= #35 gm4_ce_data
# special stats for consuming armor (stepsize and cap)
execute store result score $constep gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:9b}].Count
execute store result score $consume gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:10b}].Count 50

# store results in storage for changing attributes
execute store result storage gm4_combat_expanded:temp armor int 1 run scoreboard players get $armor gm4_ce_data
execute store result storage gm4_combat_expanded:temp damage float 0.1 run scoreboard players get $damage gm4_ce_data
execute store result storage gm4_combat_expanded:temp level float 0.2 run scoreboard players get $damage gm4_ce_data
execute store result storage gm4_combat_expanded:temp speed int 1 run scoreboard players get $speed gm4_ce_data
execute store result storage gm4_combat_expanded:temp atkspeed int 1 run scoreboard players get $atkspeed gm4_ce_data
execute store result storage gm4_combat_expanded:temp consume int 1 run scoreboard players get $consume gm4_ce_data
execute store result storage gm4_combat_expanded:temp constep int 1 run scoreboard players get $constep gm4_ce_data
