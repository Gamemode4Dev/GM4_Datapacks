tag @s remove gm4_swings.has_player

# launch
scoreboard players operation $id gm4_swings.id = @s gm4_swings.id
execute as @n[type=minecraft:item_display,tag=gm4_swings.swing,predicate=gm4_swings:id_match] run function gm4_swings:launch/main
