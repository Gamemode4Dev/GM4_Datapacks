# transform color value from decimal to hex
# @s = furniture main interaction entity
# at @s
# run from break/destroy

data modify storage gm4_furniture:temp color_hex set value {}

scoreboard players operation $red gm4_furniture_data = $furniture_color gm4_furniture_data
scoreboard players operation $red gm4_furniture_data /= #65536 gm4_furniture_data
scoreboard players operation $add_digit gm4_furniture_data = $red gm4_furniture_data
scoreboard players operation $add_digit gm4_furniture_data /= #16 gm4_furniture_data
execute if score $add_digit gm4_furniture_data matches 0..9 store result storage gm4_furniture:temp color_hex.red_1 int 1 run scoreboard players get $add_digit gm4_furniture_data
execute if score $add_digit gm4_furniture_data matches 10 run data modify storage gm4_furniture:temp color_hex.red_1 set value "A"
execute if score $add_digit gm4_furniture_data matches 11 run data modify storage gm4_furniture:temp color_hex.red_1 set value "B"
execute if score $add_digit gm4_furniture_data matches 12 run data modify storage gm4_furniture:temp color_hex.red_1 set value "C"
execute if score $add_digit gm4_furniture_data matches 13 run data modify storage gm4_furniture:temp color_hex.red_1 set value "D"
execute if score $add_digit gm4_furniture_data matches 14 run data modify storage gm4_furniture:temp color_hex.red_1 set value "E"
execute if score $add_digit gm4_furniture_data matches 15 run data modify storage gm4_furniture:temp color_hex.red_1 set value "F"
scoreboard players operation $add_digit gm4_furniture_data = $red gm4_furniture_data
scoreboard players operation $add_digit gm4_furniture_data %= #16 gm4_furniture_data
execute if score $add_digit gm4_furniture_data matches 0..9 store result storage gm4_furniture:temp color_hex.red_2 int 1 run scoreboard players get $add_digit gm4_furniture_data
execute if score $add_digit gm4_furniture_data matches 10 run data modify storage gm4_furniture:temp color_hex.red_2 set value "A"
execute if score $add_digit gm4_furniture_data matches 11 run data modify storage gm4_furniture:temp color_hex.red_2 set value "B"
execute if score $add_digit gm4_furniture_data matches 12 run data modify storage gm4_furniture:temp color_hex.red_2 set value "C"
execute if score $add_digit gm4_furniture_data matches 13 run data modify storage gm4_furniture:temp color_hex.red_2 set value "D"
execute if score $add_digit gm4_furniture_data matches 14 run data modify storage gm4_furniture:temp color_hex.red_2 set value "E"
execute if score $add_digit gm4_furniture_data matches 15 run data modify storage gm4_furniture:temp color_hex.red_2 set value "F"

scoreboard players operation $green gm4_furniture_data = $furniture_color gm4_furniture_data
scoreboard players operation $green gm4_furniture_data /= #256 gm4_furniture_data
scoreboard players operation $green gm4_furniture_data %= #256 gm4_furniture_data
scoreboard players operation $add_digit gm4_furniture_data = $green gm4_furniture_data
scoreboard players operation $add_digit gm4_furniture_data /= #16 gm4_furniture_data
execute if score $add_digit gm4_furniture_data matches 0..9 store result storage gm4_furniture:temp color_hex.green_1 int 1 run scoreboard players get $add_digit gm4_furniture_data
execute if score $add_digit gm4_furniture_data matches 10 run data modify storage gm4_furniture:temp color_hex.green_1 set value "A"
execute if score $add_digit gm4_furniture_data matches 11 run data modify storage gm4_furniture:temp color_hex.green_1 set value "B"
execute if score $add_digit gm4_furniture_data matches 12 run data modify storage gm4_furniture:temp color_hex.green_1 set value "C"
execute if score $add_digit gm4_furniture_data matches 13 run data modify storage gm4_furniture:temp color_hex.green_1 set value "D"
execute if score $add_digit gm4_furniture_data matches 14 run data modify storage gm4_furniture:temp color_hex.green_1 set value "E"
execute if score $add_digit gm4_furniture_data matches 15 run data modify storage gm4_furniture:temp color_hex.green_1 set value "F"
scoreboard players operation $add_digit gm4_furniture_data = $green gm4_furniture_data
scoreboard players operation $add_digit gm4_furniture_data %= #16 gm4_furniture_data
execute if score $add_digit gm4_furniture_data matches 0..9 store result storage gm4_furniture:temp color_hex.green_2 int 1 run scoreboard players get $add_digit gm4_furniture_data
execute if score $add_digit gm4_furniture_data matches 10 run data modify storage gm4_furniture:temp color_hex.green_2 set value "A"
execute if score $add_digit gm4_furniture_data matches 11 run data modify storage gm4_furniture:temp color_hex.green_2 set value "B"
execute if score $add_digit gm4_furniture_data matches 12 run data modify storage gm4_furniture:temp color_hex.green_2 set value "C"
execute if score $add_digit gm4_furniture_data matches 13 run data modify storage gm4_furniture:temp color_hex.green_2 set value "D"
execute if score $add_digit gm4_furniture_data matches 14 run data modify storage gm4_furniture:temp color_hex.green_2 set value "E"
execute if score $add_digit gm4_furniture_data matches 15 run data modify storage gm4_furniture:temp color_hex.green_2 set value "F"

scoreboard players operation $blue gm4_furniture_data = $furniture_color gm4_furniture_data
scoreboard players operation $blue gm4_furniture_data %= #256 gm4_furniture_data
scoreboard players operation $add_digit gm4_furniture_data = $blue gm4_furniture_data
scoreboard players operation $add_digit gm4_furniture_data /= #16 gm4_furniture_data
execute if score $add_digit gm4_furniture_data matches 0..9 store result storage gm4_furniture:temp color_hex.blue_1 int 1 run scoreboard players get $add_digit gm4_furniture_data
execute if score $add_digit gm4_furniture_data matches 10 run data modify storage gm4_furniture:temp color_hex.blue_1 set value "A"
execute if score $add_digit gm4_furniture_data matches 11 run data modify storage gm4_furniture:temp color_hex.blue_1 set value "B"
execute if score $add_digit gm4_furniture_data matches 12 run data modify storage gm4_furniture:temp color_hex.blue_1 set value "C"
execute if score $add_digit gm4_furniture_data matches 13 run data modify storage gm4_furniture:temp color_hex.blue_1 set value "D"
execute if score $add_digit gm4_furniture_data matches 14 run data modify storage gm4_furniture:temp color_hex.blue_1 set value "E"
execute if score $add_digit gm4_furniture_data matches 15 run data modify storage gm4_furniture:temp color_hex.blue_1 set value "F"
scoreboard players operation $add_digit gm4_furniture_data = $blue gm4_furniture_data
scoreboard players operation $add_digit gm4_furniture_data %= #16 gm4_furniture_data
execute if score $add_digit gm4_furniture_data matches 0..9 store result storage gm4_furniture:temp color_hex.blue_2 int 1 run scoreboard players get $add_digit gm4_furniture_data
execute if score $add_digit gm4_furniture_data matches 10 run data modify storage gm4_furniture:temp color_hex.blue_2 set value "A"
execute if score $add_digit gm4_furniture_data matches 11 run data modify storage gm4_furniture:temp color_hex.blue_2 set value "B"
execute if score $add_digit gm4_furniture_data matches 12 run data modify storage gm4_furniture:temp color_hex.blue_2 set value "C"
execute if score $add_digit gm4_furniture_data matches 13 run data modify storage gm4_furniture:temp color_hex.blue_2 set value "D"
execute if score $add_digit gm4_furniture_data matches 14 run data modify storage gm4_furniture:temp color_hex.blue_2 set value "E"
execute if score $add_digit gm4_furniture_data matches 15 run data modify storage gm4_furniture:temp color_hex.blue_2 set value "F"
