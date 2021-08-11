# TODO

# prepare modifications
function gm4_garden_variety:arborist/research_book/scan_for_research_book

# [Research] get research book
execute if entity @s[advancements={gm4:encounter_tree=true},tag=!gm4_gv_can_research] run loot give @s loot gm4_garden_variety:arborist/research_book
execute if entity @s[advancements={gm4:encounter_tree=true},tag=!gm4_gv_can_research] run tag @s add gm4_gv_can_research

# [Research] get analyzer recipe
execute if predicate gm4_garden_variety:research/the_analyzer run data modify storage gm4_garden_variety:data/research Output[2] set from storage gm4_garden_variety:data/research the_analyzer

# store modifications
function gm4_garden_variety:arborist/research_book/add_research_to_slot

# remove advancement
advancement revoke @s only gm4_garden_variety:sleep
