# slow clock for refueling
execute if score refuel_clock gm4_bore_fuel matches 220.. run scoreboard players set refuel_clock gm4_bore_fuel 0
scoreboard players add refuel_clock gm4_bore_fuel 1

# NOTE remove during 1.20 update: updates old machine carts with an entity version and smithed compatibility
execute as @e[type=furnace_minecart,tag=gm4_tunnel_bore] unless score @s gm4_entity_version = @s gm4_entity_version run function gm4_tunnel_bores:upgrade_machine_cart
# bore handling
execute as @e[type=furnace_minecart,tag=gm4_tunnel_bore] run function gm4_tunnel_bores:bore/mine/auto_mine
