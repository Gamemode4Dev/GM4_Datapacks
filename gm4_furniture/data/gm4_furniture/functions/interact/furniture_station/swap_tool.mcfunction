# get interacting player to sit at this furniture block
# @s = furniture's interacted interaction entity
# at @s
# run from interact/process

# move index up/down
execute if entity @s[tag=gm4_furniture.next] align xyz run scoreboard players add @e[type=wandering_trader,tag=gm4_furniture.furniture_station,dx=0,dy=0,dz=0,limit=1] gm4_furniture_index 1
execute if entity @s[tag=gm4_furniture.prev] align xyz run scoreboard players remove @e[type=wandering_trader,tag=gm4_furniture.furniture_station,dx=0,dy=0,dz=0,limit=1] gm4_furniture_index 1
execute align xyz as @e[type=wandering_trader,tag=gm4_furniture.furniture_station,dx=0,dy=0,dz=0,limit=1] at @s run function gm4_furniture:technical/furniture_station/build_trades/prep

# mark interaction as resolved
scoreboard players set $interaction_processed gm4_furniture_data 1
