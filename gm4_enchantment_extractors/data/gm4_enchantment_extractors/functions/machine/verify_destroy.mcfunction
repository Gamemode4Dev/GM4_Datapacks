# verifies that the destroyed machine was from this module
# @s = machine block marker
# located at @s
# run from #gm4_machines:destroy

execute if entity @s[tag=gm4_enchantment_extractor] run function gm4_enchantment_extractors:machine/destroy
