# check if page is one of the section changes
# @s = guide lectern marker
# located at @s (center of the lectern)
# run from gm4_guidebook:lecterns/section/check_page

# if 0 or last page, jump to next section
execute if score $page gm4_guide_pages matches 0 run function gm4_guidebook:lecterns/section/update/next_section/find_player
execute if score $page gm4_guide_pages = @s gm4_guide_pages run function gm4_guidebook:lecterns/section/update/next_section/find_player
# if 3 or 4, jump to prev section
execute if score $page gm4_guide_pages matches 3..4 run function gm4_guidebook:lecterns/section/update/prev_section/find_player
# if 2, refresh
execute if score $page gm4_guide_pages matches 2 run function gm4_guidebook:lecterns/section/update/refresh/find_player
# if 1, jump to TOC
execute if score $page gm4_guide_pages matches 1 run function gm4_guidebook:lecterns/section/update/toc/jump
