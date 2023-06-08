# updates gui of old liquid tanks
# @s = liquid_tank marker
# located at @s
# run from gm4_liquid_tanks:item_process

execute positioned ~ ~-0.75 ~ run tag @e[type=armor_stand,tag=gm4_liquid_tank_display,distance=..0.3,limit=1] add gm4_lt_keep
function #gm4_liquid_tanks:tank_init

execute positioned ~ ~-0.75 ~ run kill @e[type=armor_stand,tag=gm4_liquid_tank_display,tag=!gm4_lt_keep,distance=..0.3,limit=1]
tag @e[type=armor_stand,tag=gm4_liquid_tank_display,distance=..3] remove gm4_lt_keep

execute unless block ~ ~ ~ hopper{CustomName:'{"translate":"block.gm4.liquid_tank.empty","fallback":"Empty Tank"}'} run tag @s remove gm4_upgraded_liquid_tank
