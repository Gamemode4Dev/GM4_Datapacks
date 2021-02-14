#@s = @e[type=item,nbt=CRAFTING_TABLE] at @s if block ~ ~-1 ~ dropper{CC RECIPE} align xyz positioned ~.5 ~-1 ~.5
#Run from main

execute unless block ~ ~ ~ dropper{Items:[]} run summon armor_stand ~ ~.1 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_custom_crafter","gm4_machine"],Fire:200000,CustomName:'"gm4_custom_crafter"',ArmorItems:[{},{},{},{id:"crafting_table",Count:1,tag:{CustomModelData:1}}]}
data merge block ~ ~ ~ {Items:[],CustomName:'{"translate":"%1$s%3427655$s","with":["Custom Crafter",{"translate":"block.gm4.custom_crafter"}]}'}
advancement grant @a[distance=..4] only gm4:custom_crafters
kill @s
