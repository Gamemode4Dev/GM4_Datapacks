# @s = tunnel bores with low fuel
# at world spawn
# called by gm4_tunnel_bores:bore/item_consumption/check_fuel_level

# find nearby chest minecart
execute at @s align xyz positioned ~.5 ~.5 ~.5 store success score found_supply_cart gm4_bore_fuel run tag @e[type=minecraft:chest_minecart,distance=..1.4,limit=1] add gm4_bore_supply_minecart

# if a supply cart was found, continue fueling operation
execute if score found_supply_cart gm4_bore_fuel matches 1.. run function gm4_tunnel_bores:bore/item_consumption/fuel/found_supply_cart

# play horn sound if cart is nearly out of fuel and couldn't find any to refuel. Only do this when this function is called by a 2.9 fuel check, not an activator rail.
execute if score Fuel gm4_bore_fuel matches 1..3600 if score refuel_clock gm4_bore_fuel matches 220.. at @s run playsound block.note_block.flute neutral @a[distance=..16] ~ ~ ~ 1 0.6 0
