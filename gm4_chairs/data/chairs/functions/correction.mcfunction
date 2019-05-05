# @s = @e[tag=gm4_chairs] and IF player is on the stair block
execute if block ~ ~ ~ #minecraft:stairs[facing=north] align xyz run tp @s ~.5 ~-.39 ~.69 0 0
execute if block ~ ~ ~ #minecraft:stairs[facing=east] align xyz run tp @s ~.31 ~-.39 ~.5 90 0
execute if block ~ ~ ~ #minecraft:stairs[facing=south] align xyz run tp @s ~.5 ~-.39 ~.31 180 0
execute if block ~ ~ ~ #minecraft:stairs[facing=west] align xyz run tp @s ~.69 ~-.39 ~.5 -90 0
