# get interacting player to sit at this furniture block
# @s = furniture's interacted interaction entity
# at @s align xyz
# run from interact/process

# if furniture station was inactive activate first
execute as @e[type=interaction,tag=gm4_furniture.reactivate,dx=0,dy=0,dz=0] at @s run function gm4_furniture:technical/furniture_station/activation/turn_active

# move index up/down
execute if entity @s[tag=gm4_furniture.next] run scoreboard players add @e[type=villager,tag=gm4_furniture.furniture_station,dx=0,dy=0,dz=0,limit=1] gm4_furniture_index 1
execute if entity @s[tag=gm4_furniture.prev] run scoreboard players remove @e[type=villager,tag=gm4_furniture.furniture_station,dx=0,dy=0,dz=0,limit=1] gm4_furniture_index 1
execute as @e[type=villager,tag=gm4_furniture.furniture_station,dx=0,dy=0,dz=0,limit=1] at @s run function gm4_furniture:technical/furniture_station/build_trades/prep

# store new index on main interaction entity
execute as @e[type=interaction,tag=gm4_furniture.main,distance=..8] if score @s gm4_furniture_id = $check_id gm4_furniture_id run scoreboard players operation @s gm4_furniture_index = $store_index gm4_furniture_data

# mark interaction as resolved
scoreboard players set $interaction_processed gm4_furniture_data 1
