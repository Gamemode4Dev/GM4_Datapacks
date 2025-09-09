# checks for bobbers and stops when there are none
# run from player/cast_line and scheduled from id/select_entities

# assign new ids if there's a bobber
execute as @e[type=minecraft:fishing_bobber] at @s run return run function gm4_reeling_rods:id/select_entities

# no fishing bobber, clear ids
execute as @e[tag=gm4_reeling_rods.id.tagged] run function gm4_reeling_rods:id/clear
