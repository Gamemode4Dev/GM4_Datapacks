# Action for reeled leash knot
# @s = leash knot
# at @s
# run from fished/select_type

tag @s add gm4_reeling_rods.leash_knot

# distance=..10 is leash distance UNTIL 1.21.6
execute as @e[type=#gm4_reeling_rods:leashable,distance=..10] \
    if function gm4_reeling_rods:fished/leash_knot/leaded_by_knot \
    run function gm4_reeling_rods:fished/leash_knot/change_leader


kill @s
