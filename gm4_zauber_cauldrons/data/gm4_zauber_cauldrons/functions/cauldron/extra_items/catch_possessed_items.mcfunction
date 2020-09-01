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
# due to a bug (MC-133579), "execute in minecraft:the_end if entity @s[distance=0..]" always returns true when @s is used :/.
tag @s add gm4_zc_current_cauldron
execute in minecraft:the_end if entity @e[type=area_effect_cloud,tag=gm4_zc_current_cauldron,distance=0..] run data modify storage gm4_zauber_cauldrons:temp/item/bottled_vex Item.tag.gm4_zauber_cauldrons.cauldron_pos.dimension set value 1
execute in minecraft:overworld if entity @e[type=area_effect_cloud,tag=gm4_zc_current_cauldron,distance=0..] run data modify storage gm4_zauber_cauldrons:temp/item/bottled_vex Item.tag.gm4_zauber_cauldrons.cauldron_pos.dimension set value 0
execute in minecraft:the_nether if entity @e[type=area_effect_cloud,tag=gm4_zc_current_cauldron,distance=0..] run data modify storage gm4_zauber_cauldrons:temp/item/bottled_vex Item.tag.gm4_zauber_cauldrons.cauldron_pos.dimension set value -1
tag @s remove gm4_zc_current_cauldron

# store nbt onto item
data modify entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] {} merge from storage gm4_zauber_cauldrons:temp/item/bottled_vex {}

# reset storage
data remove storage gm4_zauber_cauldrons:temp/item/bottled_vex Item

# store success
scoreboard players set bottled_possessed_items gm4_zc_data 1
