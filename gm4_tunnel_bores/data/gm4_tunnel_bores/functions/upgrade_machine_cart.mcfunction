# updates old machine cart
# @s = tunnel_bore minecart
# located at @s
# run from gm4_tunnel_bores:main

scoreboard players set @e[type=area_effect_cloud,tag=gm4_bore_storage,tag=!smithed.entity,distance=..0.2] gm4_entity_version 1
execute as @e[type=area_effect_cloud,tag=gm4_bore_storage,tag=!smithed.entity,distance=..0.2] run data merge entity @s {Tags:["gm4_bore_storage","gm4_machine_cart","smithed.entity","smithed.strict"]}
scoreboard players set @s gm4_entity_version 1
