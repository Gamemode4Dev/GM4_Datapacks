# run from armor/identify/check_mod/TYPE

# use loot tables to fill shulker box with items
# slots 0-3 are reserved for armor pieces, slot 4 is reserved for the modifier
loot replace block 29999998 1 7134 container.5 loot gm4_combat_evolved:randomizer/armor
loot replace block 29999998 1 7134 container.6 loot gm4_combat_evolved:randomizer/damage
loot replace block 29999998 1 7134 container.7 loot gm4_combat_evolved:randomizer/speed
loot replace block 29999998 1 7134 container.8 loot gm4_combat_evolved:randomizer/atkspeed
loot replace block 29999998 1 7134 container.9 loot gm4_combat_evolved:randomizer/constep
loot replace block 29999998 1 7134 container.10 loot gm4_combat_evolved:randomizer/consume

# store in storage
data modify storage gm4_combat_evolved:temp Items set from block 29999998 1 7134 Items

# store results in scoreboards for permanent attributes
# armor 1 - 4
execute store result score $armor gm4_ce_data run data get storage gm4_combat_evolved:temp Items[{Slot:5b}].Count
scoreboard players operation $armor- gm4_ce_data = $armor gm4_ce_data
scoreboard players operation $armor- gm4_ce_data -= #4 gm4_ce_data
# attack damage 1 - 5
execute store result score $damage gm4_ce_data run data get storage gm4_combat_evolved:temp Items[{Slot:6b}].Count
scoreboard players operation $damage- gm4_ce_data = $damage gm4_ce_data
scoreboard players operation $damage- gm4_ce_data -= #5 gm4_ce_data
# movement speed 5 - 20
execute store result score $speed gm4_ce_data run data get storage gm4_combat_evolved:temp Items[{Slot:7b}].Count
scoreboard players operation $speed- gm4_ce_data = $speed gm4_ce_data
scoreboard players operation $speed- gm4_ce_data -= #21 gm4_ce_data
# attack speed 10 - 25
execute store result score $atkspeed gm4_ce_data run data get storage gm4_combat_evolved:temp Items[{Slot:8b}].Count
scoreboard players operation $atkspeed- gm4_ce_data = $atkspeed gm4_ce_data
scoreboard players operation $atkspeed- gm4_ce_data -= #35 gm4_ce_data
# special stats for consuming armor (stepsize and cap)
execute store result score $constep gm4_ce_data run data get storage gm4_combat_evolved:temp Items[{Slot:9b}].Count
execute store result score $consume gm4_ce_data run data get storage gm4_combat_evolved:temp Items[{Slot:10b}].Count 100

# reduce armor- from armor in order to replace the attribute
# base armor is never lower than 1
execute store result score $newarmor gm4_ce_data run data get storage gm4_combat_evolved:temp tag.AttributeModifiers[{Name:"generic.armor"}].Amount
scoreboard players operation $newarmor gm4_ce_data += $armor- gm4_ce_data
execute store result storage gm4_combat_evolved:temp newarmor int 1 run scoreboard players operation $newarmor gm4_ce_data > #1 gm4_ce_data

# store results in storage for changing attributes
execute store result storage gm4_combat_evolved:temp armor int 1 run scoreboard players get $armor gm4_ce_data
execute store result storage gm4_combat_evolved:temp damage int 1 run scoreboard players get $damage gm4_ce_data
execute store result storage gm4_combat_evolved:temp speed int 1 run scoreboard players get $speed gm4_ce_data
execute store result storage gm4_combat_evolved:temp atkspeed int 1 run scoreboard players get $atkspeed gm4_ce_data
execute store result storage gm4_combat_evolved:temp consume int 1 run scoreboard players get $consume gm4_ce_data
execute store result storage gm4_combat_evolved:temp constep int 1 run scoreboard players get $constep gm4_ce_data
