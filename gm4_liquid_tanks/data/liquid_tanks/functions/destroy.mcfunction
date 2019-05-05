#@s = liquid tank not in hopper
#run from main

summon item ~ ~.6 ~ {Item:{id:"glass",Count:1b},Passengers:[{id:"item",Item:{id:"hopper",Count:1b}},{id:"item",Item:{id:"dispenser",Count:1b}},{id:"item",Item:{id:"bucket",Count:1b}},{id:"item",Item:{id:"iron_trapdoor",Count:1b}},{id:"item",Item:{id:"comparator",Count:1b}}]}
data remove entity @e[type=item,limit=1,sort=nearest,distance=..4,nbt={Item:{id:"minecraft:hopper"}}] Item.tag.display
particle block glass ~ ~1 ~ .1 .25 .1 .05 30 normal @a
kill @e[type=armor_stand,tag=gm4_liquid_tank_display,distance=..0.5]
execute positioned ~ ~1 ~ run kill @e[type=area_effect_cloud,distance=..0.5,tag=gm4_lt_util_block]
kill @s
