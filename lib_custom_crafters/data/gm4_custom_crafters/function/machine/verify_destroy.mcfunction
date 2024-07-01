# verifies that the destroyed machine was from this module
# @s = machine block marker
# located at @s
# run from #gm4_machines:destroy

execute if score gm4_custom_crafters load.status matches 3 if score gm4_custom_crafters_minor load.status matches 0 if entity @s[tag=gm4_custom_crafter] run function gm4_custom_crafters:machine/destroy
# note that the load checks above are NOT required for a normal module; it's only included here because this is in a library
