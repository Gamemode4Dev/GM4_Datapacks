# @s = @e[tag=gm4_chairs] and IF player is on the stair block
execute if block ~ ~ ~ #stairs[facing=north] align xyz run tp @s ~.5 ~-.39 ~.55 0 0
execute if block ~ ~ ~ #stairs[facing=east] align xyz run tp @s ~.45 ~-.39 ~.5 90 0
execute if block ~ ~ ~ #stairs[facing=south] align xyz run tp @s ~.5 ~-.39 ~.45 180 0
execute if block ~ ~ ~ #stairs[facing=west] align xyz run tp @s ~.55 ~-.39 ~.5 -90 0
