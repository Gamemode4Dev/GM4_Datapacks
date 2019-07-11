#@s = player attacking with a trasmutation stone in their hand
#Run from pulse_check

execute store result score @s gm4_ee_charge run data get entity @s SelectedItem.tag.gm4_transmutation_charge

execute if score @s gm4_ee_charge matches 20.. run function equivalent_exchange:mobs/check_mob

scoreboard players reset @a[scores={gm4_ee_charge=0..}] gm4_ee_charge
