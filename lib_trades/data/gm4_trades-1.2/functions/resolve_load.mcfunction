execute if score gm4_trades load.status matches 1 if score gm4_trades_minor load.status matches 2 run function gm4_trades-1.2:load

execute unless score gm4_trades load.status matches 1 run schedule clear gm4_trades-1.2:main
execute if score gm4_trades load.status matches 1 unless score gm4_trades_minor load.status matches 2 run schedule clear gm4_trades-1.2:main
