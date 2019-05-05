# @s = sneaking player holding poppy
# run from main
tag @s add sweethearts_donor
execute as @a[tag=!sweethearts_donor,distance=..3,limit=1] unless score @s gm4_health matches 19.. unless score @s gm4_sh_sneak matches 1.. at @s run function sweethearts:transfer
tag @s remove sweethearts_donor
