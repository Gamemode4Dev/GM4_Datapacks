# verifies that the sapling type is from this module
# @s = player who just placed down a custom sapling
# located at the center sapling block
# run from gm4_trees:sapling/summon marker via #gm4_trees:initialize_sapling

# this module runs on vanilla saplings, so we want to check for no specific type
execute unless data storage gm4_trees:temp sapling{} align xyz unless entity @e[tag=smithed.block,dx=0,dy=0,dz=0,limit=1] positioned ~.5 ~.5 ~.5 run function gm4_towering_trees:initialize_sapling
