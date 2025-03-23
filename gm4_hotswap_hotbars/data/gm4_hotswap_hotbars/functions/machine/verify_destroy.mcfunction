# verifies that the destroyed machine was from this module
# @s = machine block marker
# located at @s
# run from #gm4_machines:destroy

execute if score gm4_hotswap_hotbars load.status matches 1 if entity @s[tag=gm4_hotswapper] run function gm4_hotswap_hotbars:machine/destroy
