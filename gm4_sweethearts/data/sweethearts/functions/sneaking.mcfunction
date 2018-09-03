# @s = sneaking player holding poppy
tag @s add sweethearts_donor
execute as @a[distance=1..2,limit=1] unless score @s gm4_sh_health matches 19.. unless score @s gm4_sh_sneak matches 1.. at @s run function sweathearts:transfer
tag @s remove sweethearts_donor
