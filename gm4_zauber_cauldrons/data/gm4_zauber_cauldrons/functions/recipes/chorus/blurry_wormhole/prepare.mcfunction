# @s=boiling zauber cauldron with recipe inside
# at @s align xyz
# run from count_chorus

# generate random coordinate offset from UUID of items in cauldron
execute store result score dx gm4_zc_data run data get entity @e[type=item,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] UUID[3] 0.000000005
execute store result score dy gm4_zc_data run data get entity @e[type=item,nbt={Item:{id:"minecraft:chorus_fruit"}},limit=1] UUID[3] 0.000000005
execute store result score dz gm4_zc_data run data get entity @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}},limit=1] UUID[3] 0.000000005

# get bottled_vex cauldron pos
execute as @e[type=item,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] run function gm4_zauber_cauldrons:recipes/chorus/blurry_wormhole/pull_coordinates

# add random offset (target coordinates)
scoreboard players operation x gm4_zc_data += dx gm4_zc_data
scoreboard players operation y gm4_zc_data += dy gm4_zc_data
scoreboard players operation z gm4_zc_data += dz gm4_zc_data

# copy target coordinates to storage
execute store result storage gm4_zauber_cauldrons:temp/item/wormhole/common Item.tag.gm4_zauber_cauldrons.cauldron_pos.x int 1 run scoreboard players get x gm4_zc_data
execute store result storage gm4_zauber_cauldrons:temp/item/wormhole/common Item.tag.gm4_zauber_cauldrons.cauldron_pos.y int 1 run scoreboard players get y gm4_zc_data
execute store result storage gm4_zauber_cauldrons:temp/item/wormhole/common Item.tag.gm4_zauber_cauldrons.cauldron_pos.z int 1 run scoreboard players get z gm4_zc_data

# kill remaining items
kill @e[type=item,dx=0,dy=0,dz=0]

# summon wormhole
execute at @s run summon item ~ ~.2 ~ {Item:{id:"minecraft:potion",Count:1b},Tags:["gm4_zc_new_wormhole_bottle"]}
execute as @e[type=item,dx=0,dy=0,dz=0,tag=gm4_zc_new_wormhole_bottle,limit=1] run function gm4_zauber_cauldrons:recipes/chorus/precise_wormhole/spawn

# if one, popped or raw chorus, was more than required, turn those into vexes
execute if score raw_chorus_fullness gm4_zc_chorus matches 1.. run scoreboard players operation @s gm4_zc_fullness += raw_chorus_fullness gm4_zc_chorus
execute if score popped_chorus_fullness gm4_zc_chorus matches 1.. run scoreboard players operation @s gm4_zc_fullness += popped_chorus_fullness gm4_zc_chorus

# cosmetics
execute at @s run particle minecraft:witch ~ ~.3 ~ .1 .1 .1 1 7
execute at @s run playsound minecraft:entity.ender_eye.death master @a[distance=..8] ~ ~ ~ 1 .6

scoreboard players set $recipe_success gm4_zc_data 1

# reset fake players
scoreboard players reset dx gm4_zc_data
scoreboard players reset dy gm4_zc_data
scoreboard players reset dz gm4_zc_data
scoreboard players reset x gm4_zc_data
scoreboard players reset y gm4_zc_data
scoreboard players reset z gm4_zc_data
