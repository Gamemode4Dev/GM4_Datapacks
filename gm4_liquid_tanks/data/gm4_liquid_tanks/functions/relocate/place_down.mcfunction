# @s = command block placed by gm4_relocators:place_down/place_block

setblock ~ ~ ~ hopper{CustomName:'{"translate":"%1$s%3427655$s","with":["Empty Tank",{"translate":"block.gm4.liquid_tank.empty"}]}'}
summon armor_stand ~ ~-.5 ~ {CustomName:"\"gm4_liquid_tank\"",Tags:["gm4_no_edit","gm4_liquid_tank"],NoGravity:1,Marker:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039552,ArmorItems:[{},{},{},{id:"glass",Count:1,tag:{CustomModelData:1}}]}
execute as @e[tag=gm4_liquid_tank,limit=1,distance=..0.3] run function gm4_liquid_tanks:init_tank_scores
playsound block.end_portal_frame.fill block @a[distance=..30] ~ ~ ~ 1 0.5
