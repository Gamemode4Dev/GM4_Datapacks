# @s = gateway marker of newly linked main island gateway
# at newly generated gateway on other side
# run from position

execute store success score #loaded gm4_gilded_gateways if loaded ~ ~ ~
# if its not loaded, then its for sure not forceloaded, so we can blindly forceload
execute if score #loaded gm4_gilded_gateways matches 0 run forceload add ~ ~

execute unless block ~ ~ ~ end_gateway unless block ~ ~1 ~ bedrock run return fail

# place
execute if entity @s[tag=gm4_gilded_gateways.gateway.0] run place template gm4_gilded_gateways:postgen_0 ~-2 ~-4 ~-2
execute if entity @s[tag=gm4_gilded_gateways.gateway.1] run place template gm4_gilded_gateways:postgen_1 ~-2 ~-4 ~-2
execute if entity @s[tag=gm4_gilded_gateways.gateway.2] run place template gm4_gilded_gateways:postgen_2 ~-2 ~-4 ~-2

# unforceload
execute if score #loaded gm4_gilded_gateways matches 0 run forceload remove ~ ~

# kill
kill @s
