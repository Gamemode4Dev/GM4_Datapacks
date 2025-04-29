# Action for reeled leash knot
# @s = leash knot
# at @s
# run from fishing/select_type

tag @s add gm4_reeling_rods.leash_knot

execute as @e[type=#gm4_reeling_rods:leashable,distance=..10] \
    if function gm4_reeling_rods:fishing/leash_knot/leaded_by_knot \
    run function gm4_reeling_rods:fishing/leash_knot/change_leader


kill @s
