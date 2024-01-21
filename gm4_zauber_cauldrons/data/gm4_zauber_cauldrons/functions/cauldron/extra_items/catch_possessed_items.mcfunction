# @s = zauber cauldron with overflow items and bottle(s) inside
# run from prepare_bottle
# at @s

# read amount of excess items
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons.vex_count int 1 run scoreboard players get @s gm4_zc_fullness

# copy coordinates and dimension of cauldron to bottled vex item
data modify storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons.cauldron_pos set from storage gm4_zauber_cauldrons:temp/cauldron/ingredients location

# calculate and store preferred moon phase
execute store result score $cauldron_x gm4_zc_data run data get storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons.cauldron_pos.x
execute store result score $cauldron_y gm4_zc_data run data get storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons.cauldron_pos.y
execute store result score $cauldron_z gm4_zc_data run data get storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons.cauldron_pos.z
scoreboard players operation $cauldron_x gm4_zc_data /= #256 gm4_zc_moon_phase
scoreboard players operation $cauldron_y gm4_zc_data /= #256 gm4_zc_moon_phase
scoreboard players operation $cauldron_z gm4_zc_data /= #256 gm4_zc_moon_phase
scoreboard players operation $cauldron_x gm4_zc_data += $cauldron_y gm4_zc_data
scoreboard players operation $cauldron_x gm4_zc_data += $cauldron_z gm4_zc_data
scoreboard players operation $cauldron_x gm4_zc_data += $magicol_offset gm4_zc_moon_phase
scoreboard players operation $cauldron_x gm4_zc_data %= #8 gm4_zc_moon_phase
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons.preferred_moon_phase int 1 run scoreboard players get $cauldron_x gm4_zc_data

# spawn item
loot spawn ~ ~.2 ~ loot gm4_zauber_cauldrons:items/bottled_vex

# make items in cauldron pickup-able instantly
execute align xyz as @e[type=item,dx=0,dy=0,dz=0] run data modify entity @s PickupDelay set value 0s

# reset storage
data remove storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons

# reset fake players
scoreboard players reset $cauldron_x gm4_zc_data
scoreboard players reset $cauldron_y gm4_zc_data
scoreboard players reset $cauldron_z gm4_zc_data

# store success
scoreboard players set $bottled_possessed_items gm4_zc_data 1
