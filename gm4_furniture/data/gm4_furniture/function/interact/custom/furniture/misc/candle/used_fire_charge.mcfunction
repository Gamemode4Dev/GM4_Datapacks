# fire charge use logic
# @s = player who ignited candle
# at @s
# run from interact/detect

scoreboard players reset $ignited_candle gm4_furniture_data

# sound
playsound minecraft:item.firecharge.use player @a[distance=..16]

# return if creative
execute if entity @s[gamemode=creative] run return 1

# use item
item modify entity @s weapon.mainhand {function:"minecraft:set_count",count:-1,add:1b}
