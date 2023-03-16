
# temp remove this vine leaf for checks
setblock ~ ~ ~ water

# spawn markers at possible growth locations
execute positioned ~ ~1 ~ if predicate gm4_hydromancy:valid_vine_growth run summon marker ~ ~ ~ {Tags:["gm4_hy_possible_vine_growth","gm4_hy_coral_vine","gm4_hy_coral_vine.alive"]}
execute positioned ~1 ~1 ~ if predicate gm4_hydromancy:valid_vine_growth run summon marker ~ ~ ~ {Tags:["gm4_hy_possible_vine_growth","gm4_hy_coral_vine","gm4_hy_coral_vine.alive"]}
execute positioned ~-1 ~1 ~ if predicate gm4_hydromancy:valid_vine_growth run summon marker ~ ~ ~ {Tags:["gm4_hy_possible_vine_growth","gm4_hy_coral_vine","gm4_hy_coral_vine.alive"]}
execute positioned ~ ~1 ~1 if predicate gm4_hydromancy:valid_vine_growth run summon marker ~ ~ ~ {Tags:["gm4_hy_possible_vine_growth","gm4_hy_coral_vine","gm4_hy_coral_vine.alive"]}
execute positioned ~ ~1 ~-1 if predicate gm4_hydromancy:valid_vine_growth run summon marker ~ ~ ~ {Tags:["gm4_hy_possible_vine_growth","gm4_hy_coral_vine","gm4_hy_coral_vine.alive"]}

# pick a random location to grow the vine
execute as @e[type=marker,tag=gm4_hy_possible_vine_growth,limit=1,sort=nearest] at @s run function gm4_hydromancy:coral_vine/grow/growth
kill @e[type=marker,tag=gm4_hy_possible_vine_growth]

# replace vine leaf
execute if entity @s[tag=!gm4_hy_coral_vine.budded] run setblock ~ ~ ~ azalea_leaves
execute if entity @s[tag=gm4_hy_coral_vine.budded] run setblock ~ ~ ~ flowering_azalea_leaves
