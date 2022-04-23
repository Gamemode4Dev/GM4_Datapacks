# verifies that the destroyed machine was from this module
# @s = machine block marker
# located at @s
# run from #gm4_machines:destroy

execute if entity @s[tag=gm4_ender_hopper] run function gm4_ender_hoppers:machine/destroy
