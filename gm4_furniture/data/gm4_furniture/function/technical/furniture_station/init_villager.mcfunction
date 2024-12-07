# spawn villager for furniture_station
# @s = new villager
# at varying locations depending on function, villager will be placed here
# run from place/furniture/furniture_station
# run from technical/furniture_station/activation/turn_active
# run from technical/furniture_station/lightning/revive_villager

# set villager data
data merge entity @s {VillagerData:{level:99},Invulnerable:1b,Team:"gm4_furniture_nocol",Tags:["gm4_furniture","gm4_furniture.furniture_station","smithed.entity","smithed.strict","gm4_new_furniture"],CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.furniture_station","fallback":"Furniture Station"},[{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:half_invert"},{"translate":"gui.gm4.furniture_station.offset","font":"gm4:container_gui"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:offscreen"},{"translate":"gui.gm4.furniture_station","fallback":"","font":"gm4:container_gui","color":"white"},{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:half_invert"},{"translate":"gui.gm4.furniture_station.offset","font":"gm4:container_gui"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"minecraft:default","color":"#404040"}]]}',NoAI:1b,Silent:1b,active_effects:[{id:"minecraft:invisibility",duration:-1,show_particles:0b},{id:"minecraft:resistance",amplifier:9,duration:-1,show_particles:0b}]}
scoreboard players add @s gm4_furniture_index 0

# villager is spawned 1000 blocks in the air so it is not visible the first tick
tp @s ~ ~-1000 ~

# build trades
execute at @s run function gm4_furniture:technical/furniture_station/build_trades/prep
