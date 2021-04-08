# MAIN
# scheduled from gm4_trades-1.0:load

# execute on wandering traders
execute as @e[type=wandering_trader,tag=!gm4_trader] at @s run function gm4_trades-1.0:wandering_trader/modify

# loop
schedule function gm4_trades-1.0:main 10s
