# @s = bore aec without rails looking for more rails
# at bore minecart (aligned to block center)
# run from gm4_tunnel_bores:bore/item_consumption/rail/handle_rail

# find nearby chest minecart
execute store success score found_supply_cart gm4_bore_rail run tag @e[type=minecraft:chest_minecart,distance=..1.4,limit=1] add gm4_bore_supply_minecart

# continue rail loading operation if a supply cart was found
execute if score found_supply_cart gm4_bore_rail matches 1.. run function gm4_tunnel_bores:bore/item_consumption/rail/found_supply_cart
