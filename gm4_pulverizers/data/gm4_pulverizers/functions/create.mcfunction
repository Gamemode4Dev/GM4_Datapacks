#@s = glass item inside correct hopper at armor stand location
#run from main

execute unless block ~ ~ ~ hopper{Items:[]} run summon armor_stand ~ ~ ~ {CustomName:"\"gm4_pulverizer\"",Tags:["gm4_no_edit","gm4_pulverizer"],NoGravity:1,Marker:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039552,ArmorItems:[{},{},{},{id:"iron_block",Count:1,tag:{CustomModelData:1}}]}
data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Pulverizer",{"translate":"block.gm4.pulverizer"}]}',Items:[]}
playsound block.anvil.use block @a[distance=..30] ~ ~ ~ .6 0.7
advancement grant @a[distance=..4,gamemode=!spectator] only gm4:pulverizers
kill @s
