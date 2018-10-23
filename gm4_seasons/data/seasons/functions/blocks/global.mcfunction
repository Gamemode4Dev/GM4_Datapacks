#run from seasons:general/clock_second


#summon AEC
execute if entity @a[tag=!gm4_szn_in_biome] at @a[tag=!gm4_szn_in_biome] align x align z run summon area_effect_cloud ~.5 ~ ~.5 {Tags:[gm4_szn_global],Duration:1,CustomName:"{\"text\":\"gm4_szn_global\"}"}
execute if entity @a[tag=!gm4_szn_in_biome] at @a[tag=!gm4_szn_in_biome] align x align z run summon area_effect_cloud ~.5 ~ ~.5 {Tags:[gm4_szn_global],Duration:1,CustomName:"{\"text\":\"gm4_szn_global\"}"}
execute if entity @a[tag=!gm4_szn_in_biome] at @a[tag=!gm4_szn_in_biome] align x align z run summon area_effect_cloud ~.5 ~ ~.5 {Tags:[gm4_szn_global],Duration:1,CustomName:"{\"text\":\"gm4_szn_global\"}"}
execute if entity @a[tag=!gm4_szn_in_biome] at @a[tag=!gm4_szn_in_biome] align x align z run summon area_effect_cloud ~.5 ~ ~.5 {Tags:[gm4_szn_global],Duration:1,CustomName:"{\"text\":\"gm4_szn_global\"}"}

#kill nearby AEC (prevents doubling effects)
execute if entity @e[tag=gm4_szn_global] as @e[tag=gm4_szn_global,limit=1,sort=random] at @s as @e[tag=gm4_szn_global,distance=0.1..128] run kill @s

#disperse AEC
execute if entity @e[tag=gm4_szn_global] as @e[tag=gm4_szn_global] at @s run spreadplayers ~ ~ 32 128 false @s


#run commands based on season
execute if entity @e[tag=gm4_szn_global] if score gm4_szn_detect gm4_szn_season matches 1 run function seasons:spring/global
execute if entity @e[tag=gm4_szn_global] if score gm4_szn_detect gm4_szn_season matches 2 run function seasons:summer/global
execute if entity @e[tag=gm4_szn_global] if score gm4_szn_detect gm4_szn_season matches 3 run function seasons:autumn/global
execute if entity @e[tag=gm4_szn_global] if score gm4_szn_detect gm4_szn_season matches 4 run function seasons:winter/global

execute if entity @e[tag=gm4_szn_global] if score gm4_szn_detect gm4_szn_season matches 4 if score gm4_szn_Duration gm4_szn_weather matches 1.. if score gm4_szn_Type gm4_szn_weather matches 2 run function seasons:weather/snow

execute if entity @e[tag=gm4_szn_global] run kill @e[tag=gm4_szn_global]

execute if entity @e[tag=gm4_szn_block] run function seasons:blocks/kill