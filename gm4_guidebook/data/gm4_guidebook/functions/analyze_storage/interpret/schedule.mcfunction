# schedules the different parts of analyzing to prevent issues with the maxCommandChainLength
# @s = none
# located at world spawn
# run from gm4_guidebook:init

schedule function gm4_guidebook:analyze_storage/interpret/build_pages 1t
schedule function gm4_guidebook:analyze_storage/interpret/update_page_numbers 1t
schedule function gm4_guidebook:analyze_storage/interpret/build_table_of_contents 1t
schedule function gm4_guidebook:analyze_storage/interpret/finalize_table_of_contents 1t
