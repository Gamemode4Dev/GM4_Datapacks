schedule clear gm4_trades-1.3:main
execute if score gm4_trades load.status matches 1 if score gm4_trades_minor load.status matches 3 run function gm4_trades-1.3:load
