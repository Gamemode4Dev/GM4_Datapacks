#@s = liquid tank
#run from liquid_tanks:liquid_value_update

scoreboard players set @s gm4_lt_value 0
execute positioned ~ ~-0.5 ~ run kill @e[type=armor_stand,tag=gm4_liquid_tank_display,distance=..0.5]
data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Empty Tank",{"translate":"container.gm4.liquid_tank.empty"}]}'}
data modify entity @s data.gm4_liquid_tanks.liquid_tag set value "empty"
function #gm4_liquid_tanks:remove_liquid_tags
tag @s add gm4_lt_empty
