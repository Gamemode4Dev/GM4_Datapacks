# @s=boiling zauber cauldron with recipe inside
# at @s align xyz
# run from count_chorus

# generate random coordinate offset from UUID of items in cauldron
execute store result score dx gm4_zc_data run data get entity @e[type=item,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] UUIDMost -.000000000000000001
execute store result score dy gm4_zc_data run data get entity @e[type=item,nbt={Item:{id:"minecraft:chorus_fruit"}},limit=1] UUIDMost -.000000000000000001
execute store result score dz gm4_zc_data run data get entity @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}},limit=1] UUIDMost -.000000000000000001

# get bottled_vex cauldron pos
execute store result score x gm4_zc_data run data get entity @e[type=item,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.x
execute store result score y gm4_zc_data run data get entity @e[type=item,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.y
execute store result score z gm4_zc_data run data get entity @e[type=item,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.z

# add random offset (target coordinates)
scoreboard players operation x gm4_zc_data += dx gm4_zc_data
scoreboard players operation y gm4_zc_data += dy gm4_zc_data
scoreboard players operation z gm4_zc_data += dz gm4_zc_data

# summon resulting item marked with no kill tag
execute at @s run summon item ~ ~.2 ~ {Tags:["gm4_zc_new_wormhole_bottle"],Item:{id:potion,Count:1b,tag:{CustomModelData:1,gm4_zauber_cauldrons:{item:"wormhole_bottle"},Potion:"minecraft:thick",CustomPotionColor:6358357,Enchantments:[{id:"minecraft:protection",lvl:0s}],HideFlags:33,display:{Name:'{"translate":"%1$s%3427655$s","with":["Wormhole in a Bottle",{"translate":"item.gm4.wormhole_in_a_bottle"}],"italic":"false"}'}}}}

# copy target coordinates to new item
execute store result entity @e[type=item,dx=0,dy=0,dz=0,tag=gm4_zc_new_wormhole_bottle,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"wormhole_bottle"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.x int 1 run scoreboard players get x gm4_zc_data
execute store result entity @e[type=item,dx=0,dy=0,dz=0,tag=gm4_zc_new_wormhole_bottle,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"wormhole_bottle"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.y int 1 run scoreboard players get y gm4_zc_data
execute store result entity @e[type=item,dx=0,dy=0,dz=0,tag=gm4_zc_new_wormhole_bottle,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"wormhole_bottle"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.z int 1 run scoreboard players get z gm4_zc_data
# copy target dimension to new item
execute store result entity @e[type=item,dx=0,dy=0,dz=0,tag=gm4_zc_new_wormhole_bottle,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"wormhole_bottle"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.dimension int 1 run data get entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.dimension

# kill remaining items
kill @e[type=item,tag=!gm4_zc_new_wormhole_bottle,dx=0,dy=0,dz=0]
tag @e[type=item,dx=0,dy=0,dz=0,tag=gm4_zc_new_wormhole_bottle,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"wormhole_bottle"}}}},limit=1] remove gm4_zc_new_wormhole_bottle

# if one, popped or raw chorus, was more than required, turn those into vexes
execute if score raw_chorus_fullness gm4_zc_chorus matches 1.. run scoreboard players operation @s gm4_zc_fullness += raw_chorus_fullness gm4_zc_chorus
execute if score popped_chorus_fullness gm4_zc_chorus matches 1.. run scoreboard players operation @s gm4_zc_fullness += popped_chorus_fullness gm4_zc_chorus

# cosmetics
execute at @s run particle minecraft:witch ~ ~.3 ~ .1 .1 .1 1 7
execute at @s run playsound minecraft:entity.ender_eye.death master @a[distance=..8] ~ ~ ~ 1 .6

scoreboard players set recipe_success gm4_zc_data 1

# reset fake players
scoreboard players reset dx gm4_zc_data
scoreboard players reset dy gm4_zc_data
scoreboard players reset dz gm4_zc_data
scoreboard players reset x gm4_zc_data
scoreboard players reset y gm4_zc_data
scoreboard players reset z gm4_zc_data
