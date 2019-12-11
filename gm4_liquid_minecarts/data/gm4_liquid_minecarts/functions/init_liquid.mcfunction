#@s = empty liquid minecart next to a liquid tank pointed at it containing liquid
#run from liquid_minecarts:try_to_unload

data modify entity @s CustomName set from block ~ ~ ~ CustomName
data modify entity @e[type=armor_stand,tag=gm4_liquid_minecart_display,limit=1,sort=nearest] HandItems[0] set from entity @e[type=armor_stand,tag=gm4_liquid_tank_display,limit=1,sort=nearest] ArmorItems[3]
data modify entity @s Tags set from entity @e[type=armor_stand,tag=gm4_liquid_tank,limit=1,sort=nearest] Tags
tag @s remove gm4_lt_idle
tag @s remove gm4_lt_drain
tag @s remove gm4_lt_fill
tag @s remove gm4_liquid_tank
tag @s add gm4_liquid_minecart

#set tank max based on 40% of hopper max
scoreboard players operation @s gm4_lt_max = @e[type=armor_stand,tag=gm4_liquid_tank,limit=1,sort=nearest] gm4_lt_max
scoreboard players operation @s gm4_lt_max /= #5 gm4_lm_data
scoreboard players operation @s gm4_lt_max *= #2 gm4_lm_data

#fill the tank
function liquid_minecarts:load_liquid
