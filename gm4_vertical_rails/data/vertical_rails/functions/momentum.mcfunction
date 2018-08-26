execute if block ~ ~ ~ ladder run tp ~ ~.3 ~
execute if block ~ ~ ~ ladder[facing=north] run data merge entity @s {Motion:[0.0,0.1,0.25]}
execute if block ~ ~ ~ ladder[facing=south] run data merge entity @s {Motion:[0.0,0.1,-0.25]}
execute if block ~ ~ ~ ladder[facing=east] run data merge entity @s {Motion:[-0.25,0.1,0.0]}
execute if block ~ ~ ~ ladder[facing=west] run data merge entity @s {Motion:[0.25,0.1,0.0]}
