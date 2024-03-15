# slow clock for refueling
execute if score refuel_clock gm4_bore_fuel matches 220.. run scoreboard players set refuel_clock gm4_bore_fuel 0
scoreboard players add refuel_clock gm4_bore_fuel 1

# bore handling
execute as @e[type=furnace_minecart,tag=gm4_tunnel_bore] run function gm4_tunnel_bores:bore/mine/auto_mine
