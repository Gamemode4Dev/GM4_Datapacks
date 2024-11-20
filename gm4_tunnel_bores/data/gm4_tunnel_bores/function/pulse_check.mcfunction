
schedule function gm4_tunnel_bores:pulse_check 1t

# control main module clock
scoreboard players add main_clock gm4_bore_data 1
execute if score main_clock gm4_bore_data matches 16.. run scoreboard players set main_clock gm4_bore_data 0

# control slow clock for cart cooldown

execute if score main_clock gm4_bore_data = trigger_tick gm4_bore_data run function gm4_tunnel_bores:bore/mine/cooldown/clock_control

# handle all furnace carts
execute as @e[type=furnace_minecart] run function gm4_tunnel_bores:furnace_cart_20hz

#compares assigned run tick to current tick and calls main
execute if score main_clock gm4_bore_data = trigger_tick gm4_bore_data run function gm4_tunnel_bores:main
