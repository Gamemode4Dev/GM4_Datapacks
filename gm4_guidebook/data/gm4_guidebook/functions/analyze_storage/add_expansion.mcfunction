# adds expansion to the modules list
# @s = none
# located at world spawn
# run from gm4_guidebook:analyze_storage/loop_expansions

# add module to begining of the list, after the base module
data modify storage gm4_guidebook:temp_expansion module.type set value "expansion"
data modify storage gm4_guidebook:temp_analyze modules insert -2 from storage gm4_guidebook:temp_expansion module

# add to base, so base modules can have thier own TOC (unused, but still potential)
data modify storage gm4_guidebook:temp_analyze module.expansions append from storage gm4_guidebook:temp_expansion module.id
