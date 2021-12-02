# Creates Potion Cleric's trades based on lib_trades
# @s = Potion Cleric
# at @s
# run from gm4_mob_curing:convert_witch

function gm4_mob_curing:potion_cleric/register_trades

function gm4_trades-1.0:wandering_trader/create_pool

tag @s remove gm4_mob_curing_needs_init
