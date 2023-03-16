

tag @s remove gm4_hy_possible_root_growth
tag @s remove gm4_hy_possible_vine_growth

# grow either normal leaves or a bud
setblock ~ ~ ~ azalea_leaves
execute if predicate gm4_hydromancy:chance/bud_growth run function gm4_hydromancy:coral_vine/grow/bud_growth
