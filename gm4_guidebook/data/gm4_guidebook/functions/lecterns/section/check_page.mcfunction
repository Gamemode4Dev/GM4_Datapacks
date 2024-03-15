# check if page is one of the section changes
# @s = guide lectern marker
# located at @s (center of the lectern)
# run from gm4_guidebook:lecterns/section/tracking

execute store result score $page gm4_guide_pages run data get block ~ ~ ~ Page

# different behavior based on TOC or normal
scoreboard players set $toc gm4_guide_pages 0
execute if entity @s[tag=gm4_guide_toc] run function gm4_guidebook:lecterns/section/check_page/toc
execute if score $toc gm4_guide_pages matches 0 run function gm4_guidebook:lecterns/section/check_page/normal
