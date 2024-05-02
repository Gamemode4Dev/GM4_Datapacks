# finds previous section to jump to 
# @s = player who last opened the lectern
# located at the center of the lectern
# run from gm4_guidebook:lecterns/section/update/prev_section/find_player

# get this trigger
execute store result score $trigger gm4_guide_prev run data get block ~ ~ ~ Book.components."minecraft:custom_data".gm4_guidebook.trigger

# find section
data modify storage gm4_guidebook:temp triggers set from storage gm4_guidebook:register trigger_order
function gm4_guidebook:lecterns/section/update/prev_section/find_section

# set guide score
execute store result score $trigger gm4_guide run data get storage gm4_guidebook:temp triggers[-1]
## special case: if there's nothing before this, jump to TOC
execute unless data storage gm4_guidebook:temp triggers[-1] run scoreboard players set $trigger gm4_guide 1
data remove storage gm4_guidebook:temp triggers

# jump to section
execute if score $trigger gm4_guide matches 1 run loot spawn ~ ~-3000 ~ loot gm4_guidebook:lectern/guidebook
execute unless score $trigger gm4_guide matches 1 run function #gm4_guidebook:update_lectern
execute positioned ~ ~-3000 ~ run data modify block ~ ~3000 ~ Book.components set from entity @e[type=item,distance=..1,predicate=gm4_guidebook:lectern_contents,limit=1] Item.components
execute positioned ~ ~-3000 ~ run kill @e[type=item,distance=..1,predicate=gm4_guidebook:lectern_contents,limit=1]

# update page number
execute if score $trigger gm4_guide matches 1 run data modify block ~ ~ ~ Page set value 1
execute unless score $trigger gm4_guide matches 1 unless score $page gm4_guide_pages matches 4 run data modify block ~ ~ ~ Page set value 5
execute unless score $trigger gm4_guide matches 1 if score $page gm4_guide_pages matches 4 store result score $pages gm4_guide run data get block ~ ~ ~ Book.components."minecraft:written_book_content".pages
execute unless score $trigger gm4_guide matches 1 if score $page gm4_guide_pages matches 4 store result block ~ ~ ~ Page int 1 run scoreboard players remove $pages gm4_guide 2
