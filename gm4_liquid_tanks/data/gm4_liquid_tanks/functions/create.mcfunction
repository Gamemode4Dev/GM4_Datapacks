#@s = glass item inside correct hopper at armor stand location
#run from main

execute unless block ~ ~ ~ hopper{Items:[]} run summon armor_stand ~ ~ ~ {CustomName:'"gm4_liquid_tank"',Tags:["gm4_no_edit","gm4_liquid_tank","gm4_machine"],NoGravity:1,Marker:1,Silent:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039552,ArmorItems:[{},{},{},{id:"glass",Count:1,tag:{CustomModelData:1}}]}
data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Empty Tank",{"translate":"block.gm4.liquid_tank.empty"}]}',Items:[]}
execute as @e[tag=gm4_liquid_tank,limit=1,distance=..0.1] run function gm4_liquid_tanks:init_tank_scores
playsound block.end_portal_frame.fill block @a[distance=..30] ~ ~ ~ 1 0.5
advancement grant @a[distance=..4,gamemode=!spectator] only gm4:liquid_tanks_create
kill @s
