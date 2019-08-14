#@s = nothing

#create solid ice
execute as @e[type=item,nbt={Item: {tag: {gm4_solid_ice: 1}}}] at @s if block ~ ~-.000000000000004 ~ ice run function solid_ice:ice_block/create

#remove broken solid ice
execute as @e[type=area_effect_cloud,tag=gm4_solid_ice] at @s if block ~ ~ ~ air run function solid_ice:ice_block/remove