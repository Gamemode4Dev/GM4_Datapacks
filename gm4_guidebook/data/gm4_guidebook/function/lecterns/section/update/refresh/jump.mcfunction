# updates the book
# @s = player who last opened the lectern
# located at the center of the lectern
# run from gm4_guidebook:lecterns/section/update/refresh/find_player

# get guide score
execute store result score $trigger gm4_guide run data get block ~ ~ ~ Book.components."minecraft:custom_data".gm4_guidebook.trigger

# jump to section
function gm4_guidebook:lecterns/update with storage gm4_guidebook:register

# update page number
execute store result block ~ ~ ~ Page int 1 run scoreboard players get $original_page gm4_guide_pages
