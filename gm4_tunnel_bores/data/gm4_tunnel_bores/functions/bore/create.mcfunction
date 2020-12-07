# @s = furnace minecart to be turned into a tnnel bore
# at cart location
# called by gm4_tunnel_bores:main

# kill existing cart and summon new cart
kill @s
summon furnace_minecart ~ ~ ~ {CustomName:'{"text":"Minecart with Piston"}',CustomDisplayTile:1b,DisplayState:{Name:"minecraft:piston",Properties:{facing:"up"}},DisplayOffset:6,Tags:["gm4_tunnel_bore"],Passengers:[{id:"minecraft:area_effect_cloud",Duration:2147483647,CustomName:'{"text":"gm4_bore_storage"}',Tags:[gm4_bore_storage]}]}

# initiate scores
scoreboard players add @e[type=area_effect_cloud,tag=gm4_bore_storage,distance=..0.1] gm4_bore_rail 0

# grant advancement
advancement grant @a[distance=..5] only gm4:tunnel_bores
