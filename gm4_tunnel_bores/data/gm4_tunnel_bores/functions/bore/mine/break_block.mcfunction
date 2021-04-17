# @s = tunnel bores with mineable block infront
# at @s (aligned to block center)
# called by gm4_tunnel_bores:bore/mine/auto_mine and gm4_tunnel_bores:bore/activator_rail/force_mine upon breaking operation

# mine tunnel use fill to circumvent MC-163286
execute positioned ^1 ^ ^1 unless block ~ ~ ~ #gm4_tunnel_bores:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy
execute positioned ^ ^ ^1 unless block ~ ~ ~ #minecraft:rails unless block ~ ~ ~ #gm4_tunnel_bores:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy
execute positioned ^-1 ^ ^1 unless block ~ ~ ~ #gm4_tunnel_bores:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy
execute positioned ^1 ^1 ^1 unless block ~ ~ ~ #gm4_tunnel_bores:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy
execute positioned ^ ^1 ^1 unless block ~ ~ ~ #gm4_tunnel_bores:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy
execute positioned ^-1 ^1 ^1 unless block ~ ~ ~ #gm4_tunnel_bores:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy
execute positioned ^1 ^2 ^1 unless block ~ ~ ~ #gm4_tunnel_bores:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy
execute positioned ^ ^2 ^1 unless block ~ ~ ~ #gm4_tunnel_bores:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy
execute positioned ^-1 ^2 ^1 unless block ~ ~ ~ #gm4_tunnel_bores:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy

# playsound
playsound minecraft:entity.iron_golem.step block @a[distance=..8] ~ ~ ~ 0.6 0.2 0

# check for rails ahead of the cart and initiate rail placement. Use at @s to adjust position to updated rotation
execute if block ^ ^ ^1 #gm4:air as @e[type=area_effect_cloud,tag=gm4_bore_storage,distance=..0.5,limit=1,sort=nearest] run function gm4_tunnel_bores:bore/item_consumption/rail/handle_rail

# stop cart if rail placement failed
execute if score placed_rail gm4_bore_rail matches 0 run function gm4_tunnel_bores:bore/mine/stop_cart

# reset fake player
scoreboard players reset placed_rail gm4_bore_rail

# put cart on cooldown
tag @s add gm4_tunnel_bore_on_cooldown
