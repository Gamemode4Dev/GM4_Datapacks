#@s = glass item inside correct hopper at armor stand location
#run from main
data merge block ~ ~ ~ {CustomName:"\"Empty Tank\"",Items:[]}
summon armor_stand ~ ~ ~ {CustomName:"\"gm4_liquid_tank\"",Tags:["gm4_no_edit","gm4_liquid_tank","gm4_lt_idle"],NoGravity:1,Marker:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039552,ArmorItems:[{},{},{},{id:"glass",Count:1}]}
scoreboard players set @e[tag=gm4_liquid_tank,limit=1,distance=..0.1] gm4_lt_value 0
scoreboard players set @e[tag=gm4_liquid_tank,limit=1,distance=..0.1] gm4_lt_max 30
tag @s add gm4_lt_empty
playsound block.end_portal_frame.fill block @a[distance=..30] ~ ~ ~ 1 0.5
advancement grant @a[distance=..4,gamemode=!spectator] only gm4:liquid_tanks_create
kill @s
