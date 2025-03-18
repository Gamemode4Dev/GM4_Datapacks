# probably want to replace the type ignore tag with type supported tag thats auto generated
execute as @e[type=minecraft:fishing_bobber] at @s as @e[type=!#gm4_reeling_rods:ignore,distance=..42] at @s run function gm4_reeling_rods:id/set

schedule function gm4_reeling_rods:tick 1t
