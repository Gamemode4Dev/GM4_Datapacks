# clear any crampon-related effects when crampons are removed
# @s = player not wearing crampons
# at @s
# run from climbing_effects/crampons_equipped

tag @s remove gm4_mountaineering_facing_climbable_block
kill @e[type=minecraft:shulker, tag=gm4_mountaineering_climb_assist]
