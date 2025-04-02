# spawn many volatile pillars on death
# @s = item
# at @s
# run from mob/process/elite/on_death/run

execute positioned ~ ~ ~3 summon marker run function gm4_monsters_unbound:mob/process/elite/volatile/pillar_location
execute positioned ~ ~ ~-3 summon marker run function gm4_monsters_unbound:mob/process/elite/volatile/pillar_location
execute positioned ~3 ~ ~ summon marker run function gm4_monsters_unbound:mob/process/elite/volatile/pillar_location
execute positioned ~-3 ~ ~ summon marker run function gm4_monsters_unbound:mob/process/elite/volatile/pillar_location
