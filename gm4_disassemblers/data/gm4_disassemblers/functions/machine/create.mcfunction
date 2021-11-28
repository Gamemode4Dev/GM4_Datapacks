# places the disassembler down
# @s = player who placed the disassembler
# located at the center of the placed block
# run from gm4_disassemblers:machine/verify_placement

# place dropper
execute if score $rotation gm4_machine_data matches 1 run setblock ~ ~ ~ dropper[facing=down]{CustomName:'{"translate":"%1$s%3427655$s","with":["Disassemble Gear",{"translate":"container.gm4.disassembler"}]}'}
execute if score $rotation gm4_machine_data matches 2 run setblock ~ ~ ~ dropper[facing=up]{CustomName:'{"translate":"%1$s%3427655$s","with":["Disassemble Gear",{"translate":"container.gm4.disassembler"}]}'}
execute if score $rotation gm4_machine_data matches 3 run setblock ~ ~ ~ dropper[facing=south]{CustomName:'{"translate":"%1$s%3427655$s","with":["Disassemble Gear",{"translate":"container.gm4.disassembler"}]}'}
execute if score $rotation gm4_machine_data matches 4 run setblock ~ ~ ~ dropper[facing=west]{CustomName:'{"translate":"%1$s%3427655$s","with":["Disassemble Gear",{"translate":"container.gm4.disassembler"}]}'}
execute if score $rotation gm4_machine_data matches 5 run setblock ~ ~ ~ dropper[facing=north]{CustomName:'{"translate":"%1$s%3427655$s","with":["Disassemble Gear",{"translate":"container.gm4.disassembler"}]}'}
execute if score $rotation gm4_machine_data matches 6 run setblock ~ ~ ~ dropper[facing=east]{CustomName:'{"translate":"%1$s%3427655$s","with":["Disassemble Gear",{"translate":"container.gm4.disassembler"}]}'}

# summon display armor stand and marker entity
summon armor_stand ~ ~-0.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_disassembler_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_disassembler_stand"',ArmorItems:[{},{},{},{id:"minecraft:tnt",Count:1b,tag:{CustomModelData:3420001}}]}
summon marker ~ ~ ~ {Tags:["gm4_disassembler","gm4_machine_marker","smithed.block"],CustomName:'"gm4_disassembler"'}

# mark block as placed
playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.9 0.1
scoreboard players set $placed_block gm4_machine_data 1
