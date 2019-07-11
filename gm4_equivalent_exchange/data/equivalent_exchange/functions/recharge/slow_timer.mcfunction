#@s = alchemical_crafter armor stand OR transmutation stone item
#run from block_handling/recharge_altar OR block_handling/recharge_cauldron

execute unless score @s gm4_ee_charge matches 100.. run function equivalent_exchange:recharge/check_charge

#resets after the funtion ran
scoreboard players reset @s gm4_ee_time
