# grow crop one age
# @s = growth marker
# at @s, raycasting down
# run from spell_trident/heal/grow/check_type

execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ wheat[age=0] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ wheat[age=1]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ wheat[age=1] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ wheat[age=2]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ wheat[age=2] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ wheat[age=3]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ wheat[age=3] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ wheat[age=4]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ wheat[age=4] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ wheat[age=5]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ wheat[age=5] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ wheat[age=6]
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ wheat[age=6] store success score $heal.growth_done gm4_hy_data run setblock ~ ~ ~ wheat[age=7]
