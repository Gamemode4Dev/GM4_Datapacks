# slow clock for refueling
execute if score refuel_clock gm4_bore_fuel matches 220.. run scoreboard players set refuel_clock gm4_bore_fuel 0
scoreboard players add refuel_clock gm4_bore_fuel 1

# NOTE remove during 1.20 update: updates old machine carts with an entity version and smithed compatibility
execute as @e[type=furnace_minecart,tag=gm4_tunnel_bore] unless score @s gm4_entity_version = @s gm4_entity_version run function gm4_tunnel_bores:upgrade_machine_cart
# bore handling
execute as @e[type=furnace_minecart,tag=gm4_tunnel_bore] run function gm4_tunnel_bores:bore/mine/auto_mine

# destroy dead carts
execute as @e[type=area_effect_cloud,tag=gm4_bore_storage] at @s unless entity @e[type=furnace_minecart,tag=gm4_tunnel_bore,distance=..0.01] run function gm4_tunnel_bores:bore/destroy

# NOTE remove during 1.20 update: allows old machine cart items to spawn a tunnel bore
# turn crafted carts into tunnel bores. VERY EXPERIMENTAL DETECTION OF CARTS.
execute as @e[type=furnace_minecart,tag=!gm4_tunnel_bore,nbt={CustomName:'{"italic":false,"color":"white","translate":"%1$s","with":["Minecart with Piston",{"translate":"item.gm4.minecart.bore"}]}'}] at @s run function gm4_tunnel_bores:machine/create_cart
