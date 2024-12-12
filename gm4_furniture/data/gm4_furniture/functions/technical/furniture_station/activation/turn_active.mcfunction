# turn furniture station on if no player interacted with it
# @s = furniture reactivation interaction entity
# at @s
# run from technical/furniture_station/activation/process
# run frin interact/furniture_station/swap_tool

# turn tool upright
execute align xyz run data merge entity @e[type=item_display,tag=gm4_furniture.tool_main,dx=0,dy=0,dz=0,limit=1] {interpolation_duration:5,start_interpolation:-1,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.6f,0f],scale:[1f,1f,1f]}}

# spawn villager and set ids
summon villager ~ ~1000 ~ {VillagerData:{level:99},Invulnerable:1b,Team:"gm4_furniture_nocol",Tags:["gm4_furniture","gm4_furniture.furniture_station","smithed.entity","smithed.strict","gm4_new_furniture"],CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.furniture_station","fallback":"Furniture Station"},[{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:half_invert"},{"translate":"gui.gm4.furniture_station.offset","font":"gm4:container_gui"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:offscreen"},{"translate":"gui.gm4.furniture_station","fallback":"","font":"gm4:container_gui","color":"white"},{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:half_invert"},{"translate":"gui.gm4.furniture_station.offset","font":"gm4:container_gui"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:furniture","color":"#404040"}]]}',NoAI:1b,Silent:1b,active_effects:[{id:"minecraft:invisibility",duration:-1,show_particles:0b},{id:"minecraft:resistance",amplifier:9,duration:-1,show_particles:0b}]}
execute align xyz run tp @e[type=villager,tag=gm4_new_furniture,limit=1] ~.5 ~0.0001 ~.5
scoreboard players operation @e[type=villager,tag=gm4_new_furniture,limit=1,distance=..4] gm4_furniture_id = @s gm4_furniture_id
scoreboard players operation @e[type=villager,tag=gm4_new_furniture,limit=1,distance=..4] gm4_furniture_index = @s gm4_furniture_index
execute as @e[type=villager,tag=gm4_new_furniture,limit=1,distance=..4] at @s run function gm4_furniture:technical/furniture_station/build_trades/prep
tag @e[type=villager,tag=gm4_new_furniture,limit=1,distance=..4] remove gm4_new_furniture

# mark interaction as complete and remove interaction entity
scoreboard players set $interaction_processed gm4_furniture_data 1
kill @s
