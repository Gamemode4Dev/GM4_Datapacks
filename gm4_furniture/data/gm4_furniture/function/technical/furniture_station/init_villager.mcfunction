# spawn villager for furniture_station
# @s = new villager
# at @s
# run from place/furniture/furniture_station
# run from technical/furniture_station/activation/turn_active
# run from technical/furniture_station/lightning/revive_villager

# set villager data
data merge entity @s {VillagerData:{level:99},Invulnerable:1b,Team:"gm4_furniture_nocol",Tags:["gm4_furniture","gm4_furniture.furniture_station","smithed.entity","smithed.strict","gm4_new_furniture","gm4_furniture.tp_down"],CustomName:{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.furniture_station","fallback":"Furniture Station"},[{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:half_invert"},{"translate":"gui.gm4.furniture_station.offset","font":"gm4:container_gui"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:offscreen"},{"translate":"gui.gm4.furniture_station","fallback":"","font":"gm4:container_gui","color":"white"},{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:half_invert"},{"translate":"gui.gm4.furniture_station.offset","font":"gm4:container_gui"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4_furniture:shift_name","color":"#404040"}]]},NoAI:1b,Silent:1b,active_effects:[{id:"minecraft:invisibility",duration:-1,show_particles:0b},{id:"minecraft:resistance",amplifier:9,duration:-1,show_particles:0b}]}
scoreboard players add @s gm4_furniture_index 0

# tp villager down in a moment so it is not visible the first tick
schedule function gm4_furniture:technical/furniture_station/delayed_init 0.2s

# set ids on new villager if reinit
execute if score $temp gm4_furniture_id matches -2147483648..2147483647 run scoreboard players operation @s gm4_furniture_id = $temp gm4_furniture_id
execute if score $temp gm4_furniture_index matches -2147483648..2147483647 run scoreboard players operation @s gm4_furniture_index = $temp gm4_furniture_index

# build trades
execute at @s run function gm4_furniture:technical/furniture_station/build_trades/prep

# remove tag if reinit (tag is needed for place)
execute if score $temp gm4_furniture_id matches -2147483648..2147483647 run tag @s remove gm4_new_furniture
