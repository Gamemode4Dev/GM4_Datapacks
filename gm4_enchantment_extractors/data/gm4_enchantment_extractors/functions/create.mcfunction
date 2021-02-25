# @s = enchanting table item dropped onto dropper
# run from main

summon armor_stand ~ ~-1.2 ~ {CustomName:'"GM4 Enchantment Extractor"',Invisible:1b,Invulnerable:1b,Marker:1b,NoGravity:1,Tags:["gm4_enchantment_extractor","gm4_no_edit","gm4_machine"],ArmorItems:[{},{},{},{id:"minecraft:enchanting_table",Count:1,tag:{CustomModelData:1}}],DisabledSlots:2039583}
data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Enchantment Extractor",{"translate":"block.gm4.enchantment_extractor"}]}',Items:[]}

advancement grant @a[distance=..3,gamemode=!spectator] only gm4:enchantment_extractors
playsound entity.experience_orb.pickup master @a[distance=..5] ~ ~ ~ 1 0.7 1
kill @s
