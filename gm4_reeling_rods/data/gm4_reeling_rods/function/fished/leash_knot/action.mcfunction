# Action for reeled leash knot
# @s = leash knot
# at bobber in @s
# run from fished/select_type

tag @s add gm4_reeling_rods.leash_knot

# distance=..10 is leash distance  (1.21.6 CHANGES TO 12)
execute at @s as @e[type=#gm4_reeling_rods:leashable,distance=..10] \
    if function gm4_reeling_rods:fished/leash_knot/leaded_by_knot \
    run function gm4_reeling_rods:fished/leash_knot/change_leader


kill @s

execute at @p[tag=gm4_reeling_rods.player] run playsound minecraft:entity.leash_knot.place neutral @a[distance=..16] ~ ~ ~
