# @s = tunnel bores with low fuel
# at world spawn
# called by gm4_tunnel_bores:bore/item_consumption/fuel/search_fuel

# check and try to fuel using charcoal
function gm4_tunnel_bores:bore/item_consumption/fuel/load_charcoal
# if still out of fuel, look for coal
execute if score Fuel gm4_bore_fuel matches 1..3600 run function gm4_tunnel_bores:bore/item_consumption/fuel/load_coal

# revoke tag
tag @e[type=minecraft:chest_minecart,tag=gm4_bore_supply_minecart,limit=1] remove gm4_bore_supply_minecart
