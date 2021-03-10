# tag minecarts upon attaching to a Vertical Rail
execute as @e[type=#gm4:minecarts] at @s run function gm4_vertical_rails:process

schedule function gm4_vertical_rails:tick 1t
