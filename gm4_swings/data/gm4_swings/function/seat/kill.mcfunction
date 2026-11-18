# Kills a swing seat and its constituent parts
# @s = Item display, swing seat
# at @s
# run from gm4_swings:on_join
# run from gm4_swings:swing/kill

execute on passengers if entity @s[type=minecraft:interaction] run kill @s
kill @s
