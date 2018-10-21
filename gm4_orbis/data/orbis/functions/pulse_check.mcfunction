#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = orbis gm4_clockTick run function orbis:main
execute if score speed gm4_orbis_config matches 3.. if score gm4_currentTick gm4_clockTick = orbis_4 gm4_clockTick run function orbis:main
execute if score speed gm4_orbis_config matches 2.. if score gm4_currentTick gm4_clockTick = orbis_8 gm4_clockTick run function orbis:main
execute if score speed gm4_orbis_config matches 3.. if score gm4_currentTick gm4_clockTick = orbis_12 gm4_clockTick run function orbis:main
