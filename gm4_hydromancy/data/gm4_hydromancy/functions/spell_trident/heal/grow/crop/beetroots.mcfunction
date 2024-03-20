# grow crop one age
# @s = growth marker
# at @s, raycasting down
# run from spell_trident/heal/grow/check_type

execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ beetroots[age=0] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ beetroots[age=1]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ beetroots[age=1] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ beetroots[age=2]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ beetroots[age=2] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ beetroots[age=3]
