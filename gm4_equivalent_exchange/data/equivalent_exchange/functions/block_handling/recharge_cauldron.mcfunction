#@s = transmutation stone item with recharge cauldron multi-block structure
#Run from main

tag @s add gm4_ee_charge_stone

#check and store charge of transmutation stone
execute store result score @s gm4_ee_charge run data get entity @s Item.tag.gm4_transmutation_charge

particle minecraft:cloud ~ ~0.3 ~ 0 0.2 0 0.01 8 normal

#slow timer
scoreboard players add @s gm4_ee_time 1
execute if score @s gm4_ee_time matches 16.. run function equivalent_exchange:recharge/slow_timer

data merge entity @s {Age:0s}

tag @s remove gm4_ee_charge_stone