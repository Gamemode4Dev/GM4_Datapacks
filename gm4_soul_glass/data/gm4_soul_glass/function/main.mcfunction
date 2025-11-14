schedule function gm4_soul_glass:main 16t

# process soul glass
execute as @e[type=marker,tag=gm4_soul_glass] at @s run function gm4_soul_glass:process

# Kill old blast furnace markers, remove this later
kill @e[type=marker,tag=gm4_sg_furnace]
