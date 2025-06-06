# calculates damage for flint and steel
# @s = player
# run from mechanics/interactions/light_candle/interact_rcd

# sound
playsound minecraft:item.flintandsteel.use player @a[distance=..16]

# return if creative
execute if entity @s[gamemode=creative] run return 1

# damage
execute store result score $level gm4_llp.data run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:unbreaking"
scoreboard players add $level gm4_llp.data 1
scoreboard players set $chance gm4_llp.data 100
scoreboard players operation $chance gm4_llp.data /= $level gm4_llp.data
execute store result score $rand gm4_llp.data run random value 1..100
execute if score $rand gm4_llp.data < $chance gm4_llp.data run item modify entity @s weapon.mainhand {"function":"minecraft:set_damage","damage":-0.0205,"add":true}
