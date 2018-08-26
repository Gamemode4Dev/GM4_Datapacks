execute if block ~ ~ ~ ladder run tp ~ ~.3 ~
execute if block ~ ~ ~ ladder[facing=north] run data merge entity @s {Motion:[0.0,0.2,0.35]}
execute if block ~ ~ ~ ladder[facing=south] run data merge entity @s {Motion:[0.0,0.2,-0.35]}
execute if block ~ ~ ~ ladder[facing=east] run data merge entity @s {Motion:[-0.35,0.2,0.0]}
execute if block ~ ~ ~ ladder[facing=west] run data merge entity @s {Motion:[0.35,0.2,0.0]}
