# @s = command block placed by gm4_relocators:place_down/place_block

function gm4_relocators:place_down/place_block

setblock ~ ~ ~ dropper[facing=north]{CustomName:'{"translate":"%1$s%3427655$s","with":["Disassembler",{"translate":"block.gm4.disassembler"}]}'}
summon armor_stand ~ ~-.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_disassembler"],Fire:200000,CustomName:'"gm4_disassembler"',ArmorItems:[{},{},{},{id:"minecraft:tnt",Count:1b,tag:{CustomModelData:1}}]}
playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.9 0.1
