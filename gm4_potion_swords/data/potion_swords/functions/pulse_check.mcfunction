#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = potion_swords gm4_clockTick run function potion_swords:main

#20Hz for potion Swords
execute as @a[scores={gm4_gold_sword=1..}] run function potion_swords:assign_potion
