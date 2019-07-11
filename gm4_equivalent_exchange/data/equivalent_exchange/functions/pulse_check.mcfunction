#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = equivalent_exchange gm4_clock_tick run function equivalent_exchange:main

#transmogrify mobs
execute as @a[scores={gm4_ee_hit=1..},nbt={SelectedItem:{id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}}}] at @s run function equivalent_exchange:mobs/check_charge
scoreboard players reset @a[scores={gm4_ee_hit=1..}] gm4_ee_hit
