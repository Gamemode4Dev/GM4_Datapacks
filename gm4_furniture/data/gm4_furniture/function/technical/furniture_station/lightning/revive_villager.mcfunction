# Replace witch with villager
# @s = witch that replaced the villager
# at @s
# runs from lightning/detect

# grab id and index for the new villager
execute align xyz as @e[type=interaction,tag=gm4_furniture.furniture_station,tag=gm4_furniture.main,dx=0,dy=0,dz=0] run function gm4_furniture:technical/furniture_station/lightning/get_scores

# spawn villager and set ids
execute positioned ~ ~1000 ~ summon villager run function gm4_furniture:technical/furniture_station/init_villager
scoreboard players operation @e[type=villager,tag=gm4_new_furniture,limit=1] gm4_furniture_index = $restore_index gm4_furniture_data
execute store result score @e[type=villager,tag=gm4_new_furniture] gm4_furniture_id run scoreboard players get $restore_id gm4_furniture_id

# kill witch
tp @s ~ -10000 ~
kill @s
