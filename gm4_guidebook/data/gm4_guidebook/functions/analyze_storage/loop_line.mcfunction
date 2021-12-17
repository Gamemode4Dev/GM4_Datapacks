# interprets each line of the page
# @s = none
# located at world spawn
# run from gm4_guidebook:analyze_storage/loop_page

# set next line based on installed modules
data modify storage gm4_guidebook:temp_analyze module set from storage gm4_guidebook:temp_analyze modules[-1]
execute if data storage gm4_guidebook:temp_analyze module{type:"base"} run function gm4_guidebook:analyze_storage/add_base
execute unless data storage gm4_guidebook:temp_analyze module{type:"_expansion"} run function gm4_guidebook:analyze_storage/add_module

# loop until this page is full or there's no more modules
data remove storage gm4_guidebook:temp_analyze modules[-1]
data remove storage gm4_guidebook:temp_analyze module
execute unless score $line_count gm4_guide matches 13.. if data storage gm4_guidebook:temp_analyze modules[-1] run schedule function gm4_guidebook:analyze_storage/loop_line 1t

# add pages until all the modules are listed
execute if score $line_count gm4_guide matches 13.. if data storage gm4_guidebook:temp_analyze modules[-1] run schedule function gm4_guidebook:analyze_storage/loop_page 1t
execute unless data storage gm4_guidebook:temp_analyze modules[-1] run schedule function gm4_guidebook:analyze_storage/interpret/finalize_pages 1t
