# @s = tunnel bores on top of #minecraft:rails
# at @s
# called by gm4_tunnel_bores:bore/tunnel_bore_5hz

# check for rails ahead of the cart and initiate rail placement. Use at @s to adjust position to updated rotation
execute if block ^ ^ ^1 #gm4_tunnel_bores:rail_replacable as @e[type=area_effect_cloud,tag=gm4_bore_storage,distance=..0.5,limit=1,sort=nearest] run function gm4_tunnel_bores:bore/item_consumption/rail/handle_rail

# stop cart if rail placement failed
execute if score placed_rail gm4_bore_rail matches 0 run function gm4_tunnel_bores:bore/mine/stop_cart

# force mine
execute if entity @s[tag=!gm4_tunnel_bore_on_cooldown] if block ~ ~ ~ minecraft:activator_rail[powered=true] run function gm4_tunnel_bores:bore/activator_rail/force_mine

# reset fake player
scoreboard players reset placed_rail gm4_bore_rail
