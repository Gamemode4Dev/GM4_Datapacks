execute if block ~ ~ ~ ladder[facing=north] run data merge entity @s {Motion:[0.0,0.32,0.15]}
execute if block ~ ~ ~ ladder[facing=south] run data merge entity @s {Motion:[0.0,0.32,-0.15]}
execute if block ~ ~ ~ ladder[facing=east] run data merge entity @s {Motion:[-0.15,0.32,0.0]}
execute if block ~ ~ ~ ladder[facing=west] run data merge entity @s {Motion:[0.15,0.32,0.0]}
