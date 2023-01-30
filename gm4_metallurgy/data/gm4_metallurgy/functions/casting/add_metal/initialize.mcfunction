# @s = armor_stand mould entity
# runs from sustain_mould

# determine ore type and primary metal amount
data modify storage gm4_metallurgy:temp/item/ore gm4_metallurgy set from entity @e[type=item,tag=gm4_ml_in_animation,dx=0,dz=0,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{metal:{castable:1b}}}},OnGround:1b},limit=1] Item.tag.gm4_metallurgy
execute store result score $metal_amount gm4_ml_data run data get storage gm4_metallurgy:temp/item/ore gm4_metallurgy.metal.amount[0]
execute if data storage gm4_metallurgy:temp/item/ore gm4_metallurgy{item:"obsidian_cast"} run scoreboard players set $is_obsidian_cast gm4_ml_data 1

# store recasted shamir id
execute if score $is_obsidian_cast gm4_ml_data matches 1 run data modify entity @s ArmorItems[0].tag.gm4_metallurgy set from storage gm4_metallurgy:temp/item/ore gm4_metallurgy

# absorb ore item
execute if data storage gm4_metallurgy:temp/item/ore gm4_metallurgy.metal{type:"aluminium"} run function gm4_metallurgy:casting/add_metal/add_aluminium
execute if data storage gm4_metallurgy:temp/item/ore gm4_metallurgy.metal{type:"barimium"} run function gm4_metallurgy:casting/add_metal/add_barimium
execute if data storage gm4_metallurgy:temp/item/ore gm4_metallurgy.metal{type:"barium"} run function gm4_metallurgy:casting/add_metal/add_barium
execute if data storage gm4_metallurgy:temp/item/ore gm4_metallurgy.metal{type:"bismuth"} run function gm4_metallurgy:casting/add_metal/add_bismuth
execute if data storage gm4_metallurgy:temp/item/ore gm4_metallurgy.metal{type:"copper"} run function gm4_metallurgy:casting/add_metal/add_copper
execute if data storage gm4_metallurgy:temp/item/ore gm4_metallurgy.metal{type:"thorium"} run function gm4_metallurgy:casting/add_metal/add_thorium
execute if data storage gm4_metallurgy:temp/item/ore gm4_metallurgy.metal{type:"curies_bismium"} run function gm4_metallurgy:casting/add_metal/add_curies_bismium
execute if data storage gm4_metallurgy:temp/item/ore gm4_metallurgy.metal{type:"thorium_brass"} run function gm4_metallurgy:casting/add_metal/add_thorium_brass

# reset storage and scoreboard values
scoreboard players reset $metal_amount gm4_ml_data
scoreboard players reset $is_obsidian_cast gm4_ml_data
data remove storage gm4_metallurgy:temp/item/ore gm4_metallurgy

# make all ores on top jump
execute as @e[type=item,tag=!gm4_ml_in_animation,dx=0,dz=0,limit=1,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{metal:{castable:1b}}}},OnGround:1b}] run data merge entity @s {Motion:[0.0,0.35,0.0],PickupDelay:30,Tags:["gm4_ml_in_animation"],Item:{tag:{gm4_metallurgy:{ore_in_animation:1b}}}}
