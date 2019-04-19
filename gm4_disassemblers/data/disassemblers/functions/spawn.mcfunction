# Called from recipe_check
summon armor_stand ~ ~ ~ {Tags:["gm4_disassembler"],Small:1b,CustomName:"\"gm4_disassembler\"",NoGravity:1b,Invisible:1b,Marker:1b,ArmorItems:[{},{},{},{id:"minecraft:tnt",Count:1b}]}
data merge block ~ ~ ~ {Items:[{}],CustomName:"\"Disassembler\""}
kill @s
playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.9 0.1
advancement grant @a[gamemode=!spectator,distance=..6,limit=1,sort=nearest] only gm4:disassemblers
