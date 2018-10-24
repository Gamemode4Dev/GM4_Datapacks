#tag entities respective of their food source(s)
tag @e[type=minecraft:pig,tag=!gm4_eats_carrots] add gm4_eats_carrots
tag @e[type=minecraft:rabbit,tag=!gm4_eats_carrots] add gm4_eats_carrots
tag @e[type=minecraft:pig,tag=!gm4_eats_potatoes] add gm4_eats_potatoes
tag @e[type=minecraft:chicken,tag=!gm4_eats_seeds] add gm4_eats_seeds
tag @e[type=minecraft:cow,tag=!gm4_eats_wheat] add gm4_eats_wheat
tag @e[type=minecraft:llama,tag=!gm4_eats_wheat] add gm4_eats_wheat
tag @e[type=minecraft:sheep,tag=!gm4_eats_wheat] add gm4_eats_wheat

tag @e[tag=gm4_eats_carrots] add gm4_can_breed
tag @e[tag=gm4_eats_potatoes] add gm4_can_breed
tag @e[tag=gm4_eats_seeds] add gm4_can_breed
tag @e[tag=gm4_eats_wheat] add gm4_can_breed

#check for animal near item entity and run commands if found
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:carrot"},OnGround:1b}] at @s if entity @e[sort=nearest,limit=1,distance=..1,tag=gm4_eats_carrots] run function auto_breeding:run
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:potato"},OnGround:1b}] at @s if entity @e[sort=nearest,limit=1,distance=..1,tag=gm4_eats_potatoes] run function auto_breeding:run
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:wheat_seeds"},OnGround:1b}] at @s if entity @e[sort=nearest,limit=1,distance=..1,tag=gm4_eats_seeds] run function auto_breeding:run
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:pumpkin_seeds"},OnGround:1b}] at @s if entity @e[sort=nearest,limit=1,distance=..1,tag=gm4_eats_seeds] run function auto_breeding:run
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:melon_seeds"},OnGround:1b}] at @s if entity @e[sort=nearest,limit=1,distance=..1,tag=gm4_eats_seeds] run function auto_breeding:run
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:beetroot_seeds"},OnGround:1b}] at @s if entity @e[sort=nearest,limit=1,distance=..1,tag=gm4_eats_seeds] run function auto_breeding:run
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:wheat"},OnGround:1b}] at @s if entity @e[sort=nearest,limit=1,distance=..1,tag=gm4_eats_wheat] run function auto_breeding:run