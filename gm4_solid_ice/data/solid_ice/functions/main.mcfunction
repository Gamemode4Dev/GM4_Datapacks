#@s = nothing

#create solid ice
execute as @e[type=item,nbt={Item: {Count:1b, tag: {gm4_solid_ice: 1}}}] at @s unless entity @e[distance=..0.866025,type=area_effect_cloud,tag=gm4_solid_ice] if block ~ ~-.00000000000001 ~ ice run function solid_ice:ice_block/create

#remove broken solid ice
execute as @e[type=area_effect_cloud,tag=gm4_solid_ice] at @s unless block ~ ~ ~ water[level=0] unless block ~ ~ ~ ice run function solid_ice:ice_block/remove
