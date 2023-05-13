# Creates Potion Cleric's trades based on lib_trades
# @s = Potion Cleric
# at @s
# run from gm4_mob_curing:cure/witch

# trade stuff
function gm4_mob_curing:potion_cleric/register_trades
function #gm4_trades:modify_external_trader

# discount the curer
execute if data entity @e[type=minecraft:item,limit=1,distance=..3,tag=gm4_gapple] Thrower run function gm4_mob_curing:potion_cleric/discount_curer
tag @s remove gm4_mob_curing_needs_init
