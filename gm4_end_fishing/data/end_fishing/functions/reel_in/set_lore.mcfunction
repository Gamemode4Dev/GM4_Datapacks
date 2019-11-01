#@s = item that is to gain lore
#run from reel_in/reel_loot

execute store result score @s gm4_ef_data run data get entity @s UUIDMost 0.00000000023283064365386962890625
scoreboard players operation @s gm4_ef_data %= #100 gm4_ef_data

execute if entity @s[nbt={Item:{tag:{gm4_ef_lore:{id:"end_city_tool"}}}}] run function end_fishing:reel_in/lore/tool
execute if entity @s[nbt={Item:{tag:{gm4_ef_lore:{id:"end_city_sword"}}}}] run function end_fishing:reel_in/lore/sword
execute if entity @s[nbt={Item:{tag:{gm4_ef_lore:{id:"end_city_armor"}}}}] run function end_fishing:reel_in/lore/armor
execute if entity @s[nbt={Item:{tag:{gm4_ef_lore:{id:"end_city_horse_armor"}}}}] run function end_fishing:reel_in/lore/horse_armor
execute if entity @s[nbt={Item:{tag:{gm4_ef_lore:{id:"end_city_ore"}}}}] run function end_fishing:reel_in/lore/ore
data remove entity @s Item.tag.gm4_ef_lore
