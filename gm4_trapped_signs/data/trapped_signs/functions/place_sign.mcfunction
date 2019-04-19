scoreboard players set @s gm4_place_sign 0
execute if entity @s[scores={gm4_trapped_sign=1..}] at @s run function trapped_signs:place_trapped_sign
