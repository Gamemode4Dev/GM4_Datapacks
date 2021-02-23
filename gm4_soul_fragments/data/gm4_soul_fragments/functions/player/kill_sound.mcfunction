# @s = none
# from player/intake_fragment

execute as @a[tag=gm4_stop_sound] at @s run stopsound @a[distance=..22] neutral minecraft:block.beacon.ambient
execute as @a[tag=gm4_stop_sound] run tag @s remove gm4_stop_sound
