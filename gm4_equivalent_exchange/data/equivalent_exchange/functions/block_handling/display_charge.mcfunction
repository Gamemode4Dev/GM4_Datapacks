#@s = player holding a trasmutation stone in their hand
#Run from main

execute store result score @s gm4_ee_charge run data get entity @s SelectedItem.tag.gm4_transmutation_charge
title @s actionbar ["",{"text":"Charge: ","color":"dark_gray"},{"score":{"name":"@s","objective":"gm4_ee_charge"},"color":"blue"},{"text":"%","color":"blue"}]
scoreboard players reset @a[scores={gm4_ee_charge=0..}] gm4_ee_charge