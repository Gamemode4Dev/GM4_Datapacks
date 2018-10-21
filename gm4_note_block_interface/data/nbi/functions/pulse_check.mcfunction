#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = nbi gm4_clockTick run function nbi:main

#tests if the player has punched a note block
execute as @a[scores={gm4_nbi_punch=1..}] at @s run function nbi:punch/setup
execute as @a[scores={gm4_nbi_click=1..}] at @s run function nbi:click/setup