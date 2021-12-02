# @s = zauber cauldron with overflow items and bottle(s) inside
# run from prepare_bottle
# at @s

# read amount of excess items
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons.vex_count int 1 run scoreboard players get @s gm4_zc_fullness

# read coordinates
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons.cauldron_pos.x int 1 run data get entity @s Pos[0]
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons.cauldron_pos.y int 1 run data get entity @s Pos[1]
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons.cauldron_pos.z int 1 run data get entity @s Pos[2]

# read dimension
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons.cauldron_pos.dimension int 1 run scoreboard players get @e[type=marker,tag=gm4_dimension,distance=0..,limit=1] gm4_dimension

# spawn item
loot spawn ~ ~.2 ~ loot gm4_zauber_cauldrons:extra_items/bottled_vex

# make items in cauldron pickup-able instantly
execute align xyz as @e[type=item,dx=0,dy=0,dz=0] run data modify entity @s PickupDelay set value 0s

# reset storage
data remove storage gm4_zauber_cauldrons:temp/item/bottled_vex gm4_zauber_cauldrons

# store success
scoreboard players set $bottled_possessed_items gm4_zc_data 1
