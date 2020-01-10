scoreboard players add $orbis_tick gm4_count 1
execute if score $orbis_tick gm4_count >= speed gm4_orbis_config run function gm4_orbis:main

schedule function gm4_orbis:tick 1t
