# adds expansion to the modules list
# @s = none
# located at world spawn
# run from gm4_guidebook:analyze_storage/loop_expansions

data modify storage gm4_guidebook:temp_expansion module.type set value "expansion"
data modify storage gm4_guidebook:temp_analyze modules insert -2 from storage gm4_guidebook:temp_expansion module

# add to base, so base modules can have thier own TOC
data modify storage gm4_guidebook:temp_analyze module.expansions append from storage gm4_guidebook:temp_expansion module.id
