execute if score gm4_trades load.status matches 1 if score gm4_trades_minor load.status matches 1 run function gm4_trades-1.1:load

execute unless score gm4_trades load.status matches 1 run schedule clear gm4_trades-1.1:main
execute if score gm4_trades load.status matches 1 unless score gm4_trades_minor load.status matches 1 run schedule clear gm4_trades-1.1:main
