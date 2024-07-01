# finds section to jump to 
# @s = player who last opened the lectern
# located at the center of the lectern
# run from gm4_guidebook:lecterns/section/update/next_section/find_player

# get the index
execute store result score $index gm4_guide run data get block ~ ~ ~ Page
scoreboard players operation $index gm4_guide -= $front_matter gm4_guide_pages
scoreboard players remove $index gm4_guide 1

# find section
scoreboard players set $check gm4_guide 0
data modify storage gm4_guidebook:temp triggers set from storage gm4_guidebook:register trigger_order
execute if score $index gm4_guide matches 1.. run function gm4_guidebook:lecterns/section/toc/find_section

# set guide score
execute store result score $trigger gm4_guide run data get storage gm4_guidebook:temp triggers[0]
## special case: if the storage is somehow empty (shouldn't happen) jump to TOC
execute unless data storage gm4_guidebook:temp triggers[0] run scoreboard players set $trigger gm4_guide 1
data remove storage gm4_guidebook:temp triggers

# jump to section
execute if score $trigger gm4_guide matches 1 run loot spawn ~ ~-3000 ~ loot gm4_guidebook:lectern/guidebook
execute unless score $trigger gm4_guide matches 1 run function #gm4_guidebook:update_lectern
execute positioned ~ ~-3000 ~ run data modify block ~ ~3000 ~ Book.components set from entity @e[type=item,distance=..1,predicate=gm4_guidebook:lectern_contents,limit=1] Item.components
execute positioned ~ ~-3000 ~ run kill @e[type=item,distance=..1,predicate=gm4_guidebook:lectern_contents,limit=1]

# store page count (minus 1)
execute store result score @e[type=marker,tag=gm4_guide_lectern,distance=..0.5,limit=1] gm4_guide_pages run data get block ~ ~ ~ Book.components."minecraft:written_book_content".pages
scoreboard players remove @e[type=marker,tag=gm4_guide_lectern,distance=..0.5,limit=1] gm4_guide_pages 1

# update page number
execute if score $trigger gm4_guide matches 1 run data modify block ~ ~ ~ Page set value 1
execute unless score $trigger gm4_guide matches 1 run data modify block ~ ~ ~ Page set value 5
