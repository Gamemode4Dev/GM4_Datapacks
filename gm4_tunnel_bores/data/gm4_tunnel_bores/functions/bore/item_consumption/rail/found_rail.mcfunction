# @s = bore aec that found rails in a supply cart
# at bore minecart (aligned to block center)
# run from gm4_tunnel_bores:bore/item_consumption/rail/found_supply_cart

# load rails into AEC score
execute store result score @s gm4_bore_rail run data get storage gm4_tunnel_bores:bore_container Items[0].Count
data modify storage gm4_tunnel_bores:bore_container Items[0].Count set value 0

# delete rail items in original inventory
data modify entity @e[type=minecraft:chest_minecart,tag=gm4_bore_supply_minecart,limit=1] Items append from storage gm4_tunnel_bores:bore_container Items[0]

# clean up storage
data remove storage gm4_tunnel_bores:bore_container Items
