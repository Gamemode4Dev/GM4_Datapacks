# find possible locations to grow a new kelp plant
# @s = growth marker
# at @s positioned orthogonally up 1
# run from coral_core/growth/kelp/spread

scoreboard players set $spread_success gm4_hy_data 0
execute if block ~ ~ ~ #gm4_hydromancy:kelp_replaceable if block ~ ~-1 ~ #gm4:full_collision unless block ~ ~-1 ~ #mincraft:leaves store success score $spread_success gm4_hy_data run summon marker ~ ~ ~ {Tags:["gm4_hy_possible_kelp"]}
execute if score $spread_success gm4_hy_data matches 0 if block ~ ~-1 ~ #gm4_hydromancy:kelp_replaceable if block ~ ~-2 ~ #gm4:full_collision unless block ~ ~-2 ~ #mincraft:leaves store success score $spread_success gm4_hy_data run summon marker ~ ~-1 ~ {Tags:["gm4_hy_possible_kelp"]}
execute if score $spread_success gm4_hy_data matches 0 if block ~ ~-2 ~ #gm4_hydromancy:kelp_replaceable if block ~ ~-3 ~ #gm4:full_collision unless block ~ ~-3 ~ #mincraft:leaves run summon marker ~ ~-2 ~ {Tags:["gm4_hy_possible_kelp"]}
