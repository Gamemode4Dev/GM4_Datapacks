execute store result storage gm4_swings:data angular_velocity double 0.000001 run scoreboard players get @s gm4_swings.angular_velocity
execute rotated as @s as @p[tag=gm4_swings.swing_sitter,predicate=!gm4_swings:vehicle] run function gm4_swings:launch/launch
