# @s = tunnel bores with low fuel
# at world spawn
# called by gm4_tunnel_bores:bore/item_consumption/fuel/load_charcoal

# use one charcoal item
execute store result storage gm4_tunnel_bores:bore_container Items[0].Count byte 1 run data get storage gm4_tunnel_bores:bore_container Items[0].Count 0.99

# return items into supply cart
data modify entity @e[type=minecraft:chest_minecart,tag=gm4_bore_supply_minecart,limit=1] Items append from storage gm4_tunnel_bores:bore_container Items[0]

# add fuel to bore
execute store result entity @s Fuel short 1 run scoreboard players operation Fuel gm4_bore_fuel += #3600 gm4_bore_fuel

# clean up storage
data remove storage gm4_tunnel_bores:bore_container Items
