#@s = item that is to gain lore
#run from reel_in/set_lore

execute if score @s gm4_ef_data matches 0..19 run data merge entity @s {Item:{tag:{CustomModelData:10,display:{Lore:['{"translate":"%1$s%3427655$s","with":["That\'s some good barding!",{"translate":"text.gm4.end_city_horse_armor.1"}]}']}}}}
execute if score @s gm4_ef_data matches 20..39 run data merge entity @s {Item:{tag:{CustomModelData:11,display:{Lore:['{"translate":"%1$s%3427655$s","with":["There\'s a horse somewhere",{"translate":"text.gm4.end_city_horse_armor.2.1"}]}','{"translate":"%1$s%3427655$s","with":["that lost this armour.",{"translate":"text.gm4.end_city_horse_armor.2.2"}]}']}}}}
execute if score @s gm4_ef_data matches 40..59 run data merge entity @s {Item:{tag:{CustomModelData:12,display:{Lore:['{"translate":"%1$s%3427655$s","with":["Floating horses must be",{"translate":"text.gm4.end_city_horse_armor.3.1"}]}','{"translate":"%1$s%3427655$s","with":["a thing somewhere, right?",{"translate":"text.gm4.end_city_horse_armor.3.2"}]}']}}}}
execute if score @s gm4_ef_data matches 60..79 run data merge entity @s {Item:{tag:{CustomModelData:13,display:{Lore:['{"translate":"%1$s%3427655$s","with":["Too bad there\'s no horse weapons.",{"translate":"text.gm4.end_city_horse_armor.4"}]}']}}}}
execute if score @s gm4_ef_data matches 80..99 run data merge entity @s {Item:{tag:{CustomModelData:14,display:{Lore:['{"translate":"%1$s%3427655$s","with":["Made with the finest materials known to man",{"translate":"text.gm4.end_city_horse_armor.5"}]}']}}}}
