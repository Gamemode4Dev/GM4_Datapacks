# regen coral to alive version
# @s = growth marker
# at @s, raycasting down
# run from spell_trident/heal/grow/check_type

execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_brain_coral[waterlogged=true] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ brain_coral
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_bubble_coral[waterlogged=true] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ bubble_coral
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_fire_coral[waterlogged=true] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ fire_coral
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_horn_coral[waterlogged=true] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ horn_coral
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_tube_coral[waterlogged=true] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ tube_coral
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_brain_coral_fan[waterlogged=true] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ brain_coral_fan
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_bubble_coral_fan[waterlogged=true] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ bubble_coral_fan
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_fire_coral_fan[waterlogged=true] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ fire_coral_fan
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_horn_coral_fan[waterlogged=true] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ horn_coral_fan
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_tube_coral_fan[waterlogged=true] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ tube_coral_fan

execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_brain_coral[waterlogged=false] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ brain_coral[waterlogged=false]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_bubble_coral[waterlogged=false] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ bubble_coral[waterlogged=false]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_fire_coral[waterlogged=false] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ fire_coral[waterlogged=false]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_horn_coral[waterlogged=false] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ horn_coral[waterlogged=false]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_tube_coral[waterlogged=false] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ tube_coral[waterlogged=false]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_brain_coral_fan[waterlogged=false] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ brain_coral_fan[waterlogged=false]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_bubble_coral_fan[waterlogged=false] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ bubble_coral_fan[waterlogged=false]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_fire_coral_fan[waterlogged=false] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ fire_coral_fan[waterlogged=false]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_horn_coral_fan[waterlogged=false] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ horn_coral_fan[waterlogged=false]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ dead_tube_coral_fan[waterlogged=false] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ tube_coral_fan[waterlogged=false]
