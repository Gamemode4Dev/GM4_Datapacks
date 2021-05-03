# Called from recipe_check
summon armor_stand ~ ~ ~ {Tags:["gm4_disassembler","gm4_no_edit"],Small:1b,CustomName:'"gm4_disassembler"',NoGravity:1b,Invisible:1b,Marker:1b,ArmorItems:[{},{},{},{id:"minecraft:tnt",Count:1b,tag:{CustomModelData:1}}]}
data merge storage gm4_custom_crafters:temp/crafter {Items:[{}],CustomName:'{"translate":"%1$s%3427655$s","with":["Disassembler",{"translate":"block.gm4.disassembler"}]}'}
kill @s
playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.9 0.1
advancement grant @a[gamemode=!spectator,distance=..6,limit=1,sort=nearest] only gm4:disassemblers
