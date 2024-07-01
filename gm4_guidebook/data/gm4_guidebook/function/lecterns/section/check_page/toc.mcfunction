# check if page is one of the section changes
# @s = guide lectern marker
# located at @s (center of the lectern)
# run from gm4_guidebook:lecterns/section/check_page

scoreboard players set $toc gm4_guide_pages 1

# if 0, jump to TOC (refresh)
execute if score $page gm4_guide_pages matches 0 run function gm4_guidebook:lecterns/section/update/toc/jump

# else, figure out what section to jump to
# execute if score $page gm4_guide_pages matches 0..1 run return
execute if score $page gm4_guide_pages > $front_matter gm4_guide_pages run function gm4_guidebook:lecterns/section/toc/find_player
