# Checks if Vertical Rails go up or downward, prioritising up
# @s = minecart, touching a Vertical Rail (ladder), with gm4_vert_rails_momentum tag
# at @s
# run from tick

# if going up a Vertical Rail
execute as @e[tag=gm4_vert_rail_up] at @s if block ~ ~ ~ ladder run function gm4_vertical_rails:rail/upward/momentum

# if going down a Vertical Rail, or at bottom of Rail
execute as @e[tag=gm4_vert_rail_down] at @s if block ~ ~-1 ~ ladder unless block ~ ~1 ~ ladder run function gm4_vertical_rails:rail/downward/momentum
execute as @e[tag=gm4_vert_rail_down] at @s if block ~ ~ ~ ladder unless block ~ ~-1 ~ ladder run function gm4_vertical_rails:rail/downward/detach_ladder
