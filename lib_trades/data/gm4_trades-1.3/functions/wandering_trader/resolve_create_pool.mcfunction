# verifies this version of the library is the correct version
# @s = ??
# located at ??
# run from other data packs via #gm4_trades:wandering_trader/create_pool

execute if score gm4_trades load.status matches 1 if score gm4_trades_minor load.status matches 3 run function gm4_trades-1.3:wandering_trader/create_pool
