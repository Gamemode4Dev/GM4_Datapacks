# Minecart moving downwards on a Vertical Rail
# @s = minecart, touching a Vertical Rail (ladder), with gm4_vert_rails_down tag
# at @s
# run from rail/apply_direction

execute if block ~ ~ ~ ladder[facing=north] run data merge entity @s {Motion:[0.0,-0.32,0.15]}
execute if block ~ ~ ~ ladder[facing=south] run data merge entity @s {Motion:[0.0,-0.32,-0.15]}
execute if block ~ ~ ~ ladder[facing=east] run data merge entity @s {Motion:[-0.15,-0.32,0.0]}
execute if block ~ ~ ~ ladder[facing=west] run data merge entity @s {Motion:[0.15,-0.32,0.0]}
