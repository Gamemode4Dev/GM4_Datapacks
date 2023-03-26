# remove tag from fish after finding kelp and giving points
# @s = tropical fish with gm4_hy_tracked_fish tag
# at @s
# run from fish/search_goal/goal_type

# needed to stop the lily pad raycast
scoreboard players set $max_search_depth gm4_hy_data 0


# count adjacent kelp for points
scoreboard players set $adj_kelp gm4_hy_data 0
execute if block ~1 ~ ~ #gm4_hydromancy:kelp run scoreboard players add $adj_kelp gm4_hy_data 1
execute if block ~-1 ~ ~ #gm4_hydromancy:kelp run scoreboard players add $adj_kelp gm4_hy_data 1
execute if block ~ ~ ~1 #gm4_hydromancy:kelp run scoreboard players add $adj_kelp gm4_hy_data 1
execute if block ~ ~ ~-1 #gm4_hydromancy:kelp run scoreboard players add $adj_kelp gm4_hy_data 1
# no adjacent kelp is 3, reduced to 2 for 1 adjacent kelp, and 1 if there is 2 or 3.
execute if score $adj_kelp gm4_hy_data matches 0 run scoreboard players add @s gm4_hy_charge 3
execute if score $adj_kelp gm4_hy_data matches 1 run scoreboard players add @s gm4_hy_charge 2
execute if score $adj_kelp gm4_hy_data matches 2..3 run scoreboard players add @s gm4_hy_charge 1

tag @s remove gm4_hy_tracked_fish
