
schedule function gm4_shiny_items:main 16t

########## TAG: gm4_shiny_blacklist

execute as @a at @s run function gm4_shiny_items:blacklist_items

########## TAG: gm4_can_become_shiny

execute as @e[type=minecraft:item,tag=!gm4_shiny_blacklist] at @s if entity @a[distance=3..10] if entity @e[type=minecraft:experience_orb,distance=..2,tag=!gm4_shiny_blacklist] unless entity @e[distance=..2,nbt={Item:{tag:{HideFlags:44}}}] run tag @s add gm4_can_become_shiny
execute as @e[tag=gm4_can_become_shiny] at @s run data modify entity @s Item.tag.HideFlags set value 44
execute as @e[tag=gm4_can_become_shiny] at @s unless entity @e[type=minecraft:experience_orb,distance=..2] run data remove entity @s Item.tag.HideFlags
execute as @e[tag=gm4_can_become_shiny] at @s unless entity @e[type=minecraft:experience_orb,distance=..2] run tag @s remove gm4_can_become_shiny

########## TAG: gm4_can_be_absorbed

execute as @e[type=minecraft:experience_orb] at @s if entity @e[tag=gm4_can_become_shiny,distance=..2] run tag @s add gm4_can_be_absorbed
execute as @e[tag=gm4_can_be_absorbed] at @s unless entity @e[tag=gm4_can_become_shiny,distance=..2] run tag @s remove gm4_can_be_absorbed

########## COPY VALUE TO SCORE, TRANSFER XP TO ITEM

execute as @e[tag=gm4_can_be_absorbed] at @s facing entity @e[tag=gm4_can_become_shiny,sort=nearest,limit=1,distance=0.2..2] feet run tp ^ ^ ^.03

execute as @e[tag=gm4_can_be_absorbed] at @s store result score @s gm4_xporb_xp run data get entity @s Value 1

execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=1..}] at @s run particle dust 1.000 0.031 0.000 1 ~ ~.2 ~ .05 .05 .05 .1 1 
execute as @e[type=item,scores={gm4_absorbed_xp=1..}] at @s run particle minecraft:enchant ~ ~.4 ~ .1 .1 .1 .01 1
execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=1..}] at @s at @e[tag=gm4_can_become_shiny,limit=1,sort=nearest] run particle minecraft:enchant ~ ~.4 ~ .1 .1 .1 .01 3
execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=1..}] at @s at @e[tag=gm4_can_become_shiny,limit=1,sort=nearest,scores={gm4_absorbed_xp=1..25},distance=..5] run playsound minecraft:entity.puffer_fish.blow_up ambient @a[distance=..15] ~ ~ ~ .2 .1
execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=1..}] at @s at @e[tag=gm4_can_become_shiny,limit=1,sort=nearest,scores={gm4_absorbed_xp=26..50},distance=..5] run playsound minecraft:entity.puffer_fish.blow_up ambient @a[distance=..15] ~ ~ ~ .2 .4
execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=1..}] at @s at @e[tag=gm4_can_become_shiny,limit=1,sort=nearest,scores={gm4_absorbed_xp=51..75},distance=..5] run playsound minecraft:entity.puffer_fish.blow_up ambient @a[distance=..15] ~ ~ ~ .2 .8
execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=1..}] at @s at @e[tag=gm4_can_become_shiny,limit=1,sort=nearest,scores={gm4_absorbed_xp=76..100},distance=..5] run playsound minecraft:entity.puffer_fish.blow_up ambient @a[distance=..15] ~ ~ ~ .2 1.2
execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=1..}] at @s at @e[tag=gm4_can_become_shiny,limit=1,sort=nearest,scores={gm4_absorbed_xp=101..125},distance=..5] run playsound minecraft:entity.puffer_fish.blow_up ambient @a[distance=..15] ~ ~ ~ .2 1.6
execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=1..}] at @s at @e[tag=gm4_can_become_shiny,limit=1,sort=nearest,scores={gm4_absorbed_xp=126..150},distance=..5] run playsound minecraft:entity.puffer_fish.blow_up ambient @a[distance=..15] ~ ~ ~ .2 2

execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=1..}] at @s run scoreboard players add @e[tag=gm4_can_become_shiny,limit=1,sort=nearest] gm4_absorbed_xp 1
execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=2..}] at @s run scoreboard players add @e[tag=gm4_can_become_shiny,limit=1,sort=nearest] gm4_absorbed_xp 1
execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=3..}] at @s run scoreboard players add @e[tag=gm4_can_become_shiny,limit=1,sort=nearest] gm4_absorbed_xp 1
execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=4..}] at @s run scoreboard players add @e[tag=gm4_can_become_shiny,limit=1,sort=nearest] gm4_absorbed_xp 1
execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=5..}] at @s run scoreboard players add @e[tag=gm4_can_become_shiny,limit=1,sort=nearest] gm4_absorbed_xp 1
execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=6..}] at @s run scoreboard players add @e[tag=gm4_can_become_shiny,limit=1,sort=nearest] gm4_absorbed_xp 1
execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=7..}] at @s run scoreboard players add @e[tag=gm4_can_become_shiny,limit=1,sort=nearest] gm4_absorbed_xp 1
execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=8..}] at @s run scoreboard players add @e[tag=gm4_can_become_shiny,limit=1,sort=nearest] gm4_absorbed_xp 1

execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=9..}] at @s run scoreboard players add @e[tag=gm4_can_become_shiny,limit=1,sort=nearest] gm4_absorbed_xp 1
execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=10..}] at @s run scoreboard players add @e[tag=gm4_can_become_shiny,limit=1,sort=nearest] gm4_absorbed_xp 1

execute as @e[tag=gm4_can_be_absorbed,scores={gm4_xporb_xp=1..}] at @s run scoreboard players remove @s gm4_xporb_xp 10
execute as @e[tag=gm4_can_be_absorbed] at @s store result entity @s Value short 1 run scoreboard players get @s gm4_xporb_xp

########## MAKE ITEM SHINY

execute as @e[scores={gm4_xporb_xp=..0}] at @s run particle dust 1.000 0.031 0.000 1 ~ ~.3 ~ .1 .1 .1 .1 5 
execute as @e[scores={gm4_xporb_xp=..0}] at @s run kill @s

execute as @e[scores={gm4_absorbed_xp=150..}] at @s run data remove entity @s Item.tag.HideFlags
execute as @e[scores={gm4_absorbed_xp=150..}] at @s run data modify entity @s Item.tag.Enchantments set value [{id:"minecraft:lure",lvl:1s}]
execute as @e[scores={gm4_absorbed_xp=150..}] at @s run data modify entity @s Item.tag.HideFlags set value 1
execute as @e[scores={gm4_absorbed_xp=150..}] at @s run tag @s add gm4_shiny_blacklist
execute as @e[scores={gm4_absorbed_xp=150..}] at @s run tag @s remove gm4_can_become_shiny
execute as @e[scores={gm4_absorbed_xp=150..}] at @s run playsound minecraft:entity.experience_orb.pickup ambient @a[distance=..15] ~ ~ ~ .1 .5
scoreboard players reset @e[scores={gm4_absorbed_xp=150..}] gm4_absorbed_xp

