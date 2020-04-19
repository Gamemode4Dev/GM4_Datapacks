# @s=zauber cauldron with overflow items and bottle(s) inside
# run from prepare_bottle
# at allign xyz

# summon bottle and remove one from fullness (bottle is used to be bottled into)
summon item ~ ~.2 ~ {Item:{id:"minecraft:glass_bottle",Count:1b,tag:{CustomModelData:3,gm4_zauber_cauldrons:{item:"bottled_vex"},Enchantments:[{id:"minecraft:protection",lvl:0s}],display:{Name:'{"translate":"%1$s%3427655$s","with":["Magic in a Bottle",{"translate":"item.gm4.magic_in_a_bottle"}],"italic":false}'},HideFlags:1}}}

# store amount of excess items in item nbt
execute store result entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.vex_count int 1 run scoreboard players get @s gm4_zc_fullness

# store coordinates in nbt
execute store result entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.x int 1 run data get entity @s Pos.[0]
execute store result entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.y int 1 run data get entity @s Pos.[1]
execute store result entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.z int 1 run data get entity @s Pos.[2]
# store dimension in nbt
execute store result entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos.dimension int 1 run data get entity @s Dimension

scoreboard players set bottled_possessed_items gm4_zc_data 1
