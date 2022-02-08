# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from count_chorus

# generate random coordinate offset from UUID of items in cauldron
execute store result score $dx gm4_zc_data run data get entity @e[type=item,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] UUID[3] 0.000000005
execute store result score $dy gm4_zc_data run data get entity @e[type=item,nbt={Item:{id:"minecraft:chorus_fruit"}},limit=1] UUID[3] 0.000000005
execute store result score $dz gm4_zc_data run data get entity @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}},limit=1] UUID[3] 0.000000005

# get bottled_vex cauldron pos
data modify storage gm4_zauber_cauldrons:blueprint/item/wormhole gm4_zauber_cauldrons.cauldron_pos set from storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}].tag.gm4_zauber_cauldrons.cauldron_pos
execute store result score $x gm4_zc_data run data get storage gm4_zauber_cauldrons:blueprint/item/wormhole gm4_zauber_cauldrons.cauldron_pos.x 1
execute store result score $y gm4_zc_data run data get storage gm4_zauber_cauldrons:blueprint/item/wormhole gm4_zauber_cauldrons.cauldron_pos.y 1
execute store result score $z gm4_zc_data run data get storage gm4_zauber_cauldrons:blueprint/item/wormhole gm4_zauber_cauldrons.cauldron_pos.z 1

# add random offset (target coordinates)
scoreboard players operation $x gm4_zc_data += $dx gm4_zc_data
scoreboard players operation $y gm4_zc_data += $dy gm4_zc_data
scoreboard players operation $z gm4_zc_data += $dz gm4_zc_data

# copy target coordinates to storage
execute store result storage gm4_zauber_cauldrons:blueprint/item/wormhole gm4_zauber_cauldrons.cauldron_pos.x int 1 run scoreboard players get $x gm4_zc_data
execute store result storage gm4_zauber_cauldrons:blueprint/item/wormhole gm4_zauber_cauldrons.cauldron_pos.y int 1 run scoreboard players get $y gm4_zc_data
execute store result storage gm4_zauber_cauldrons:blueprint/item/wormhole gm4_zauber_cauldrons.cauldron_pos.z int 1 run scoreboard players get $z gm4_zc_data

# kill remaining items
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon wormhole
loot spawn ~ ~.2 ~ loot gm4_zauber_cauldrons:recipes/chorus/wormhole

# make items in cauldron pickup-able instantly
execute align xyz as @e[type=item,dx=0,dy=0,dz=0] run data modify entity @s PickupDelay set value 0s

# if one, popped or raw chorus, was more than required, turn those into vexes
execute if score $raw_chorus_fullness gm4_zc_chorus matches 1.. run scoreboard players operation @s gm4_zc_fullness += $raw_chorus_fullness gm4_zc_chorus
execute if score $popped_chorus_fullness gm4_zc_chorus matches 1.. run scoreboard players operation @s gm4_zc_fullness += $popped_chorus_fullness gm4_zc_chorus

# cosmetics
execute at @s run particle minecraft:witch ~ ~.3 ~ .1 .1 .1 1 7
execute at @s run playsound minecraft:entity.ender_eye.death master @a[distance=..8] ~ ~ ~ 1 .6

# set flag
scoreboard players set $recipe_success gm4_zc_data 1

# reset fake players
scoreboard players reset $dx gm4_zc_data
scoreboard players reset $dy gm4_zc_data
scoreboard players reset $dz gm4_zc_data
scoreboard players reset $x gm4_zc_data
scoreboard players reset $y gm4_zc_data
scoreboard players reset $z gm4_zc_data
