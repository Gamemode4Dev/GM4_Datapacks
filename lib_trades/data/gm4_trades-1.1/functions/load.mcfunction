scoreboard objectives add gm4_trades_data dummy

schedule function gm4_trades-1.1:main 1t replace
# THIS LINE ISN'T REQUIRED IF THE LIBRARY WAS CREATED PROPERLY AND CLEARED IN RESOLVE LOAD FOR V1.0 :/
schedule clear gm4_trades-1.0:main
