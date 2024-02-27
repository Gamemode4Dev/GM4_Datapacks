# Replace witch with villager
# @s = witch that replaced the villager
# at @s
# runs from lightning/tag

# grab id and index for the new villager
execute align xyz as @e[type=interaction,tag=gm4_furniture.furniture_station,tag=gm4_furniture.main,dx=0,dy=0,dz=0] run function gm4_furniture:technical/furniture_station/lightning/get_scores

# spawn villager and set ids
summon villager ~ ~1000 ~ {VillagerData:{level:99},Invulnerable:1b,Team:"gm4_furniture_nocol",Tags:["gm4_furniture","gm4_furniture.furniture_station","smithed.entity","smithed.strict","gm4_new_furniture"],CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.furniture_station","fallback":"Furniture Station"},[{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:half_invert"},{"translate":"gui.gm4.furniture_station.offset","font":"gm4:container_gui"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:offscreen"},{"translate":"gui.gm4.furniture_station","fallback":"","font":"gm4:container_gui","color":"white"},{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:half_invert"},{"translate":"gui.gm4.furniture_station.offset","font":"gm4:container_gui"},{"translate":"container.gm4.furniture_station","fallback":"Furniture Station","font":"gm4:furniture","color":"#404040"}]]}',NoAI:1b,Silent:1b,active_effects:[{id:"minecraft:invisibility",duration:-1,show_particles:0b},{id:"minecraft:resistance",amplifier:9,duration:-1,show_particles:0b}]}
tp @e[type=villager,tag=gm4_new_furniture,limit=1] ~ ~ ~
scoreboard players operation @e[type=villager,tag=gm4_new_furniture,limit=1] gm4_furniture_index = $restore_index gm4_furniture_data
execute as @e[type=villager,tag=gm4_new_furniture,limit=1] at @s run function gm4_furniture:technical/furniture_station/build_trades/prep
execute store result score @e[type=villager,tag=gm4_new_furniture] gm4_furniture_id run scoreboard players get $restore_id gm4_furniture_id

# kill witch
tp @s ~ -10000 ~
kill @s
