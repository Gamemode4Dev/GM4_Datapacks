# find a new growth location for a coral vine root
# @s = coral flower / coral vine root marker
# at @s positioned ~ ~-1 ~ / at @s
# run from coral_vine/grow/expand_root
# run from coral_vine/grow/fresh_vine

execute positioned ~1 ~ ~ if predicate gm4_hydromancy:valid_root_growth run summon marker ~ ~ ~ {Tags:["gm4_hy_possible_root_growth","gm4_hy_coral_vine","gm4_hy_coral_vine.alive","gm4_hy_coral_vine.connected","gm4_hy_coral_vine.rooted"]}
execute positioned ~-1 ~ ~ if predicate gm4_hydromancy:valid_root_growth run summon marker ~ ~ ~ {Tags:["gm4_hy_possible_root_growth","gm4_hy_coral_vine","gm4_hy_coral_vine.alive","gm4_hy_coral_vine.connected","gm4_hy_coral_vine.rooted"]}
execute positioned ~ ~ ~1 if predicate gm4_hydromancy:valid_root_growth run summon marker ~ ~ ~ {Tags:["gm4_hy_possible_root_growth","gm4_hy_coral_vine","gm4_hy_coral_vine.alive","gm4_hy_coral_vine.connected","gm4_hy_coral_vine.rooted"]}
execute positioned ~ ~ ~-1 if predicate gm4_hydromancy:valid_root_growth run summon marker ~ ~ ~ {Tags:["gm4_hy_possible_root_growth","gm4_hy_coral_vine","gm4_hy_coral_vine.alive","gm4_hy_coral_vine.connected","gm4_hy_coral_vine.rooted"]}
