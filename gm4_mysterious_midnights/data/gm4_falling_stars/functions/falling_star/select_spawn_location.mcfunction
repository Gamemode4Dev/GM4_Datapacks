# spreads impact points
# @s = players in the overworld during a falling star night
# at @s
# run from gm4_falling_stars:falling_star/start_in_area

# spawn impact points
function gm4_falling_stars:falling_star/accumulate_impact_points
scoreboard players reset $loop_count gm4_mm_data

# spread impact points
execute store success score $spread_successful gm4_mm_data run spreadplayers ~ ~ 1 64 false @e[type=marker,tag=gm4_falling_stars_impact_point,distance=..4]

# kill impact points if spread failed
execute if score $spread_successful gm4_mm_data matches 1.. run kill @e[type=marker,tag=gm4_falling_stars_impact_point,distance=..4]

# reset fake players
scoreboard players reset $spread_successful gm4_mm_data
