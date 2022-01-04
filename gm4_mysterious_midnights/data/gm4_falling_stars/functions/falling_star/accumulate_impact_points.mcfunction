# @s = @e[type=marker,tag=gm4_star_impact_point]
# at @s
# run from gm4_falling_stars:falling_star/select_spawn_location

# spawn impact points. Max 20, each with a chance.
scoreboard players add $loop_count gm4_mm_data 1
execute if predicate gm4_falling_stars:spawn_chance run summon marker ~ ~ ~ {CustomName:'"gm4_falling_stars_impact_point"',Tags:["gm4_falling_stars_impact_point"]}

# loop
execute unless score $loop_count gm4_mm_data matches 8.. run function gm4_falling_stars:falling_star/accumulate_impact_points
