# @s = tunnel bores with low fuel
# at world spawn
# called by gm4_tunnel_bores:bore/item_consumption/fuel/found_supply_cart

# copy the last stone slot to a temp array
execute store success score found_coal gm4_bore_fuel run data modify storage gm4_tunnel_bores:bore_container Items[] set from entity @e[type=minecraft:chest_minecart,tag=gm4_bore_supply_minecart,limit=1] Items[{id:"minecraft:coal"}]

# refuel if coal was found
execute if score found_coal gm4_bore_fuel matches 1.. run function gm4_tunnel_bores:bore/item_consumption/fuel/found_coal
