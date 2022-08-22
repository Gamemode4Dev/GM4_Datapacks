# verifies that the destroyed machine was from this module
# @s = machine block marker
# located at @s
# run from #gm4_machines:destroy

execute if entity @s[tag=gm4_teleportation_jammer] run function gm4_teleportation_anchors:machine/destroy_jammer
execute if entity @s[tag=gm4_teleportation_anchor] run function gm4_teleportation_anchors:machine/destroy_anchor
