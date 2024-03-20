# find a new growth location for a coral vine
# @s = coral vine marker
# at @s
# run from coral_vine/grow/initiate
# run from here

# temp remove this vine leaf for checks
setblock ~ ~ ~ water

# spawn markers at possible growth locations
execute positioned ~ ~1 ~ if predicate gm4_hydromancy:valid_vine_growth run summon marker ~ ~ ~ {Tags:["gm4_hy_possible_vine_growth","gm4_hy_coral_vine","gm4_hy_coral_vine.alive","gm4_hy_coral_vine.connected"]}
execute positioned ~1 ~1 ~ if predicate gm4_hydromancy:valid_vine_growth run summon marker ~ ~ ~ {Tags:["gm4_hy_possible_vine_growth","gm4_hy_coral_vine","gm4_hy_coral_vine.alive","gm4_hy_coral_vine.connected"]}
execute positioned ~-1 ~1 ~ if predicate gm4_hydromancy:valid_vine_growth run summon marker ~ ~ ~ {Tags:["gm4_hy_possible_vine_growth","gm4_hy_coral_vine","gm4_hy_coral_vine.alive","gm4_hy_coral_vine.connected"]}
execute positioned ~ ~1 ~1 if predicate gm4_hydromancy:valid_vine_growth run summon marker ~ ~ ~ {Tags:["gm4_hy_possible_vine_growth","gm4_hy_coral_vine","gm4_hy_coral_vine.alive","gm4_hy_coral_vine.connected"]}
execute positioned ~ ~1 ~-1 if predicate gm4_hydromancy:valid_vine_growth run summon marker ~ ~ ~ {Tags:["gm4_hy_possible_vine_growth","gm4_hy_coral_vine","gm4_hy_coral_vine.alive","gm4_hy_coral_vine.connected"]}

# replace vine leaf
execute if entity @s[tag=!gm4_hy_coral_vine.flowering] run setblock ~ ~ ~ azalea_leaves[waterlogged=true,persistent=true]
execute if entity @s[tag=gm4_hy_coral_vine.flowering] run setblock ~ ~ ~ flowering_azalea_leaves[waterlogged=true,persistent=true]

# keep trying until a possible location is found
tag @s add gm4_hy_coral_vine.tried_growth
execute unless entity @e[type=marker,tag=gm4_hy_possible_vine_growth] as @e[type=marker,tag=gm4_hy_coral_vine.can_grow,tag=!gm4_hy_coral_vine.tried_growth,limit=1,sort=random] at @s run function gm4_hydromancy:coral_vine/grow/try_growth
