execute as @e[type=armor_stand,tag=gm4_turn_clockwise] at @s run tp @s ~ ~ ~ ~1 ~0
execute as @e[type=armor_stand,tag=gm4_turn_anticlockwise] at @s run tp @s ~ ~ ~ ~-1 ~0

execute as @e[type=armor_stand,tag=gm4_bas_track] at @s at @p[tag=gm4_bas_track,distance=..4] positioned ~ ~1.6 ~ run function gm4_better_armour_stands:pose/track/new
execute at @a[tag=gm4_bas_track] run tp @e[type=villager,tag=gm4_bas_detect,sort=nearest,limit=1] ^ ^ ^.3
execute as @a[tag=gm4_bas_move] at @s positioned ~ ~1 ~ run function gm4_better_armour_stands:move/moving

schedule function gm4_better_armour_stands:tick 1t
