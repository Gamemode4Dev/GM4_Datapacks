# @s = tunnel bores
# at world spawn
# called by gm4_tunnel_bores:furnace_cart_20hz
# handles cart facing vector and stores push direction properly. === 5Hz ===
#execute if score slow_clock gm4_bore_data = trigger_tick gm4_bore_data run say 5Hz and main
#execute unless score clock gm4_bore_data = trigger_tick gm4_bore_data run say 5Hz

# re-activate cart after cooldown
execute if score slow_clock gm4_bore_data matches 0 if score main_clock gm4_bore_data = trigger_tick gm4_bore_data run tag @s remove gm4_tunnel_bore_on_cooldown

# calculate cart movement direction and supossed bore facing
function gm4_tunnel_bores:bore/direction/update_direction

# DEBUG PARTICLE. ENABLE TO DEBUG CART FACING.
#execute unless score @s gm4_bore_data matches -1 at @s run particle minecraft:flame ^ ^ ^1 0 0 0 0 1 force

# reassign rotation if cart is ontop of rail (heading =|= -1)
execute unless score @s gm4_bore_data matches -1 at @s run function gm4_tunnel_bores:bore/check_cart_environment
