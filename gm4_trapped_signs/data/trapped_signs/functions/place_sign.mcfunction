scoreboard players set @s gm4_place_sign 0
execute if entity @s[tag=trapped_sign_holding] at @s run function trapped_signs:place_trapped_sign
