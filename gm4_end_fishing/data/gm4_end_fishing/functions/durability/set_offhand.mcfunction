#@s = player who reeled in the armor stand w/ unbreaking fishing rod in offhand
#run from pulse_check

scoreboard players operation damage gm4_ef_data = @s gm4_ef_data
execute store result score unbreaking gm4_ef_data run data get entity @s Inventory[{Slot:-106b}].tag.Enchantments[{id:"minecraft:unbreaking"}].lvl
function end_fishing:durability/calc_unbreaking
execute store result entity @s Inventory[{Slot:-106b}].tag.Damage int 1 run scoreboard players get damage gm4_ef_data
scoreboard players reset @s gm4_ef_data
scoreboard players reset durability gm4_ef_data
tag @s remove gm4_ef_looted
tag @s remove gm4_ef_durability
tag @s remove gm4_ef_durability_off
