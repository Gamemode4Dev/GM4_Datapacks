#@s = @e[type=item,nbt=CRAFTING_TABLE] at @s if block ~ ~-1 ~ dropper{CC RECIPE} align xyz positioned ~.5 ~-1 ~.5
#Run from main

summon armor_stand ~ ~.1 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_custom_crafter"],Fire:200000,CustomName:"\"gm4_custom_crafter\"",ArmorItems:[{},{},{},{id:"crafting_table",Count:1}]}
data merge block ~ ~ ~ {Items:[],CustomName:"\"Custom Crafter\""}
advancement grant @a[distance=..4] only gm4:custom_crafters
kill @s
