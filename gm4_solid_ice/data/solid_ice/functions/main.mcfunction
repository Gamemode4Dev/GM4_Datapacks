#@s = nothing

#create solid ice
execute as @e[type=item,nbt={Item: {Count:1b, tag: {gm4_solid_ice: 1}}}] at @s unless entity @e[distance=..0.866025,type=area_effect_cloud,tag=gm4_solid_ice] if block ~ ~-.0000000000001 ~ ice run function solid_ice:ice_block/create

#remove broken solid ice
execute as @e[type=area_effect_cloud,tag=gm4_solid_ice] at @s unless block ~ ~ ~ water[level=0] unless block ~ ~ ~ ice run function solid_ice:ice_block/remove

#repair broken items
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",tag:{SkullOwner:{Id:"907b3257-ca9a-44d3-9987-003bc32be262"}}}}] unless entity @s[nbt={Item:{tag:{gm4_solid_ice:1}}}] run data merge entity @s {Item: {tag:{display:{Lore:['{"translate":"%1$s%3427655$s","with":["Im so cold", {"translate": "item.gm4.cooling_element.lore"}],"italic":false}'],Name:'{"translate":"%1$s%3427655$s","with":["Cooling Element",{"translate":"item.gm4.cooling_element"}],"italic":false,"color":"aqua"}'},gm4_solid_ice:1}}}
