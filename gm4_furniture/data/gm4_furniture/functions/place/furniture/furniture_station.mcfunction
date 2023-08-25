# try to place the furniture_station
# @s = player who placed the furniture player head
# at the center of the placed block rotated along axis to face towards player or away from the wall
# run from place/resolve_id

# first perform checks to see if furniture fits where it was placed
scoreboard players set $valid_placement gm4_furniture_data 1
execute unless block ~ ~1 ~ #gm4:replaceable run scoreboard players set $valid_placement gm4_furniture_data 0
execute positioned ~ ~1 ~ align y if entity @e[type=interaction,tag=gm4_furniture,tag=!gm4_new_furniture,distance=..0.1] run scoreboard players set $valid_placement gm4_furniture_data 0

execute if score $placement_blocked gm4_furniture_data matches 1 run return 0

# if placement is not valid cancel placement
execute if score $valid_placement gm4_furniture_data matches 0 run loot spawn ~ ~ ~ loot gm4_furniture:items/furniture_station
execute if score $valid_placement gm4_furniture_data matches 0 run setblock ~ ~ ~ air
execute if score $valid_placement gm4_furniture_data matches 0 run return 0

# spawn the furniture_station
execute positioned ~ ~-0.4999 ~ run summon item_display ~ ~ ~ {Tags:["gm4_furniture","gm4_furniture.display","gm4_furniture.furniture_station","smithed.entity","smithed.strict","gm4_new_furniture"],CustomName:'"gm4_furniture_display.furniture_station"',item:{id:"leather_horse_armor",Count:1,tag:{data:{loot_table:"gm4_furniture:items/furniture_station"},CustomModelData:3420150}},item_display:head,Rotation:[0.0f,0.0f],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]}}
summon interaction ~-0.0001 ~-0.5001 ~-0.0001 {Tags:["gm4_furniture","gm4_furniture.interaction","gm4_furniture.furniture_station","gm4_furniture.main","smithed.entity","smithed.strict","gm4_new_furniture"],CustomName:'"gm4_furniture.furniture_station"',height:1.0002f,width:1.0002f,response:1b}
setblock ~ ~ ~ barrier

# spawn trader and set ids
summon wandering_trader ~ ~1000 ~ {Team:"gm4_furniture_nocol",Tags:["gm4_furniture","gm4_furniture.furniture_station","smithed.entity","smithed.strict","gm4_new_furniture"],CustomName:'{"text":"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBA","font":"gm4_furniture","color":"white"}',NoAI:1b,Silent:1b,active_effects:[{id:"minecraft:invisibility",duration:-1,show_particles:0b},{id:"minecraft:resistance",amplifier:9,duration:-1,show_particles:0b}]}
tp @e[type=wandering_trader,tag=gm4_new_furniture,limit=1] ~ ~-0.4999 ~
setblock ~ ~1 ~ flower_pot
execute store result score @e[type=interaction,tag=gm4_new_furniture] gm4_furniture_id run scoreboard players add $next_id gm4_furniture_id 1
execute store result score @e[type=wandering_trader,tag=gm4_new_furniture] gm4_furniture_id run scoreboard players get $next_id gm4_furniture_id

# rotate furniture_station depending on rotation set by player (if rotation is 1 default rotation can be kept)
execute if score $rotation gm4_furniture_data matches 2 as @e[tag=gm4_new_furniture,distance=..8] at @s run tp @s ~ ~ ~ 90 0
execute if score $rotation gm4_furniture_data matches 3 as @e[tag=gm4_new_furniture,distance=..8] at @s run tp @s ~ ~ ~ 180 0
execute if score $rotation gm4_furniture_data matches 4 as @e[tag=gm4_new_furniture,distance=..8] at @s run tp @s ~ ~ ~ -90 0

# mark block as placed
playsound minecraft:block.barrel.close block @a[distance=..6] ~ ~ ~ 1 1.6
tag @e[distance=..2] remove gm4_new_furniture
