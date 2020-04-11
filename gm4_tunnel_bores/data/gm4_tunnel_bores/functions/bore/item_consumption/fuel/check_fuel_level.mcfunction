# @s = tunnel bores
# at world spawn
# called by gm4_tunnel_bores:bore/mine/auto_mine on a 2.9 min slow clock and by gm4_tunnel_bores:bore/activator_rail/force_mine when a cart is on an activator rail

# get fuel level from nbt if this wasn't done in gm4_tunnel_bores:bore/direction/restore_previous_direction
execute unless score Fuel gm4_bore_fuel matches 1.. store result score Fuel gm4_bore_fuel run data get entity @s Fuel

# look for coal and charcoal
execute if score Fuel gm4_bore_fuel matches 1..3600 run function gm4_tunnel_bores:bore/item_consumption/fuel/search_fuel

# clear fuel score
scoreboard players reset Fuel gm4_bore_fuel
