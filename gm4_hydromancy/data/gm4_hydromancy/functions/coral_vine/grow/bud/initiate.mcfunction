# spawn spore blossom bud at this flowering coral vine
# @s = flowering coral vine
# at @s
# run from coral_vine/grow/growth

tag @s add gm4_hy_coral_vine.flowering
setblock ~ ~ ~ flowering_azalea_leaves[waterlogged=true,persistent=true]
execute summon block_display run function gm4_hydromancy:coral_vine/grow/bud/east
execute summon block_display run function gm4_hydromancy:coral_vine/grow/bud/west
execute summon block_display run function gm4_hydromancy:coral_vine/grow/bud/south
execute summon block_display run function gm4_hydromancy:coral_vine/grow/bud/north
