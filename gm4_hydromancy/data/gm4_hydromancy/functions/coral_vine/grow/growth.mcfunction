# grow a new coral vine in this location
# @s = new coral vine marker (randomly picked from possible locations)
# at @s
# run from coral_vine/grow/expand_root
# run from coral_vine/grow/fresh_vine
# run from coral_vine/grow/initiate

tag @s remove gm4_hy_possible_root_growth
tag @s remove gm4_hy_possible_vine_growth

# grow either normal leaves or a flower bud
setblock ~ ~ ~ azalea_leaves[waterlogged=true,persistent=true]
execute if predicate gm4_hydromancy:chance/bud_growth run function gm4_hydromancy:coral_vine/grow/bud/initiate
