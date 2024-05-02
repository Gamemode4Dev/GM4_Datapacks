# randomise stats for identification
# @s = unidentified item
# at @s
# run from identification/weapon/pick_mod

# store results in scoreboards for permanent attributes
# attack damage 0.5 - 2
execute store result score $damage gm4_ce_data run loot spawn 29999998 1 7133 loot gm4_combat_expanded:randomizer/damage
scoreboard players operation $damage gm4_ce_data *= #5 gm4_ce_data
scoreboard players operation $damage- gm4_ce_data = $damage gm4_ce_data
scoreboard players operation $damage- gm4_ce_data -= #25 gm4_ce_data
# movement speed 5 - 20
execute store result score $speed gm4_ce_data run loot spawn 29999998 1 7133 loot gm4_combat_expanded:randomizer/speed
scoreboard players operation $speed- gm4_ce_data = $speed gm4_ce_data
scoreboard players operation $speed- gm4_ce_data -= #21 gm4_ce_data
# attack speed 2 - 5
execute store result score $atkspeed gm4_ce_data run loot spawn 29999998 1 7133 loot gm4_combat_expanded:randomizer/atkspeed
scoreboard players operation $atkspeed gm4_ce_data /= #5 gm4_ce_data
scoreboard players operation $atkspeed- gm4_ce_data = $atkspeed gm4_ce_data
scoreboard players operation $atkspeed- gm4_ce_data -= #7 gm4_ce_data
# random value 1 - 3
execute store result score $random_value gm4_ce_data run loot spawn 29999998 1 7133 loot gm4_combat_expanded:randomizer/armor

# calculate new damage in order to replace the attribute
execute store result score $damage_stored gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.damage
# base damage up
scoreboard players operation $damage_up gm4_ce_data = $damage_stored gm4_ce_data
scoreboard players operation $damage_up gm4_ce_data += $damage gm4_ce_data
# base damage down, never lower than 0.5
scoreboard players operation $damage_down gm4_ce_data = $damage_stored gm4_ce_data
scoreboard players operation $damage_down gm4_ce_data += $damage- gm4_ce_data
scoreboard players operation $damage_down gm4_ce_data > #5 gm4_ce_data
# extra damage down, never lower than 0.5
scoreboard players operation $damage_low gm4_ce_data = $damage_down gm4_ce_data
scoreboard players remove $damage_low gm4_ce_data 55
scoreboard players operation $damage_low gm4_ce_data > #5 gm4_ce_data
# get digits seperate
scoreboard players operation $damage_stored_10 gm4_ce_data = $damage_stored gm4_ce_data
scoreboard players operation $damage_stored_10 gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $damage_stored_01 gm4_ce_data = $damage_stored gm4_ce_data
scoreboard players operation $damage_stored_01 gm4_ce_data %= #10 gm4_ce_data
scoreboard players operation $damage_up_10 gm4_ce_data = $damage_up gm4_ce_data
scoreboard players operation $damage_up_10 gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $damage_up_01 gm4_ce_data = $damage_up gm4_ce_data
scoreboard players operation $damage_up_01 gm4_ce_data %= #10 gm4_ce_data
scoreboard players operation $damage_down_10 gm4_ce_data = $damage_down gm4_ce_data
scoreboard players operation $damage_down_10 gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $damage_down_01 gm4_ce_data = $damage_down gm4_ce_data
scoreboard players operation $damage_down_01 gm4_ce_data %= #10 gm4_ce_data
scoreboard players operation $damage_low_10 gm4_ce_data = $damage_low gm4_ce_data
scoreboard players operation $damage_low_10 gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $damage_low_01 gm4_ce_data = $damage_low gm4_ce_data
scoreboard players operation $damage_low_01 gm4_ce_data %= #10 gm4_ce_data

# calculate new attack speed in order to replace the attribute
execute store result score $atkspeed_stored gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.atkspeed
# base atack speed up
scoreboard players operation $atkspeed_up gm4_ce_data = $atkspeed_stored gm4_ce_data
scoreboard players operation $atkspeed_up gm4_ce_data += $atkspeed gm4_ce_data
# quick weapon attack speed up
scoreboard players operation $atkspeed_quick gm4_ce_data = $atkspeed_up gm4_ce_data
scoreboard players add $atkspeed_quick gm4_ce_data 4
# base atack speed down
scoreboard players operation $atkspeed_down gm4_ce_data = $atkspeed_stored gm4_ce_data
scoreboard players operation $atkspeed_down gm4_ce_data += $atkspeed- gm4_ce_data
# extra weapon attack speed down
scoreboard players operation $atkspeed_low gm4_ce_data = $atkspeed_down gm4_ce_data
scoreboard players remove $atkspeed_low gm4_ce_data 4
# get digits seperate
scoreboard players operation $atkspeed_stored_10 gm4_ce_data = $atkspeed_stored gm4_ce_data
scoreboard players operation $atkspeed_stored_10 gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $atkspeed_stored_01 gm4_ce_data = $atkspeed_stored gm4_ce_data
scoreboard players operation $atkspeed_stored_01 gm4_ce_data %= #10 gm4_ce_data
scoreboard players operation $atkspeed_up_10 gm4_ce_data = $atkspeed_up gm4_ce_data
scoreboard players operation $atkspeed_up_10 gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $atkspeed_up_01 gm4_ce_data = $atkspeed_up gm4_ce_data
scoreboard players operation $atkspeed_up_01 gm4_ce_data %= #10 gm4_ce_data
scoreboard players operation $atkspeed_down_10 gm4_ce_data = $atkspeed_down gm4_ce_data
scoreboard players operation $atkspeed_down_10 gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $atkspeed_down_01 gm4_ce_data = $atkspeed_down gm4_ce_data
scoreboard players operation $atkspeed_down_01 gm4_ce_data %= #10 gm4_ce_data
scoreboard players operation $atkspeed_quick_10 gm4_ce_data = $atkspeed_quick gm4_ce_data
scoreboard players operation $atkspeed_quick_10 gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $atkspeed_quick_01 gm4_ce_data = $atkspeed_quick gm4_ce_data
scoreboard players operation $atkspeed_quick_01 gm4_ce_data %= #10 gm4_ce_data
scoreboard players operation $atkspeed_low_10 gm4_ce_data = $atkspeed_low gm4_ce_data
scoreboard players operation $atkspeed_low_10 gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $atkspeed_low_01 gm4_ce_data = $atkspeed_low gm4_ce_data
scoreboard players operation $atkspeed_low_01 gm4_ce_data %= #10 gm4_ce_data

# store results in storage for changing attributes
execute store result storage gm4_combat_expanded:temp random_value int 1 run scoreboard players get $random_value gm4_ce_data
execute store result storage gm4_combat_expanded:temp random_value_2 int 0.2 run scoreboard players get $damage gm4_ce_data

# TODO: remove (spigot bug)
execute positioned 29999998 1 7133 run kill @e[type=item,distance=..2]
