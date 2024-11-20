# MAIN
# scheduled from gm4_trades:load

# execute on wandering traders
execute as @e[type=wandering_trader,tag=!gm4_trader,tag=!smithed.entity] if data entity @s Offers.Recipes at @s run function gm4_trades:wandering_trader/modify

# loop
schedule function gm4_trades:main 10s
