#run from advancement inventory_changed
#@s = player with iacio shamir equipped

advancement revoke @s only gm4_iacio_shamir:inventory_changed

execute if score @s gm4_iacio_tridnt matches 1.. as @e[type=minecraft:trident,distance=..20,sort=nearest,limit=1] at @s run function gm4_iacio_shamir:add_motion
execute if score @s gm4_iacio_item matches 1.. as @e[type=item,distance=..2,nbt={Age:0s},sort=nearest,limit=1] at @s run function gm4_iacio_shamir:add_motion
execute if score @s gm4_iacio_pearl matches 1.. as @e[type=minecraft:ender_pearl,distance=..2,sort=nearest,limit=1] at @s run function gm4_iacio_shamir:add_motion
execute if score @s gm4_iacio_snowbl matches 1.. as @e[type=minecraft:snowball,distance=..2,sort=nearest,limit=1] at @s run function gm4_iacio_shamir:add_motion
execute if score @s gm4_iacio_egg matches 1.. as @e[type=minecraft:egg,distance=..2,sort=nearest,limit=1] at @s run function gm4_iacio_shamir:add_motion
execute if score @s gm4_iacio_splash matches 1.. as @e[type=minecraft:potion,distance=..2,sort=nearest,limit=1] at @s run function gm4_iacio_shamir:add_motion
execute if score @s gm4_iacio_linger matches 1.. as @e[type=minecraft:potion,distance=..2,sort=nearest,limit=1] at @s run function gm4_iacio_shamir:add_motion

scoreboard players reset @s gm4_iacio_tridnt
scoreboard players reset @s gm4_iacio_item
scoreboard players reset @s gm4_iacio_pearl
scoreboard players reset @s gm4_iacio_snowbl
scoreboard players reset @s gm4_iacio_egg
scoreboard players reset @s gm4_iacio_splash
scoreboard players reset @s gm4_iacio_linger
