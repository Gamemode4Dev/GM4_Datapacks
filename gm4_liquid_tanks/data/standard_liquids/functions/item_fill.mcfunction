#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

execute if score @s gm4_lt_value matches 1.. run function standard_liquids:item_fill/singles
