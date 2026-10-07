execute unless block ~ ~1 ~ #minecraft:blocks_motion run return run function gm4_swings:break/main
execute if block ~ ~ ~ #minecraft:blocks_motion run return run function gm4_swings:break/main

scoreboard players operation $id gm4_swings.id = @s gm4_swings.id
execute store result score $seat_block gm4_swings.dummy at @n[type=minecraft:item_display,tag=gm4_swings.swing_seat,predicate=gm4_swings:id_match,distance=..10] if block ~ ~ ~ #minecraft:blocks_motion
execute if score $seat_block gm4_swings.dummy matches 1 run function gm4_swings:break/main