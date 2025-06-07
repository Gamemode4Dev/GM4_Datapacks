# checks for bobbers and stops when there are none
# run from player/cast_line \
  & scheduled id/select_entities

# clear ids for new assignment
execute as @e[tag=gm4_reeling_rods.id.tagged] run function gm4_reeling_rods:id/clear
# assign new ids if there's a bobber
execute as @e[type=minecraft:fishing_bobber] at @s run function gm4_reeling_rods:id/select_entities
