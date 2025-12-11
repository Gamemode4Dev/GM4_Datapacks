# replaces any furniture player heads with their corresponding furniture
# @s = player that just placed a furniture player head
# at @s rotated <aligned to cardinal direction> positioned ^-4 ^X ^-1, X = layer number - 4
# run from place/place_furniture

execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^ ^ ^ if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^1 ^ ^ if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^2 ^ ^ if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^3 ^ ^ if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^4 ^ ^ if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^5 ^ ^ if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^6 ^ ^ if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^7 ^ ^ if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^8 ^ ^ if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place

execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^ ^ ^1 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^1 ^ ^1 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^2 ^ ^1 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^3 ^ ^1 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^4 ^ ^1 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^5 ^ ^1 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^6 ^ ^1 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^7 ^ ^1 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^8 ^ ^1 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place

execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^ ^ ^2 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^1 ^ ^2 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^2 ^ ^2 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^3 ^ ^2 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^4 ^ ^2 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^5 ^ ^2 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^6 ^ ^2 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^7 ^ ^2 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^8 ^ ^2 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place

execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^ ^ ^3 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^1 ^ ^3 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^2 ^ ^3 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^3 ^ ^3 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^4 ^ ^3 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^5 ^ ^3 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^6 ^ ^3 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^7 ^ ^3 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^8 ^ ^3 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place

execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^ ^ ^4 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^1 ^ ^4 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^2 ^ ^4 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^3 ^ ^4 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^4 ^ ^4 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^5 ^ ^4 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^6 ^ ^4 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^7 ^ ^4 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^8 ^ ^4 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place

execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^ ^ ^5 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^1 ^ ^5 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^2 ^ ^5 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^3 ^ ^5 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^4 ^ ^5 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^5 ^ ^5 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^6 ^ ^5 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^7 ^ ^5 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place
execute if score $player_head_count gm4_furniture_data matches 1.. positioned ^8 ^ ^5 if block ~ ~ ~ #gm4_furniture:player_heads{profile:{properties:[{signature:"gm4_furniture"}]}} run function gm4_furniture:place/prep_place


scoreboard players add $layer_count gm4_furniture_data 1
execute if score $player_head_count gm4_furniture_data matches 1.. if score $layer_count gm4_furniture_data matches ..10 positioned ~ ~1 ~ run function gm4_furniture:place/check_layer
