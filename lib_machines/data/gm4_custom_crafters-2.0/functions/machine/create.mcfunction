# places the custom crafter down
# @s = player who placed the custom crafter
# located at the center of the placed block
# run from gm4_custom_crafters-2.0:machine/verify_placement

execute if score $rotation gm4_machine_data matches 1 run setblock ~ ~ ~ dropper[facing=up]{CustomName:'{"translate":"%1$s%3427655$s","with":["Custom Crafter",{"translate":"block.gm4.custom_crafter"}]}'}
execute if score $rotation gm4_machine_data matches 2 run setblock ~ ~ ~ dropper[facing=down]{CustomName:'{"translate":"%1$s%3427655$s","with":["Custom Crafter",{"translate":"block.gm4.custom_crafter"}]}'}
execute if score $rotation gm4_machine_data matches 3 run setblock ~ ~ ~ dropper[facing=north]{CustomName:'{"translate":"%1$s%3427655$s","with":["Custom Crafter",{"translate":"block.gm4.custom_crafter"}]}'}
execute if score $rotation gm4_machine_data matches 4 run setblock ~ ~ ~ dropper[facing=east]{CustomName:'{"translate":"%1$s%3427655$s","with":["Custom Crafter",{"translate":"block.gm4.custom_crafter"}]}'}
execute if score $rotation gm4_machine_data matches 5 run setblock ~ ~ ~ dropper[facing=south]{CustomName:'{"translate":"%1$s%3427655$s","with":["Custom Crafter",{"translate":"block.gm4.custom_crafter"}]}'}
execute if score $rotation gm4_machine_data matches 6 run setblock ~ ~ ~ dropper[facing=west]{CustomName:'{"translate":"%1$s%3427655$s","with":["Custom Crafter",{"translate":"block.gm4.custom_crafter"}]}'}

summon armor_stand ~ ~-0.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_custom_crafter_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_custom_crafter_stand"',ArmorItems:[{},{},{},{id:"crafting_table",Count:1,tag:{CustomModelData:3420001}}]}

data merge entity @e[type=marker,tag=gm4_new_machine_marker,limit=1] {Tags:["gm4_custom_crafter","gm4_machine_marker","smithed.block"],CustomName:'"gm4_custom_crafter"'}
