# fire charge use logic
# @s = player who ignited candle
# at @s
# run from mechanics/interactions/candle/find_igniter

# sound
playsound minecraft:item.firecharge.use player @a[distance=..16]

# return if creative
execute if entity @s[gamemode=creative] run return 1

# use item
item modify entity @s weapon.offhand {function:"minecraft:set_count",count:-1,add:1b}
