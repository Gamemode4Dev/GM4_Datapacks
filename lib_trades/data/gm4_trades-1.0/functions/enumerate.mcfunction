execute unless score gm4_trades load.status matches 1.. run scoreboard players set gm4_trades load.status 1
execute if score gm4_trades load.status matches 1 unless score gm4_trades_minor load.status matches 0.. run scoreboard players set gm4_trades_minor load.status 0
