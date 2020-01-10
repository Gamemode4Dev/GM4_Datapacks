#@s = item that is to gain lore
#run from reel_in/set_lore

execute if score @s gm4_ef_data matches 0..9 run data merge entity @s {Item:{tag:{display:{Lore:['"It\'s been said only those"','"who are worthy can wield this tool"']}}}}
execute if score @s gm4_ef_data matches 10..19 run data merge entity @s {Item:{tag:{display:{Lore:['"Once there was a man named"','"Tubal-cain who made this tool"']}}}}
execute if score @s gm4_ef_data matches 20..29 run data merge entity @s {Item:{tag:{display:{Lore:['"If found please return to Hephaestus"']}}}}
execute if score @s gm4_ef_data matches 30..39 run data merge entity @s {Item:{tag:{display:{Lore:['"This is actually a really hard"','"piece of bread, don\'t tell anyone"']}}}}
execute if score @s gm4_ef_data matches 40..49 run data merge entity @s {Item:{tag:{display:{Lore:['"Found in the Valley of the Fallen Kings"']}}}}
execute if score @s gm4_ef_data matches 50..59 run data merge entity @s {Item:{tag:{display:{Lore:['"Throw it, maybe it\'ll come back!"','"No it\'s not a hammer sadly"']}}}}
execute if score @s gm4_ef_data matches 60..69 run data merge entity @s {Item:{tag:{display:{Lore:['"Thunk, Thunk, Thunk!"']}}}}
execute if score @s gm4_ef_data matches 70..89 run data merge entity @s {Item:{tag:{display:{Lore:['"Forged by the Leader of"','"the Endermen Rebellion"']}}}}
execute if score @s gm4_ef_data matches 80..89 run data merge entity @s {Item:{tag:{display:{Lore:['"It\'s not a very good shield"']}}}}
execute if score @s gm4_ef_data matches 90..99 run data merge entity @s {Item:{tag:{display:{Lore:['"Where\'d you find this? It\'s been"','"floating in the end for over a decade!"']}}}}
