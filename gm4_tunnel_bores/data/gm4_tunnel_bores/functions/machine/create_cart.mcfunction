# places the tunnel_bore down
# @s = hopper_minecart with the tunnel_bore name
# located at @s
# run from gm4_tunnel_bores:machine/verify_place_cart

# summon new command block minecart
summon furnace_minecart ~ ~ ~ {CustomName:'{"text":"Minecart with Piston"}',CustomDisplayTile:1b,DisplayState:{Name:"minecraft:piston",Properties:{facing:"up"}},DisplayOffset:6,Tags:["gm4_tunnel_bore","gm4_new_machine"],Passengers:[{id:"minecraft:area_effect_cloud",Duration:2147483647,CustomName:'{"text":"gm4_bore_storage"}',Tags:["gm4_bore_storage","gm4_machine_cart","smithed.entity","smithed.strict","gm4_new_machine"]}]}
scoreboard players add @e[type=area_effect_cloud,tag=gm4_bore_storage,tag=gm4_new_machine,distance=..2] gm4_bore_rail 0

tp @e[type=furnace_minecart,distance=..0.1,tag=gm4_new_machine] @s
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1

# clean up
kill @s
tag @e[distance=..2] remove gm4_new_machine
