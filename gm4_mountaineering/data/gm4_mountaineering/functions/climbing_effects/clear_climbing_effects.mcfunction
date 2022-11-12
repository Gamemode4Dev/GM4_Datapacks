# clear any crampon-related effects when crampons are removed
# @s = player not wearing crampons
# at @s
# run from climbing_effects/clear_crampon_effects

execute if entity @s[tag=gm4_mountaineering_facing_climbable_block] run tag @s remove gm4_mountaineering_facing_climbable_block
tag @e[type=minecraft:shulker, tag=gm4_mountaineering_climb_assist] add gm4_mountaineering_kill_shulker
execute run function gm4_mountaineering:climbing_effects/kill_shulkers
