#@s = tank stand being looked at
#run from standard_liquids:level_report_check

#checks adjacent blocks and summons corresponding area_effect_clouds
execute positioned ~ ~1 ~ run kill @e[type=area_effect_cloud,distance=..0.5,tag=gm4_lt_util_block]

#cauldron
execute if block ~-1 ~ ~ #minecraft:cauldrons run summon area_effect_cloud ~ ~1 ~ {CustomName:'"gm4_lt_util_block"',Tags:["gm4_lt_util_block","gm4_ltu_west","gm4_ltu_cauldron"],Rotation:[90.0f,0.0f],Radius:0,Duration:2147483647}
execute if block ~1 ~ ~ #minecraft:cauldrons run summon area_effect_cloud ~ ~1 ~ {CustomName:'"gm4_lt_util_block"',Tags:["gm4_lt_util_block","gm4_ltu_east","gm4_ltu_cauldron"],Rotation:[-90.0f,0.0f],Radius:0,Duration:2147483647}
execute if block ~ ~ ~-1 #minecraft:cauldrons run summon area_effect_cloud ~ ~1 ~ {CustomName:'"gm4_lt_util_block"',Tags:["gm4_lt_util_block","gm4_ltu_north","gm4_ltu_cauldron"],Rotation:[180.0f,0.0f],Radius:0,Duration:2147483647}
execute if block ~ ~ ~1 #minecraft:cauldrons run summon area_effect_cloud ~ ~1 ~ {CustomName:'"gm4_lt_util_block"',Tags:["gm4_lt_util_block","gm4_ltu_south","gm4_ltu_cauldron"],Rotation:[0.0f,0.0f],Radius:0,Duration:2147483647}

execute if block ~ ~1 ~ #minecraft:cauldrons run summon area_effect_cloud ~ ~1 ~ {CustomName:'"gm4_lt_util_block"',Tags:["gm4_lt_util_block","gm4_ltu_dripstone_cauldron"],Rotation:[0.0f,-90.0f],Radius:0,Duration:2147483647}

#furnace
execute if block ~-1 ~ ~ #gm4_standard_liquids:furnace run summon area_effect_cloud ~ ~1 ~ {CustomName:'"gm4_lt_util_block"',Tags:["gm4_lt_util_block","gm4_ltu_west","gm4_ltu_furnace"],Rotation:[90.0f,0.0f],Radius:0,Duration:2147483647}
execute if block ~1 ~ ~ #gm4_standard_liquids:furnace run summon area_effect_cloud ~ ~1 ~ {CustomName:'"gm4_lt_util_block"',Tags:["gm4_lt_util_block","gm4_ltu_east","gm4_ltu_furnace"],Rotation:[-90.0f,0.0f],Radius:0,Duration:2147483647}
execute if block ~ ~ ~-1 #gm4_standard_liquids:furnace run summon area_effect_cloud ~ ~1 ~ {CustomName:'"gm4_lt_util_block"',Tags:["gm4_lt_util_block","gm4_ltu_north","gm4_ltu_furnace"],Rotation:[180.0f,0.0f],Radius:0,Duration:2147483647}
execute if block ~ ~ ~1 #gm4_standard_liquids:furnace run summon area_effect_cloud ~ ~1 ~ {CustomName:'"gm4_lt_util_block"',Tags:["gm4_lt_util_block","gm4_ltu_south","gm4_ltu_furnace"],Rotation:[0.0f,0.0f],Radius:0,Duration:2147483647}
