#@s=boiling zauber cauldron with recipe inside
#at @s align xyz
#run from count_chorus

#summon resulting item marked with no kill tag
execute at @s run summon item ~ ~.2 ~ {Tags:["gm4_zc_new_wormhole_bottle"],Item:{id:potion,Count:1b,tag:{gm4_zauber_cauldrons:{item:"wormhole_bottle"},Potion:"minecraft:thick",CustomPotionColor:8587123,Enchantments:[{id:"minecraft:protection",lvl:0s}],HideFlags:33,display:{Name:"{\"text\":\"Wormhole in a Bottle\",\"italic\":False,\"color:\":\"aqua\"}"}}}}

#copy target coordinates to new item
execute store result entity @e[type=item,dx=0,dy=0,dz=0,tag=gm4_zc_new_wormhole_bottle,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"wormhole_bottle"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.x int 1 run data get entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.x
execute store result entity @e[type=item,dx=0,dy=0,dz=0,tag=gm4_zc_new_wormhole_bottle,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"wormhole_bottle"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.y int 1 run data get entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.y
execute store result entity @e[type=item,dx=0,dy=0,dz=0,tag=gm4_zc_new_wormhole_bottle,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"wormhole_bottle"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.z int 1 run data get entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.z
#copy taget dimension to new item
execute store result entity @e[type=item,dx=0,dy=0,dz=0,tag=gm4_zc_new_wormhole_bottle,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"wormhole_bottle"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.dimension int 1 run data get entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.dimension

#kill remaining items
kill @e[type=item,tag=!gm4_zc_new_wormhole_bottle,dx=0,dy=0,dz=0]
tag @e[type=item,dx=0,dy=0,dz=0,tag=gm4_zc_new_wormhole_bottle,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"wormhole_bottle"}}}},limit=1] remove gm4_zc_new_wormhole_bottle

#cosmetics
execute at @s run particle minecraft:witch ~ ~.3 ~ .1 .1 .1 1 17
execute at @s run playsound minecraft:entity.ender_eye.death master @a[distance=..8] ~ ~ ~ 1 .2

#add oversized stacks to cauldron fullness to summon vexes
scoreboard players operation @s gm4_zc_fullness += raw_chorus_fullness gm4_zc_chorus
scoreboard players operation @s gm4_zc_fullness += popped_chorus_fullness gm4_zc_chorus

scoreboard players set recipe_success gm4_zc_data 1
