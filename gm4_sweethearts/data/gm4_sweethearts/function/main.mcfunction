# @s = none
# at undefined
# scheduled from init and self

execute as @a[gamemode=!creative,gamemode=!spectator,predicate=gm4_sweethearts:valid_donor] at @s run function gm4_sweethearts:transferring

schedule function gm4_sweethearts:main 16t
