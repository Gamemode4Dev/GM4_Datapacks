# run from #liquid_tanks:item_fill
# @s = tank being processed

scoreboard players set $item_value gm4_lt_value -1
loot replace entity @e[type=armor_stand,tag=gm4_liquid_tank_stand,limit=1,sort=nearest,distance=..1] weapon.mainhand loot gm4_lightning_in_a_bottle:items/bottle_of_lightning
data modify storage gm4_liquid_tanks:temp/tank output set from entity @e[type=armor_stand,tag=gm4_liquid_tank_stand,limit=1,sort=nearest,distance=..1] HandItems[0]
item replace entity @e[type=armor_stand,tag=gm4_liquid_tank_stand,limit=1,sort=nearest,distance=..1] weapon.mainhand with air
function gm4_liquid_tanks:smart_item_fill
tag @s add gm4_lt_fill
