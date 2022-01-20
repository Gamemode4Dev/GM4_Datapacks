# destroys the liquid_tank
# @s = liquid_tank marker
# located at @s
# run from gm4_liquid_tanks:machine/verify_destroy

# kill entities related to machine block
execute positioned ~ ~-0.5 ~ run kill @e[type=armor_stand,tag=gm4_liquid_tank_stand,limit=1,distance=..0.01]
execute positioned ~ ~-0.75 ~ run kill @e[type=armor_stand,tag=gm4_liquid_tank_display,distance=..0.3,limit=1]
execute positioned ~ ~0.5 ~ run kill @e[type=area_effect_cloud,distance=..0.5,tag=gm4_lt_util_block]
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:hopper",Count:1b,tag:{display:{}}}},limit=1,sort=nearest]
kill @s


# drop item (unless broken in creative mode)
particle block glass ~ ~0.5 ~ .1 .25 .1 .05 30 normal @a
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_liquid_tanks:items/liquid_tank
