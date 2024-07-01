# stores random values in scoreboards and storage which can be used for identification
# @s = unidentified item
# at @s
# run from identification/armor/pick_mod

# store results in scoreboards for permanent attributes
# armor 1 - 3
execute store result score $armor gm4_ce_data run loot spawn 29999998 1 7133 loot gm4_combat_expanded:randomizer/armor
scoreboard players operation $armor- gm4_ce_data = $armor gm4_ce_data
scoreboard players operation $armor- gm4_ce_data -= #4 gm4_ce_data
# clamp $armor- to armor of piece
execute store result score $armor_clamp gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.armor_clamp
scoreboard players operation $armor- gm4_ce_data > $armor_clamp gm4_ce_data
# attack damage 0.5 - 2
execute store result score $damage gm4_ce_data run loot spawn 29999998 1 7133 loot gm4_combat_expanded:randomizer/damage
scoreboard players operation $damage gm4_ce_data *= #5 gm4_ce_data
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
execute store result score $speed gm4_ce_data run loot spawn 29999998 1 7133 loot gm4_combat_expanded:randomizer/speed
scoreboard players operation $speed- gm4_ce_data = $speed gm4_ce_data
scoreboard players operation $speed- gm4_ce_data -= #21 gm4_ce_data
# attack speed 10 - 25
execute store result score $atkspeed gm4_ce_data run loot spawn 29999998 1 7133 loot gm4_combat_expanded:randomizer/atkspeed
scoreboard players operation $atkspeed- gm4_ce_data = $atkspeed gm4_ce_data
scoreboard players operation $atkspeed- gm4_ce_data -= #35 gm4_ce_data
# special stats for focus armor
scoreboard players operation $focus_damage_10 gm4_ce_data = $damage_10 gm4_ce_data
scoreboard players operation $focus_damage_10 gm4_ce_data += $armor gm4_ce_data

# store results in storage for changing attributes
execute store result storage gm4_combat_expanded:temp armor int 1 run scoreboard players get $armor gm4_ce_data
execute store result storage gm4_combat_expanded:temp damage float 0.1 run scoreboard players get $damage gm4_ce_data
execute store result storage gm4_combat_expanded:temp level float 0.2 run scoreboard players get $damage gm4_ce_data
execute store result storage gm4_combat_expanded:temp speed int 1 run scoreboard players get $speed gm4_ce_data
execute store result storage gm4_combat_expanded:temp atkspeed int 1 run scoreboard players get $atkspeed gm4_ce_data

# TODO: remove (spigot bug)
execute positioned 29999998 1 7133 run kill @e[type=item,distance=..2]
