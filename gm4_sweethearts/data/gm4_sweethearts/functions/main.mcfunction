execute as @a[gamemode=!creative,gamemode=!spectator,predicate=gm4_sweethearts:valid_transfer] at @s run function gm4_sweethearts:transferring

schedule function gm4_sweethearts:check_transfer 1t
schedule function gm4_sweethearts:main 16t
