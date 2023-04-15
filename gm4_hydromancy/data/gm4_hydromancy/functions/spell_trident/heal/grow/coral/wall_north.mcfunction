# regen coral to alive version
# @s = growth marker
# at @s, raycasting down
# run from spell_trident/heal/grow/coral/wall

execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_brain_coral_wall_fan[waterlogged=true] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ brain_coral_wall_fan[facing=north]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_bubble_coral_wall_fan[waterlogged=true] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ bubble_coral_wall_fan[facing=north]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_fire_coral_wall_fan[waterlogged=true] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ fire_coral_wall_fan[facing=north]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_horn_coral_wall_fan[waterlogged=true] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ horn_coral_wall_fan[facing=north]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_tube_coral_wall_fan[waterlogged=true] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ tube_coral_wall_fan[facing=north]

execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_brain_coral_wall_fan[waterlogged=false] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ brain_coral_wall_fan[waterlogged=false,facing=north]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_bubble_coral_wall_fan[waterlogged=false] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ bubble_coral_wall_fan[waterlogged=false,facing=north]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_fire_coral_wall_fan[waterlogged=false] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ fire_coral_wall_fan[waterlogged=false,facing=north]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_horn_coral_wall_fan[waterlogged=false] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ horn_coral_wall_fan[waterlogged=false,facing=north]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_tube_coral_wall_fan[waterlogged=false] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ tube_coral_wall_fan[waterlogged=false,facing=north]
