#firework assembler creation
#@s - @e[type=item,nbt=CRAFTING_TABLE] if entity @e[type=item,nbt=FLINT_AND_STEEL,distance=..1] if block ~ ~-1 ~ dropper{FA RECIPE}
#called by main

summon armor_stand ~ ~-.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_firework_assembler"],Fire:200000,CustomName:'"gm4_firework_assembler"',ArmorItems:[{},{},{},{id:"minecraft:red_concrete_powder",Count:1}]}
particle minecraft:flash
playsound minecraft:entity.firework_rocket.blast player @a[distance=..20] ~ ~ ~ 100 1 1
data merge block ~ ~ ~ {Items:[],CustomName:'"Firework Assembler"'}
advancement grant @a[distance=..4] only gm4:firework_assemblers
execute positioned ~ ~1 ~ run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:crafting_table",Count:1b}},distance=..1]
execute positioned ~ ~1 ~ run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:flint_and_steel",Count:1b}},distance=..1]
