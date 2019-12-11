#@s = item that is to gain lore
#run from reel_in/set_lore

execute if score @s gm4_ef_data matches 0..9 run data merge entity @s {Item:{tag:{display:{Lore:['"Lost on End City moving day"']}}}}
execute if score @s gm4_ef_data matches 10..19 run data merge entity @s {Item:{tag:{display:{Lore:['"Forged by Seppo Ilmarinen"']}}}}
execute if score @s gm4_ef_data matches 20..29 run data merge entity @s {Item:{tag:{display:{Lore:['"Belongs to Achilles"']}}}}
execute if score @s gm4_ef_data matches 30..39 run data merge entity @s {Item:{tag:{display:{Lore:['"Made by Wayland the Smith"']}}}}
execute if score @s gm4_ef_data matches 40..49 run data merge entity @s {Item:{tag:{display:{Lore:['"Worn during the battle of Ender Ender"']}}}}
execute if score @s gm4_ef_data matches 50..59 run data merge entity @s {Item:{tag:{display:{Lore:['"This thing\'s been rotting in"','"the void for at least a century"']}}}}
execute if score @s gm4_ef_data matches 60..69 run data merge entity @s {Item:{tag:{display:{Lore:['"Passed down over many generation"']}}}}
execute if score @s gm4_ef_data matches 70..89 run data merge entity @s {Item:{tag:{display:{Lore:['"Wear this to become invisible to nobody!"']}}}}
execute if score @s gm4_ef_data matches 80..89 run data merge entity @s {Item:{tag:{display:{Lore:['"I promise you can fly while wearing this"','"Trust me, just jump into the void"']}}}}
execute if score @s gm4_ef_data matches 90..99 run data merge entity @s {Item:{tag:{display:{Lore:['"With this you shall be immortal!"','"Or is it mortal? I can\'t remember"']}}}}
