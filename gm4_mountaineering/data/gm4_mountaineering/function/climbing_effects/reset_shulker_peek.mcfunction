# reset the peek values of new shulkers and remove the relevant tag
# @s = player wearing crampons, with using_crampons tag, and facing a climbable block
# at @s
# run from add_climb_effects

execute as @e[type=shulker, tag=gm4_mountaineering_climb_assist, tag=gm4_mountaineering_peek_unset] run data merge entity @s {Peek:10}
tag @e[type=shulker] remove gm4_mountaineering_peek_unset
