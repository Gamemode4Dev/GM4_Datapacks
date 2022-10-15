# Checks to make sure gm4_trades-1.2

execute if score gm4_trades load.status matches 1 if score gm4_trades_minor load.status matches 2 run function gm4_trades-1.2:wandering_trader/modify
