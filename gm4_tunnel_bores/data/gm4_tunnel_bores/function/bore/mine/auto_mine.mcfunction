# @s = tunnel bores
# at world spawn
# called by gm4_tunnel_bores:main if any bores are loaded
# handles default breaking operations. === 1.25Hz ===

# slow clock for refueling
execute if score refuel_clock gm4_bore_fuel matches 220.. run function gm4_tunnel_bores:bore/item_consumption/fuel/check_fuel_level

# detect mineable object infront and start auto mining
execute unless entity @s[tag=gm4_tunnel_bore_on_cooldown] if score @s gm4_bore_data matches 90 at @s if block ~ ~ ~ #minecraft:rails[shape=east_west] align xyz positioned ~.5 ~.5 ~.5 unless block ^ ^ ^1 #gm4_tunnel_bores:unbreakable unless block ^ ^ ^1 #minecraft:rails run function gm4_tunnel_bores:bore/mine/break_block
execute unless entity @s[tag=gm4_tunnel_bore_on_cooldown] if score @s gm4_bore_data matches -90 at @s if block ~ ~ ~ #minecraft:rails[shape=east_west] align xyz positioned ~.5 ~.5 ~.5 unless block ^ ^ ^1 #gm4_tunnel_bores:unbreakable unless block ^ ^ ^1 #minecraft:rails run function gm4_tunnel_bores:bore/mine/break_block
execute unless entity @s[tag=gm4_tunnel_bore_on_cooldown] if score @s gm4_bore_data matches 0 at @s if block ~ ~ ~ #minecraft:rails[shape=north_south] align xyz positioned ~.5 ~.5 ~.5 unless block ^ ^ ^1 #gm4_tunnel_bores:unbreakable unless block ^ ^ ^1 #minecraft:rails run function gm4_tunnel_bores:bore/mine/break_block
execute unless entity @s[tag=gm4_tunnel_bore_on_cooldown] if score @s gm4_bore_data matches 180 at @s if block ~ ~ ~ #minecraft:rails[shape=north_south] align xyz positioned ~.5 ~.5 ~.5 unless block ^ ^ ^1 #gm4_tunnel_bores:unbreakable unless block ^ ^ ^1 #minecraft:rails run function gm4_tunnel_bores:bore/mine/break_block
