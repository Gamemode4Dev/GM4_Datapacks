# update page numbers (add initial page count)
scoreboard players operation $front_matter gm4_guide = #intro_pages gm4_guide
scoreboard players operation $front_matter gm4_guide += $toc_pages gm4_guide
scoreboard players add $front_matter gm4_guide 2
function gm4_guidebook:analyze_storage/update_page_numbers
