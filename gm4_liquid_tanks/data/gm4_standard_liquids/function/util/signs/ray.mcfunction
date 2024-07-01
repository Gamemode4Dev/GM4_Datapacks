# @s = marker ray used to detect the sign
# run from both ink_sign and glow_ink_sign

scoreboard players add $ray gm4_lt_util 1
tp @s ^ ^ ^0.01
execute if score $ray gm4_lt_util matches 0..500 at @s unless block ~ ~ ~ #minecraft:all_signs run function gm4_standard_liquids:util/signs/ray
