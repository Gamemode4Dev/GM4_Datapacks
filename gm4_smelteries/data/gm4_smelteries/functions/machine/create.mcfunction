# places the smeltery down
# @s = player who placed the smeltery
# located at the center of the placed block
# run from gm4_smelteries:machine/verify_placement

# place furnace
execute if score $single_rotation gm4_machine_data matches 1 run setblock ~ ~ ~ furnace[facing=south]{CustomName:'{"translate":"%1$s%3427655$s","with":["Smeltery",{"translate":"container.gm4.smeltery"}]}'}
execute if score $single_rotation gm4_machine_data matches 2 run setblock ~ ~ ~ furnace[facing=west]{CustomName:'{"translate":"%1$s%3427655$s","with":["Smeltery",{"translate":"container.gm4.smeltery"}]}'}
execute if score $single_rotation gm4_machine_data matches 3 run setblock ~ ~ ~ furnace[facing=north]{CustomName:'{"translate":"%1$s%3427655$s","with":["Smeltery",{"translate":"container.gm4.smeltery"}]}'}
execute if score $single_rotation gm4_machine_data matches 4 run setblock ~ ~ ~ furnace[facing=east]{CustomName:'{"translate":"%1$s%3427655$s","with":["Smeltery",{"translate":"container.gm4.smeltery"}]}'}

# summon hopper display armor stand
execute if score $single_rotation gm4_machine_data matches 1 run summon armor_stand ~ ~-1.25 ~-1 {NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_smeltery_hopper","gm4_machine_display","smithed.block"],HasVisualFire:1,CustomName:'"gm4_smeltery_hopper"',ArmorItems:[{},{},{},{}]}
execute if score $single_rotation gm4_machine_data matches 2 run summon armor_stand ~1 ~-1.25 ~ {NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_smeltery_hopper","gm4_machine_display","smithed.block"],HasVisualFire:1,CustomName:'"gm4_smeltery_hopper"',ArmorItems:[{},{},{},{}]}
execute if score $single_rotation gm4_machine_data matches 3 run summon armor_stand ~ ~-1.25 ~1 {NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_smeltery_hopper","gm4_machine_display","smithed.block"],HasVisualFire:1,CustomName:'"gm4_smeltery_hopper"',ArmorItems:[{},{},{},{}]}
execute if score $single_rotation gm4_machine_data matches 4 run summon armor_stand ~-1 ~-1.25 ~ {NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_smeltery_hopper","gm4_machine_display","smithed.block"],HasVisualFire:1,CustomName:'"gm4_smeltery_hopper"',ArmorItems:[{},{},{},{}]}

# summon display armor stand and marker entity
summon armor_stand ~ ~-0.3 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_smeltery_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_smeltery_stand"',ArmorItems:[{},{},{},{id:"minecraft:iron_block",Count:1b,tag:{CustomModelData:3420001}}]}
summon marker ~ ~ ~ {Tags:["gm4_smeltery","gm4_machine_marker","smithed.block"],CustomName:'"gm4_smeltery"'}

# mark block as placed
playsound block.anvil.use block @a[distance=..4] ~ ~ ~ 1 0.8
scoreboard players set $placed_block gm4_machine_data 1