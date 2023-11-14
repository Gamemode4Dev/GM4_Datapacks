# @s = zauber cauldron with overflow items and bottle(s) inside
# run from prepare_bottle
# at @s

# read amount of excess items
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons.vex_count int 1 run scoreboard players get @s gm4_zc_fullness

# read coordinates
execute store result score $cauldron_x gm4_zc_data run data get entity @s Pos[0]
execute store result score $cauldron_y gm4_zc_data run data get entity @s Pos[1]
execute store result score $cauldron_z gm4_zc_data run data get entity @s Pos[2]
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons.cauldron_pos.x int 1 run scoreboard players get $cauldron_x gm4_zc_data
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons.cauldron_pos.y int 1 run scoreboard players get $cauldron_y gm4_zc_data
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons.cauldron_pos.z int 1 run scoreboard players get $cauldron_z gm4_zc_data

# read dimension
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons.cauldron_pos.dimension int 1 run scoreboard players get @e[type=marker,tag=gm4_dimension,distance=0..,limit=1] gm4_dimension

# calculate and store preferred moon phase
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
