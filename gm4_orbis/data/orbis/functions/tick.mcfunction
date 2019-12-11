scoreboard players add orbis_tick gm4_clock_tick 1
execute if score orbis_tick gm4_clock_tick >= speed gm4_orbis_config run function orbis:main

schedule function orbis:tick 1t
