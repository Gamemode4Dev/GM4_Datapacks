#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = undead_players gm4_clock_tick as @a[scores={gm4_undead=1..}] at @s run function undead_players:main
