# @s = player who just entered an end gateway
# run from advancement "enter_end_gateway"

advancement revoke @s only gm4_teleportation_anchors:enter_end_gateway

# spawn end gateway markers
execute positioned ~.3 ~256 ~.3 if block ~ ~-256 ~ minecraft:end_gateway align xyz unless entity @e[type=area_effect_cloud,tag=gm4_ta_end_gateway,dx=0] run summon area_effect_cloud ~0.5 ~ ~0.5 {Radius:0f,Age:-2147483648,Duration:2147483647,CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"],Particle:"block air"}
execute positioned ~.3 ~256 ~-.3 if block ~ ~-256 ~ minecraft:end_gateway align xyz unless entity @e[type=area_effect_cloud,tag=gm4_ta_end_gateway,dx=0] run summon area_effect_cloud ~0.5 ~ ~0.5 {Radius:0f,Age:-2147483648,Duration:2147483647,CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"],Particle:"block air"}
execute positioned ~-.3 ~256 ~.3 if block ~ ~-256 ~ minecraft:end_gateway align xyz unless entity @e[type=area_effect_cloud,tag=gm4_ta_end_gateway,dx=0] run summon area_effect_cloud ~0.5 ~ ~0.5 {Radius:0f,Age:-2147483648,Duration:2147483647,CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"],Particle:"block air"}
execute positioned ~-.3 ~256 ~-.3 if block ~ ~-256 ~ minecraft:end_gateway align xyz unless entity @e[type=area_effect_cloud,tag=gm4_ta_end_gateway,dx=0] run summon area_effect_cloud ~0.5 ~ ~0.5 {Radius:0f,Age:-2147483648,Duration:2147483647,CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"],Particle:"block air"}

execute positioned ~.3 ~256 ~.3 if block ~ ~-255 ~ minecraft:end_gateway align xyz unless entity @e[type=area_effect_cloud,tag=gm4_ta_end_gateway,dx=0] run summon area_effect_cloud ~0.5 ~1 ~0.5 {Radius:0f,Age:-2147483648,Duration:2147483647,CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"],Particle:"block air"}
execute positioned ~.3 ~256 ~-.3 if block ~ ~-255 ~ minecraft:end_gateway align xyz unless entity @e[type=area_effect_cloud,tag=gm4_ta_end_gateway,dx=0] run summon area_effect_cloud ~0.5 ~1 ~0.5 {Radius:0f,Age:-2147483648,Duration:2147483647,CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"],Particle:"block air"}
execute positioned ~-.3 ~256 ~.3 if block ~ ~-255 ~ minecraft:end_gateway align xyz unless entity @e[type=area_effect_cloud,tag=gm4_ta_end_gateway,dx=0] run summon area_effect_cloud ~0.5 ~1 ~0.5 {Radius:0f,Age:-2147483648,Duration:2147483647,CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"],Particle:"block air"}
execute positioned ~-.3 ~256 ~-.3 if block ~ ~-255 ~ minecraft:end_gateway align xyz unless entity @e[type=area_effect_cloud,tag=gm4_ta_end_gateway,dx=0] run summon area_effect_cloud ~0.5 ~1 ~0.5 {Radius:0f,Age:-2147483648,Duration:2147483647,CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"],Particle:"block air"}

execute positioned ~.3 ~256 ~.3 if block ~ ~-254.25 ~ minecraft:end_gateway align xyz unless entity @e[type=area_effect_cloud,tag=gm4_ta_end_gateway,dx=0] run summon area_effect_cloud ~0.5 ~1 ~0.5 {Radius:0f,Age:-2147483648,Duration:2147483647,CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"],Particle:"block air"}
execute positioned ~.3 ~256 ~-.3 if block ~ ~-254.25 ~ minecraft:end_gateway align xyz unless entity @e[type=area_effect_cloud,tag=gm4_ta_end_gateway,dx=0] run summon area_effect_cloud ~0.5 ~1 ~0.5 {Radius:0f,Age:-2147483648,Duration:2147483647,CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"],Particle:"block air"}
execute positioned ~-.3 ~256 ~.3 if block ~ ~-254.25 ~ minecraft:end_gateway align xyz unless entity @e[type=area_effect_cloud,tag=gm4_ta_end_gateway,dx=0] run summon area_effect_cloud ~0.5 ~1 ~0.5 {Radius:0f,Age:-2147483648,Duration:2147483647,CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"],Particle:"block air"}
execute positioned ~-.3 ~256 ~-.3 if block ~ ~-254.25 ~ minecraft:end_gateway align xyz unless entity @e[type=area_effect_cloud,tag=gm4_ta_end_gateway,dx=0] run summon area_effect_cloud ~0.5 ~1 ~0.5 {Radius:0f,Age:-2147483648,Duration:2147483647,CustomName:'"End Gateway"',Tags:["gm4_ta_end_gateway"],Particle:"block air"}

tag @s[tag=gm4_ta_jammed,tag=!gm4_ta_teleported_player] add gm4_ta_gateway
execute if entity @s[tag=gm4_ta_jammed,tag=!gm4_ta_teleported_player] run function gm4_teleportation_anchors:player/jam_player
