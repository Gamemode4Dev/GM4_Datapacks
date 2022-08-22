# @s = marker used to detect bell
# run from gm4_calling_bell:trader/init and recursion

scoreboard players add $ray gm4_calling_bell 1
tp @s ^ ^ ^0.01
execute if score $ray gm4_calling_bell matches 0..500 at @s unless block ~ ~ ~ bell run function gm4_calling_bell:trader/ray