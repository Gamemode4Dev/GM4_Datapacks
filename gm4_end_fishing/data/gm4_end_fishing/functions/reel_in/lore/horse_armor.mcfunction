#@s = item that is to gain lore
#run from reel_in/set_lore

execute if score @s gm4_ef_data matches 0..19 run data merge entity @s {Item:{tag:{display:{Lore:['"That\'s some good barding!"']}}}}
execute if score @s gm4_ef_data matches 20..39 run data merge entity @s {Item:{tag:{display:{Lore:['"There\'s a horse somewhere"','"that lost this armour"']}}}}
execute if score @s gm4_ef_data matches 40..59 run data merge entity @s {Item:{tag:{display:{Lore:['"Floating horses must be"','"a thing somewhere, right?"']}}}}
execute if score @s gm4_ef_data matches 60..79 run data merge entity @s {Item:{tag:{display:{Lore:['"Too bad there\'s no horse weapons"']}}}}
execute if score @s gm4_ef_data matches 80..99 run data merge entity @s {Item:{tag:{display:{Lore:['"Made by the finest materials known to man"']}}}}
