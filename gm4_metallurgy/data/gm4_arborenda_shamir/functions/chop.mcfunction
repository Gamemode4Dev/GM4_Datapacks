#@s = players with the gm4_has_arborenda tag .
#run from main

tag @s add gm4_looking_for_log
execute as @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:oak_log"}}] at @s run function gm4_arborenda_shamir:init_fell_oak
execute if entity @s[tag=gm4_looking_for_log] as @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:spruce_log"}}] at @s run function gm4_arborenda_shamir:init_fell_spruce
execute if entity @s[tag=gm4_looking_for_log] as @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:acacia_log"}}] at @s run function gm4_arborenda_shamir:init_fell_acacia
execute if entity @s[tag=gm4_looking_for_log] as @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:birch_log"}}] at @s run function gm4_arborenda_shamir:init_fell_birch
execute if entity @s[tag=gm4_looking_for_log] as @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:jungle_log"}}] at @s run function gm4_arborenda_shamir:init_fell_jungle
execute if entity @s[tag=gm4_looking_for_log] as @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:dark_oak_log"}}] at @s run function gm4_arborenda_shamir:init_fell_dark_oak
execute if entity @s[tag=gm4_looking_for_log] as @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:mushroom_stem"}}] at @s run function gm4_arborenda_shamir:init_fell_mushroom
tag @s remove gm4_looking_for_log
