# get a location for volatile pillar
# @s = pillar marker
# at @s
# run from mob/process/elite/volatile/pillar_location
# run from here

execute if block ~ ~ ~ #gm4:no_collision unless block ~ ~-1 ~ #gm4:no_collision align y run return run tp @s ~ ~ ~

scoreboard players remove $move_y_limit gm4_mu_data 1
execute if score $move_y_limit gm4_mu_data matches 0 run return 0
execute if block ~ ~ ~ #gm4:no_collision positioned ~ ~-1 ~ run return run function gm4_monsters_unbound:mob/process/elite/volatile/pillar_location_y
execute positioned ~ ~1 ~ run return run function gm4_monsters_unbound:mob/process/elite/volatile/pillar_location_y
