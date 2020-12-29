#@s = item that is to gain lore
#run from reel_in/set_lore

execute if score @s gm4_ef_data matches 0..99 run data merge entity @s {Item:{tag:{CustomModelData:10,display:{Lore:['{"translate":"%1$s%3427655$s","with":["Nobody thought the Captain\'s lost wings",{"translate":"text.gm4.end_ship_elytra.10.1"}]}','{"translate":"%1$s%3427655$s","with":["would be seen again, ever.",{"translate":"text.gm4.end_ship_elytra.1.2"}]}']}}}}
