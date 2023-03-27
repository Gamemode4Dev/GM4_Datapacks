# randomise stats for identification
# @s = player wielding the weapon
# at world spawn
# run from weapon/identify/pick_mod

# use loot tables to fill shulker box with items
# slots 0 is reserved for the weapon, slot 1 is reserved for the modifier
loot replace block 29999998 1 7134 container.2 loot gm4_combat_expanded:randomizer/damage
loot replace block 29999998 1 7134 container.3 loot gm4_combat_expanded:randomizer/speed
loot replace block 29999998 1 7134 container.4 loot gm4_combat_expanded:randomizer/atkspeed
loot replace block 29999998 1 7134 container.5 loot gm4_combat_expanded:randomizer/armor

# store in storage
data modify storage gm4_combat_expanded:temp Items set from block 29999998 1 7134 Items

# store results in scoreboards for permanent attributes
# attack damage 0.5 - 2
execute store result score $damage gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:2b}].Count 5
scoreboard players operation $damage- gm4_ce_data = $damage gm4_ce_data
scoreboard players operation $damage- gm4_ce_data -= #25 gm4_ce_data
# movement speed 5 - 20
execute store result score $speed gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:3b}].Count
scoreboard players operation $speed- gm4_ce_data = $speed gm4_ce_data
scoreboard players operation $speed- gm4_ce_data -= #21 gm4_ce_data
# attack speed 2 - 5
execute store result score $atkspeed gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:4b}].Count
scoreboard players operation $atkspeed gm4_ce_data /= #5 gm4_ce_data
scoreboard players operation $atkspeed- gm4_ce_data = $atkspeed gm4_ce_data
scoreboard players operation $atkspeed- gm4_ce_data -= #7 gm4_ce_data
# random value 1 - 3
execute store result score $random_value gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:5b}].Count

# calculate new damage in order to replace the attribute
execute store result score $damage_stored gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.damage
# base damage up
scoreboard players operation $damage_up gm4_ce_data = $damage_stored gm4_ce_data
scoreboard players operation $damage_up gm4_ce_data += $damage gm4_ce_data
# base damage down, never lower than 0.5
scoreboard players operation $damage_down gm4_ce_data = $damage_stored gm4_ce_data
scoreboard players operation $damage_down gm4_ce_data += $damage- gm4_ce_data
scoreboard players operation $damage_down gm4_ce_data > #5 gm4_ce_data
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
scoreboard players operation $damage_demonic gm4_ce_data = $damage_stored_10 gm4_ce_data
scoreboard players operation $damage_demonic gm4_ce_data *= #3 gm4_ce_data
scoreboard players operation $damage_demonic gm4_ce_data /= #2 gm4_ce_data

# calculate new attack speed in order to replace the attribute
execute store result score $atkspeed_stored gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.atkspeed
# base atack speed up, never higher than 4.0
scoreboard players operation $atkspeed_up gm4_ce_data = $atkspeed_stored gm4_ce_data
scoreboard players operation $atkspeed_up gm4_ce_data += $atkspeed gm4_ce_data
# base atack speed down, never lower than 0.5
scoreboard players operation $atkspeed_down gm4_ce_data = $atkspeed_stored gm4_ce_data
scoreboard players operation $atkspeed_down gm4_ce_data += $atkspeed- gm4_ce_data
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

# store results in storage for changing attributes
execute store result storage gm4_combat_expanded:temp random_value int 1 run scoreboard players get $random_value gm4_ce_data
