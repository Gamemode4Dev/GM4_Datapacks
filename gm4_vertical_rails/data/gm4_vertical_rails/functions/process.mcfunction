# tag minecarts upon attaching to a Vertical Rail
execute as @s[tag=!gm4_vert_rail_momentum] at @s if block ~ ~ ~ ladder run function gm4_vertical_rails:rail/check_direction

# while on a Vertical Rail
execute as @s[tag=gm4_vert_rail_momentum] at @s if block ~ ~ ~ ladder run function gm4_vertical_rails:rail/apply_direction

# once off a Vertical Rail
execute as @s at @s unless block ~ ~ ~ ladder run function gm4_vertical_rails:rail/clear_tags


schedule function gm4_vertical_rails:tick 1t
