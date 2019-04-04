#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = undead_players gm4_clockTick as @a[scores={gm4_undead=1..}] at @s run function undead_players:main
