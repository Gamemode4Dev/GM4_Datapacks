# temp
# run from slow_clock

# grab id
scoreboard players operation $furniture_id gm4_furniture_id = @s gm4_furniture_id

# spawn villager and set ids
summon villager ~ ~1000 ~ {VillagerData:{level:99},Invulnerable:1b,Team:"gm4_furniture_nocol",Tags:["gm4_furniture","gm4_furniture.furniture_station","smithed.entity","smithed.strict","gm4_new_furniture"],CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.furniture_station","fallback":"Furniture Station"},[{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:half_invert"},{"translate":"gui.gm4.furniture_station.offset","font":"gm4:container_gui"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:offscreen"},{"translate":"gui.gm4.furniture_station","fallback":"","font":"gm4:container_gui","color":"white"},{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:half_invert"},{"translate":"gui.gm4.furniture_station.offset","font":"gm4:container_gui"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:furniture","color":"#404040"}]]}',NoAI:1b,Silent:1b,active_effects:[{id:"minecraft:invisibility",duration:-1,show_particles:0b},{id:"minecraft:resistance",amplifier:9,duration:-1,show_particles:0b}]}
execute align xyz positioned ~.5 ~.5 ~.5 run tp @e[type=villager,tag=gm4_new_furniture,limit=1] ~ ~-0.4999 ~
scoreboard players set @e[type=villager,tag=gm4_new_furniture,limit=1] gm4_furniture_index 0
execute as @e[type=villager,tag=gm4_new_furniture,limit=1] at @s run function gm4_furniture:technical/furniture_station/build_trades/prep
execute store result score @e[type=villager,tag=gm4_new_furniture] gm4_furniture_id run scoreboard players get $furniture_id gm4_furniture_id

tag @e[type=villager,tag=gm4_new_furniture] remove gm4_new_furniture

# remove wandering trader
tp @s ~ ~-10000 ~
kill @s
