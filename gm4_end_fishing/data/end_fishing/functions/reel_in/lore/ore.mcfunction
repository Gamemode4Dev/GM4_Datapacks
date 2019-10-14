#@s = item that is to gain lore
#run from reel_in/set_lore

execute if score @s gm4_ef_data matches 0..19 run data merge entity @s {Item:{tag:{display:{Lore:['"The riches of the vast void"']}}}}
execute if score @s gm4_ef_data matches 20..29 run data merge entity @s {Item:{tag:{display:{Lore:['"Dropped from a nearby End City"']}}}}
execute if score @s gm4_ef_data matches 30..49 run data merge entity @s {Item:{tag:{display:{Lore:['"There\'s all this treasure waiting down there!"']}}}}
execute if score @s gm4_ef_data matches 50..59 run data merge entity @s {Item:{tag:{display:{Lore:['"Cursed by the ancient Goddess"']}}}}
execute if score @s gm4_ef_data matches 60..79 run data merge entity @s {Item:{tag:{display:{Lore:['"This isn\'t real, it\'s fake treasure"']}}}}
execute if score @s gm4_ef_data matches 80..99 run data merge entity @s {Item:{tag:{display:{Lore:['"Cha-Ching! We\'re going to be rich!"']}}}}
