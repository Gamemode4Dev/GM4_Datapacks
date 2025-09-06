# finds igniter player used to light candle and processes the feedback
# @s = player who ignited candle
# at @s
# run from interact/detect

scoreboard players reset $ignited_candle gm4_furniture_data

execute if score $mainhand_candle_igniter gm4_furniture_data matches 1 if items entity @s weapon.mainhand fire_charge run function gm4_furniture:interact/custom/furniture/misc/candle/used_mainhand_fire_charge
execute if score $mainhand_candle_igniter gm4_furniture_data matches 1 if items entity @s weapon.mainhand flint_and_steel run function gm4_furniture:interact/custom/furniture/misc/candle/used_mainhand_flint_and_steel
execute if score $offhand_candle_igniter gm4_furniture_data matches 1 if items entity @s weapon.offhand fire_charge run function gm4_furniture:interact/custom/furniture/misc/candle/used_offhand_fire_charge
execute if score $offhand_candle_igniter gm4_furniture_data matches 1 if items entity @s weapon.offhand flint_and_steel run function gm4_furniture:interact/custom/furniture/misc/candle/used_offhand_flint_and_steel
