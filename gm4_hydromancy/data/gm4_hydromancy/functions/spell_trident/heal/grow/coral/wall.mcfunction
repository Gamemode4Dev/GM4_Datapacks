# regen coral to alive version
# @s = growth marker
# at @s, raycasting down
# run from spell_trident/heal/grow/check_type

execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ #gm4_hydromancy:dead_coral_wall[facing=north] run function gm4_hydromancy:spell_trident/heal/grow/coral/wall_north
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ #gm4_hydromancy:dead_coral_wall[facing=east] run function gm4_hydromancy:spell_trident/heal/grow/coral/wall_east
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ #gm4_hydromancy:dead_coral_wall[facing=south] run function gm4_hydromancy:spell_trident/heal/grow/coral/wall_south
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ #gm4_hydromancy:dead_coral_wall[facing=west] run function gm4_hydromancy:spell_trident/heal/grow/coral/wall_west
