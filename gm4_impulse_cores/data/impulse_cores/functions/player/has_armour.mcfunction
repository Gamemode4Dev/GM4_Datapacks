#processes for players holding an impulse core with enchanted iron armour equipped
#@s - players with an impulse core and enchanted iron armour
#called by impulse_cores:player/holding_impulse_core

#audiovisuals
particle minecraft:enchanted_hit ~ ~1 ~ .5 .5 .5 .25 3 normal @a

#give effects
execute unless score @s gm4_ic_chrg_use matches 1.. run function impulse_cores:player/effects/check_charge
