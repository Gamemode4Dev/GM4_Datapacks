#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = orbis gm4_clockTick if entity @a[tag=gm4_orbis_active] run function orbis:main
