#@s - @e[tag=gm4_can_breed]
#called by dirty_food:main

#reset clock
scoreboard players set current_tick gm4_df_clock 0
#tag entities respective of their food source(s)
tag @s[type=minecraft:pig,tag=!gm4_eats_carrots] add gm4_eats_carrots
tag @s[type=minecraft:rabbit,tag=!gm4_eats_carrots] add gm4_eats_carrots
tag @s[type=minecraft:pig,tag=!gm4_eats_potatoes] add gm4_eats_potatoes
tag @s[type=minecraft:chicken,tag=!gm4_eats_seeds] add gm4_eats_seeds
tag @s[type=minecraft:cow,tag=!gm4_eats_wheat] add gm4_eats_wheat
tag @s[type=minecraft:llama,tag=!gm4_eats_wheat] add gm4_eats_wheat
tag @s[type=minecraft:sheep,tag=!gm4_eats_wheat] add gm4_eats_wheat
#run eating checks
execute if entity @s[tag=gm4_eats_carrots] if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:carrot"},OnGround:1b},sort=nearest,limit=1,distance=...5] run function dirty_food:run/carrot
execute if entity @s[tag=gm4_eats_potatoes] if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:potato"},OnGround:1b},sort=nearest,limit=1,distance=...5] run function dirty_food:run/potato
execute if entity @s[tag=gm4_eats_seeds] if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:wheat_seeds"},OnGround:1b},sort=nearest,limit=1,distance=...5] run function dirty_food:run/seed/wheat
execute if entity @s[tag=gm4_eats_seeds] if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:melon_seeds"},OnGround:1b},sort=nearest,limit=1,distance=...5] run function dirty_food:run/seed/melon
execute if entity @s[tag=gm4_eats_seeds] if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:pumpkin_seeds"},OnGround:1b},sort=nearest,limit=1,distance=...5] run function dirty_food:run/seed/pumpkin
execute if entity @s[tag=gm4_eats_seeds] if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:beetroot_seeds"},OnGround:1b},sort=nearest,limit=1,distance=...5] run function dirty_food:run/seed/beetroot
execute if entity @s[tag=gm4_eats_wheat] if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:wheat"},OnGround:1b},sort=nearest,limit=1,distance=...5] run function dirty_food:run/wheat
