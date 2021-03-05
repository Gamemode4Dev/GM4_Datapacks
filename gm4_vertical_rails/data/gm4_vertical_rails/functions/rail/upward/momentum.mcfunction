# Checks if Vertical Rails go up or downward, prioritising up
# @s = minecart, touching a Vertical Rail (ladder), with gm4_vert_rails_momentum tag
# at @s
# run from tick

execute if block ~ ~ ~ ladder[facing=north] run data merge entity @s {Motion:[0.0,0.32,0.15]}
execute if block ~ ~ ~ ladder[facing=south] run data merge entity @s {Motion:[0.0,0.32,-0.15]}
execute if block ~ ~ ~ ladder[facing=east] run data merge entity @s {Motion:[-0.15,0.32,0.0]}
execute if block ~ ~ ~ ladder[facing=west] run data merge entity @s {Motion:[0.15,0.32,0.0]}
