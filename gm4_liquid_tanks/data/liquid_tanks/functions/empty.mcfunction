#@s = liquid tank
#run from liquid_tanks:liquid_value_update

scoreboard players set @s gm4_lt_value 0
kill @e[type=armor_stand,tag=gm4_liquid_tank_display,distance=..0.5]
data merge block ~ ~ ~ {CustomName:"\"Empty Tank\""}
function #liquid_tanks:remove_liquid_tags
tag @s add gm4_lt_empty
