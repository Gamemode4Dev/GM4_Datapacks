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
summon item_display ~ ~-0.4999 ~ {Tags:["gm4_furniture","gm4_furniture.display","gm4_furniture.furniture_station","smithed.entity","smithed.strict","gm4_new_furniture"],CustomName:'"gm4_furniture_display.furniture_station"',item:{id:"leather_horse_armor",count:1,components:{"minecraft:custom_data":{gm4_furniture:{furniture_id:"furniture_station"}},"minecraft:custom_model_data":"block/furniture/furniture_station"}},item_display:head,Rotation:[0.0f,0.0f],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]}}
summon interaction ~-0.0001 ~-0.5001 ~-0.0001 {Tags:["gm4_furniture","gm4_furniture.interaction","gm4_furniture.furniture_station","gm4_furniture.main","smithed.entity","smithed.strict","gm4_new_furniture"],height:1.0002f,width:1.0002f,response:1b}
summon interaction ^0.25 ^-0.5 ^0.26 {Tags:["gm4_furniture","gm4_furniture.interaction","gm4_furniture.furniture_station","gm4_furniture.swap_tool","gm4_furniture.next","gm4_furniture.additional","smithed.entity","smithed.strict","gm4_new_furniture"],height:1f,width:0.5f,response:1b}
summon interaction ^-0.25 ^-0.5 ^0.26 {Tags:["gm4_furniture","gm4_furniture.interaction","gm4_furniture.furniture_station","gm4_furniture.swap_tool","gm4_furniture.prev","gm4_furniture.additional","smithed.entity","smithed.strict","gm4_new_furniture"],height:1f,width:0.5f,response:1b}
summon item_display ~ ~-0.4999 ~ {Tags:["gm4_furniture","gm4_furniture.furniture_station","gm4_furniture.tool","gm4_furniture.tool_main","smithed.entity","smithed.strict","gm4_new_furniture"],CustomName:'"gm4_furniture_display.furniture_station_tool"',item:{id:"command_block",count:1},item_display:head,Rotation:[0.0f,0.0f],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.6f,0f],scale:[1f,1f,1f]}}
summon item_display ~ ~-0.4999 ~ {Tags:["gm4_furniture","gm4_furniture.furniture_station","gm4_furniture.tool","gm4_furniture.tool_next","smithed.entity","smithed.strict","gm4_new_furniture"],CustomName:'"gm4_furniture_display.furniture_station_tool"',item:{id:"command_block",count:1},item_display:head,Rotation:[0.0f,0.0f],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.28125f,-0.45312f,0.5f],scale:[1f,1f,1f]}}
summon item_display ~ ~-0.4999 ~ {Tags:["gm4_furniture","gm4_furniture.furniture_station","gm4_furniture.tool","gm4_furniture.tool_prev","smithed.entity","smithed.strict","gm4_new_furniture"],CustomName:'"gm4_furniture_display.furniture_station_tool"',item:{id:"command_block",count:1},item_display:head,Rotation:[0.0f,0.0f],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.28125f,-0.45312f,0.5f],scale:[1f,1f,1f]}}
data modify entity @e[type=item_display,tag=gm4_new_furniture,tag=gm4_furniture.tool_main,limit=1,distance=..2] item.components."minecraft:custom_model_data" set from storage gm4_furniture:data furniture_station[0]."minecraft:custom_model_data"
data modify entity @e[type=item_display,tag=gm4_new_furniture,tag=gm4_furniture.tool_next,limit=1,distance=..2] item.components."minecraft:custom_model_data" set from storage gm4_furniture:data furniture_station[1]."minecraft:custom_model_data"
data modify entity @e[type=item_display,tag=gm4_new_furniture,tag=gm4_furniture.tool_prev,limit=1,distance=..2] item.components."minecraft:custom_model_data" set from storage gm4_furniture:data furniture_station[-1]."minecraft:custom_model_data"
setblock ~ ~ ~ barrier

# spawn villager and set ids
summon villager ~ ~1000 ~ {VillagerData:{level:99},Invulnerable:1b,Team:"gm4_furniture_nocol",Tags:["gm4_furniture","gm4_furniture.furniture_station","smithed.entity","smithed.strict","gm4_new_furniture"],CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.furniture_station","fallback":"Furniture Station"},[{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:half_invert"},{"translate":"gui.gm4.furniture_station.offset","font":"gm4:container_gui"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:offscreen"},{"translate":"gui.gm4.furniture_station","fallback":"","font":"gm4:container_gui","color":"white"},{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:half_invert"},{"translate":"gui.gm4.furniture_station.offset","font":"gm4:container_gui"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"minecraft:default","color":"#404040"}]]}',NoAI:1b,Silent:1b,active_effects:[{id:"minecraft:invisibility",duration:-1,show_particles:0b},{id:"minecraft:resistance",amplifier:9,duration:-1,show_particles:0b}]}
tp @e[type=villager,tag=gm4_new_furniture,limit=1] ~ ~-0.4999 ~
scoreboard players set @e[type=villager,tag=gm4_new_furniture,limit=1] gm4_furniture_index 0
execute as @e[type=villager,tag=gm4_new_furniture,limit=1] at @s run function gm4_furniture:technical/furniture_station/build_trades/prep
execute unless block ~ ~1 ~ water[level=0] run setblock ~ ~1 ~ light[level=0]
execute if block ~ ~1 ~ water[level=0] run setblock ~ ~1 ~ light[level=0,waterlogged=true]
execute store result score @e[type=interaction,tag=gm4_new_furniture] gm4_furniture_id run scoreboard players add $next_id gm4_furniture_id 1
execute store result score @e[type=villager,tag=gm4_new_furniture] gm4_furniture_id run scoreboard players get $next_id gm4_furniture_id

# rotate furniture_station depending on rotation set by player (if rotation is 1 default rotation can be kept)
execute if score $rotation gm4_furniture_data matches 2 as @e[tag=gm4_new_furniture,distance=..8] at @s run tp @s ~ ~ ~ 90 0
execute if score $rotation gm4_furniture_data matches 3 as @e[tag=gm4_new_furniture,distance=..8] at @s run tp @s ~ ~ ~ 180 0
execute if score $rotation gm4_furniture_data matches 4 as @e[tag=gm4_new_furniture,distance=..8] at @s run tp @s ~ ~ ~ -90 0

# mark block as placed
playsound minecraft:block.barrel.close block @a[distance=..6] ~ ~ ~ 1 1.6
tag @e[distance=..2] remove gm4_new_furniture
