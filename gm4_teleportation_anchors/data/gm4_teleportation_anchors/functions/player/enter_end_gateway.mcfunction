# @s = player who just entered an end gateway
# run from advancement "enter_end_gateway"

advancement revoke @s only gm4_teleportation_anchors:enter_end_gateway

# spawn end gateway markers
execute positioned ~.3 ~256 ~.3 if block ~ ~-256 ~ minecraft:end_gateway align xyz unless entity @e[type=marker,tag=gm4_ta_end_gateway,dx=0] run summon marker ~0.5 ~ ~0.5 {CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"]}
execute positioned ~.3 ~256 ~-.3 if block ~ ~-256 ~ minecraft:end_gateway align xyz unless entity @e[type=marker,tag=gm4_ta_end_gateway,dx=0] run summon marker ~0.5 ~ ~0.5 {CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"]}
execute positioned ~-.3 ~256 ~.3 if block ~ ~-256 ~ minecraft:end_gateway align xyz unless entity @e[type=marker,tag=gm4_ta_end_gateway,dx=0] run summon marker ~0.5 ~ ~0.5 {CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"]}
execute positioned ~-.3 ~256 ~-.3 if block ~ ~-256 ~ minecraft:end_gateway align xyz unless entity @e[type=marker,tag=gm4_ta_end_gateway,dx=0] run summon marker ~0.5 ~ ~0.5 {CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"]}

execute positioned ~.3 ~256 ~.3 if block ~ ~-255 ~ minecraft:end_gateway align xyz unless entity @e[type=marker,tag=gm4_ta_end_gateway,dx=0] run summon marker ~0.5 ~1 ~0.5 {CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"]}
execute positioned ~.3 ~256 ~-.3 if block ~ ~-255 ~ minecraft:end_gateway align xyz unless entity @e[type=marker,tag=gm4_ta_end_gateway,dx=0] run summon marker ~0.5 ~1 ~0.5 {CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"]}
execute positioned ~-.3 ~256 ~.3 if block ~ ~-255 ~ minecraft:end_gateway align xyz unless entity @e[type=marker,tag=gm4_ta_end_gateway,dx=0] run summon marker ~0.5 ~1 ~0.5 {CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"]}
execute positioned ~-.3 ~256 ~-.3 if block ~ ~-255 ~ minecraft:end_gateway align xyz unless entity @e[type=marker,tag=gm4_ta_end_gateway,dx=0] run summon marker ~0.5 ~1 ~0.5 {CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"]}

execute positioned ~.3 ~256 ~.3 if block ~ ~-254.25 ~ minecraft:end_gateway align xyz unless entity @e[type=marker,tag=gm4_ta_end_gateway,dx=0] run summon marker ~0.5 ~1 ~0.5 {CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"]}
execute positioned ~.3 ~256 ~-.3 if block ~ ~-254.25 ~ minecraft:end_gateway align xyz unless entity @e[type=marker,tag=gm4_ta_end_gateway,dx=0] run summon marker ~0.5 ~1 ~0.5 {CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"]}
execute positioned ~-.3 ~256 ~.3 if block ~ ~-254.25 ~ minecraft:end_gateway align xyz unless entity @e[type=marker,tag=gm4_ta_end_gateway,dx=0] run summon marker ~0.5 ~1 ~0.5 {CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"]}
execute positioned ~-.3 ~256 ~-.3 if block ~ ~-254.25 ~ minecraft:end_gateway align xyz unless entity @e[type=marker,tag=gm4_ta_end_gateway,dx=0] run summon marker ~0.5 ~1 ~0.5 {CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"]}

tag @s[tag=gm4_ta_jammed,tag=!gm4_ta_teleported_player] add gm4_ta_gateway
execute if entity @s[tag=gm4_ta_jammed,tag=!gm4_ta_teleported_player] run function gm4_teleportation_anchors:player/jam_player
