# @s=zauber cauldron with overflow items and bottle(s) inside
# run from prepare_bottle
# at allign xyz

# summon bottle and remove one from fullness (bottle is used to be bottled into)
execute at @s run summon item ~ ~.2 ~ {Item:{id:"minecraft:glass_bottle",Count:1b,tag:{CustomModelData:3,gm4_zauber_cauldrons:{item:"bottled_vex"},Enchantments:[{id:"minecraft:protection",lvl:0s}],display:{Name:'{"translate":"%1$s%3427655$s","with":["Magic in a Bottle",{"translate":"item.gm4.magic_in_a_bottle"}],"italic":false}'},HideFlags:1}}}

# read amount of excess items
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex Item.tag.gm4_zauber_cauldrons.vex_count int 1 run scoreboard players get @s gm4_zc_fullness

# read coordinates
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex Item.tag.gm4_zauber_cauldrons.cauldron_pos.x int 1 run data get entity @s Pos.[0]
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex Item.tag.gm4_zauber_cauldrons.cauldron_pos.y int 1 run data get entity @s Pos.[1]
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex Item.tag.gm4_zauber_cauldrons.cauldron_pos.z int 1 run data get entity @s Pos.[2]

# read dimension
# WARNING: THE DIMENSION TAG IS NOT PRESENT ON ALL ENTITIES ANYMORE AS OF 1.16. THE STORED DIMENSION IS WRONG / DEFAULTS TO 0. THIS MUST BE REPLACED WITH A NEW CHECK.
execute store result storage gm4_zauber_cauldrons:temp/item/bottled_vex Item.tag.gm4_zauber_cauldrons.cauldron_pos.dimension int 1 run data get entity @s Dimension

# store nbt onto item
data modify entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] {} merge from storage gm4_zauber_cauldrons:temp/item/bottled_vex {}

scoreboard players set bottled_possessed_items gm4_zc_data 1
