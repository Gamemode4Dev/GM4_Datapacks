# checks for bobbers and stops when there are none
# scheduled from player/cast_line & id/select_entities

execute as @e[type=minecraft:fishing_bobber] at @s run function gm4_reeling_rods:id/select_entities
