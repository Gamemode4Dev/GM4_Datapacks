#@s = liquid tank not in hopper
#run from main

loot spawn ~ ~.6 ~ loot gm4_liquid_tanks:destroy_liquid_tank
data remove entity @e[type=item,limit=1,sort=nearest,distance=..4,nbt={Item:{id:"minecraft:hopper"}}] Item.tag.display
particle block glass ~ ~1 ~ .1 .25 .1 .05 30 normal @a
kill @e[type=armor_stand,tag=gm4_liquid_tank_display,distance=..0.5]
execute positioned ~ ~1 ~ run kill @e[type=area_effect_cloud,distance=..0.5,tag=gm4_lt_util_block]
kill @s
