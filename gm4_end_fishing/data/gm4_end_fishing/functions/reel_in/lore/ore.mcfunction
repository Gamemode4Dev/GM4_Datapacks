#@s = item that is to gain lore
#run from reel_in/set_lore

execute if score @s gm4_ef_data matches 0..19 run data merge entity @s {Item:{tag:{CustomModelData:10,display:{Lore:['{"translate":"%1$s%3427655$s","with":["The riches of the vast void",{"translate":"text.gm4.end_city_ore.1"}],"color":"dark_gray","italic":true}']}}}}
execute if score @s gm4_ef_data matches 20..29 run data merge entity @s {Item:{tag:{CustomModelData:11,display:{Lore:['{"translate":"%1$s%3427655$s","with":["Dropped from a nearby End City",{"translate":"text.gm4.end_city_ore.2"}],"color":"dark_gray","italic":true}']}}}}
execute if score @s gm4_ef_data matches 30..49 run data merge entity @s {Item:{tag:{CustomModelData:12,display:{Lore:['{"translate":"%1$s%3427655$s","with":["There\'s so much treasure down there!",{"translate":"text.gm4.end_city_ore.3"}],"color":"dark_gray","italic":true}']}}}}
execute if score @s gm4_ef_data matches 50..59 run data merge entity @s {Item:{tag:{CustomModelData:13,display:{Lore:['{"translate":"%1$s%3427655$s","with":["Cursed by the ancient Goddess",{"translate":"text.gm4.end_city_ore.4"}],"color":"dark_gray","italic":true}']}}}}
execute if score @s gm4_ef_data matches 60..79 run data merge entity @s {Item:{tag:{CustomModelData:14,display:{Lore:['{"translate":"%1$s%3427655$s","with":["This isn\'t real. It\'s fake treasure.",{"translate":"text.gm4.end_city_ore.5"}],"color":"dark_gray","italic":true}']}}}}
execute if score @s gm4_ef_data matches 80..99 run data merge entity @s {Item:{tag:{CustomModelData:15,display:{Lore:['{"translate":"%1$s%3427655$s","with":["Cha-Ching! We\'re going to be rich!",{"translate":"text.gm4.end_city_ore.6"}],"color":"dark_gray","italic":true}']}}}}
