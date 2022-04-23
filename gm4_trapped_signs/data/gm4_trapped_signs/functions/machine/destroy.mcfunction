# destroys the trapped_sign
# @s = trapped_sign marker
# located at @s
# run from gm4_smelteries:machine/verify_destroy

# kill entities related to machine block
scoreboard players set $dropped_item gm4_machine_data 0
execute if entity @s[tag=gm4_acacia_trapped_sign] store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:acacia_sign",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,sort=nearest]
execute if score $dropped_item gm4_machine_data matches 0 if entity @s[tag=gm4_birch_trapped_sign] store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:birch_sign",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,sort=nearest]
execute if score $dropped_item gm4_machine_data matches 0 if entity @s[tag=gm4_crimson_trapped_sign] store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:crimson_sign",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,sort=nearest]
execute if score $dropped_item gm4_machine_data matches 0 if entity @s[tag=gm4_dark_oak_trapped_sign] store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:dark_oak_sign",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,sort=nearest]
execute if score $dropped_item gm4_machine_data matches 0 if entity @s[tag=gm4_jungle_trapped_sign] store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:jungle_sign",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,sort=nearest]
execute if score $dropped_item gm4_machine_data matches 0 if entity @s[tag=gm4_oak_trapped_sign] store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:oak_sign",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,sort=nearest]
execute if score $dropped_item gm4_machine_data matches 0 if entity @s[tag=gm4_spruce_trapped_sign] store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:spruce_sign",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,sort=nearest]
execute if score $dropped_item gm4_machine_data matches 0 if entity @s[tag=gm4_warped_trapped_sign] store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:warped_sign",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
execute if score $dropped_item gm4_machine_data matches 1 run function gm4_trapped_signs:machine/drop_item
