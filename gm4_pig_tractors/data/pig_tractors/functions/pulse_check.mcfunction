#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = pig_tractors gm4_clockTick run function pig_tractors:main
execute as @a[tag=gm4_has_hoe,tag=gm4_on_pig] at @s run function pig_tractors:on_tractor
