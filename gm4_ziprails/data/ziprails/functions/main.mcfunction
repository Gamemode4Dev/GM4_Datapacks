#advancement
execute at @e[type=#gm4:minecarts,tag=gm4_linked] run advancement grant @p[distance=..1,gamemode=!spectator] only gm4:ziprails

schedule function ziprails:main 16t
