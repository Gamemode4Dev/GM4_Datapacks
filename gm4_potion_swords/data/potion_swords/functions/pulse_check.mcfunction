#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = potion_swords gm4_clock_tick run function potion_swords:main

#20Hz for potion Swords
execute as @a[scores={gm4_gold_sword=1..}] run function potion_swords:assign_potion
