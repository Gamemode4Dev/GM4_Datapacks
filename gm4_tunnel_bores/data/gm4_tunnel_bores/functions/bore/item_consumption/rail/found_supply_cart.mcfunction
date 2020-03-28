# @s = bore aec that found rails in a supply cart
# at bore minecart (aligned to block center)
# run from gm4_tunnel_bores:bore/item_consumption/rail/load_rail

# Copy the last rail item into temporary inventory
execute store success score found_rail gm4_bore_rail run data modify storage gm4_tunnel_bores:bore_container Items[] set from entity @e[type=minecraft:chest_minecart,tag=gm4_bore_supply_minecart,limit=1] Items[{id:"minecraft:rail"}]
# get the count in a scoreboard and deplete stack
execute if score found_rail gm4_bore_rail matches 1.. run function gm4_tunnel_bores:bore/item_consumption/rail/found_rail

# revoke tag
tag @e[type=minecraft:chest_minecart,tag=gm4_bore_supply_minecart] remove gm4_bore_supply_minecart
