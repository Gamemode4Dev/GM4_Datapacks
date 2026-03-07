# Replace witch with villager
# @s = witch that replaced the villager
# at @s
# run from lightning/detect

# grab id and index for the new villager
execute align xyz as @e[type=interaction,tag=gm4_furniture.furniture_station,tag=gm4_furniture.main,dx=0,dy=0,dz=0] run function gm4_furniture:technical/furniture_station/lightning/get_scores

# spawn villager
execute positioned ~ ~1000 ~ summon villager run function gm4_furniture:technical/furniture_station/init_villager
# reset temp scores
scoreboard players reset $temp gm4_furniture_id
scoreboard players reset $temp gm4_furniture_index

# kill witch
tp @s ~ -10000 ~
kill @s
