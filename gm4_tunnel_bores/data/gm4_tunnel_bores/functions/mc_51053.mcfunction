# @s = furnace_minecart
# at world spawn
# called by gm4_tunnel_bores:process_furnace_carts
# fixes MC-51053 === 20Hz ===

# get new PushX and PushZ values from cart Motion
execute store result entity @s PushX double 0.5 run data get entity @s Motion[0]
execute store result entity @s PushZ double 0.5 run data get entity @s Motion[2]
