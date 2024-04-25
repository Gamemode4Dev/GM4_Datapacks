# updates the book
# @s = player who last opened the lectern
# located at the center of the lectern
# run from gm4_guidebook:lecterns/section/update/refresh/find_player

# get guide score
execute store result score $trigger gm4_guide run data get block ~ ~ ~ Book.components."minecraft:custom_data".gm4_guidebook.trigger

# jump to section
# execute if score $trigger gm4_guide matches 1 run loot spawn ~ ~-3000 ~ loot gm4_guidebook:lectern/guidebook
# execute unless score $trigger gm4_guide matches 1 run function #gm4_guidebook:update_lectern
function #gm4_guidebook:update_lectern
execute positioned ~ ~-3000 ~ run data modify block ~ ~3000 ~ Book.components set from entity @e[type=item,distance=..1,predicate=gm4_guidebook:lectern_contents,limit=1] Item.components
execute positioned ~ ~-3000 ~ run kill @e[type=item,distance=..1,predicate=gm4_guidebook:lectern_contents,limit=1]

# update page number
execute store result block ~ ~ ~ Page int 1 run scoreboard players get $original_page gm4_guide_pages
