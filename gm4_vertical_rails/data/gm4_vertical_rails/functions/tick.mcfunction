execute as @e[type=#gm4:minecarts,tag=!smithed.entity] at @s if block ~ ~ ~ ladder run function gm4_vertical_rails:momentum

schedule function gm4_vertical_rails:tick 1t
