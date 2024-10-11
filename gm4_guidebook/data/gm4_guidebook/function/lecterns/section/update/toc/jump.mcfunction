# jumps to toc
# @s = guide lectern marker
# located at the center of the lectern
# run from gm4_guidebook:lecterns/section/check_page/normal

# jump to section
scoreboard players set $trigger gm4_guide 1
function gm4_guidebook:lecterns/update with storage gm4_guidebook:register

# store page count (minus 1)
execute store result score @s gm4_guide_pages run data get block ~ ~ ~ Book.components."minecraft:written_book_content".pages
scoreboard players remove @s gm4_guide_pages 1

# update page number
data modify block ~ ~ ~ Page set value 1

# mark toc
tag @s add gm4_guide_toc
