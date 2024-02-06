# process trapped signs
execute as @e[type=marker,tag=gm4_trapped_sign] at @s run function gm4_trapped_signs:process

schedule function gm4_trapped_signs:main 1t
