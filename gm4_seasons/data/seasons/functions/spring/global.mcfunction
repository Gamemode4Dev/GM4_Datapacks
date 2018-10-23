#run from seasons:blocks/global


#FLOWERS
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ grass_block if block ~ 3 ~ granite if block ~ 1 ~ bedrock run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_szn_block,gm4_szn_poppy],CustomName:"{\"text\":\"gm4_szn_dandelion\"}",Duration:36000}
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ grass_block if block ~ 3 ~ granite if block ~ 1 ~ bedrock run setblock ~ ~ ~ poppy keep

execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ grass_block if block ~ 3 ~ diorite if block ~ 2 ~ bedrock run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_szn_block,gm4_szn_dandelion],CustomName:"{\"text\":\"gm4_szn_dandelion\"}",Duration:36000}
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ grass_block if block ~ 3 ~ diorite if block ~ 2 ~ bedrock run setblock ~ ~ ~ dandelion keep

execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ grass_block if block ~ 6 ~ andesite if block ~ 1 ~ bedrock run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_szn_block,gm4_szn_grass],CustomName:"{\"text\":\"gm4_szn_grass\"}",Duration:36000}
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ grass_block if block ~ 6 ~ andesite if block ~ 1 ~ bedrock run setblock ~ ~ ~ grass keep



#CROPS
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ carrots[age=5] run setblock ~ ~-1 ~ carrots[age=7]
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ carrots[age=3] run setblock ~ ~-1 ~ carrots[age=5]
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ carrots[age=1] run setblock ~ ~-1 ~ carrots[age=3]

execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ potatoes[age=5] run setblock ~ ~-1 ~ potatoes[age=7]
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ potatoes[age=3] run setblock ~ ~-1 ~ potatoes[age=5]
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ potatoes[age=1] run setblock ~ ~-1 ~ potatoes[age=3]

execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ beetroots[age=2] run setblock ~ ~-1 ~ beetroots[age=3]
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ beetroots[age=1] run setblock ~ ~-1 ~ beetroots[age=1]