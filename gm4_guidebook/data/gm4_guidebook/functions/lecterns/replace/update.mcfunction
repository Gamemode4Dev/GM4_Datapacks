# marks and updates the lectern
# @s = player who opened the lectern
# located at center of the lectern
# run from gm4_guidebook:lecterns/replace/ray

scoreboard players set $found gm4_guide 1

# summon marker
execute unless entity @e[type=marker,tag=gm4_guide_lectern,distance=..0.5,limit=1] run summon marker ~ ~ ~ {CustomName:'"gm4_guide_lectern"',Tags:["gm4_guide_lectern"]}

# replace book with lectern book
execute store result score $trigger gm4_guide run data get block ~ ~ ~ Book.components."minecraft:custom_data".gm4_guidebook.trigger
execute if score $trigger gm4_guide matches 1 run loot spawn ~ ~-3000 ~ loot gm4_guidebook:lectern/guidebook
execute unless score $trigger gm4_guide matches 1 run function #gm4_guidebook:update_lectern
execute positioned ~ ~-3000 ~ run data modify block ~ ~3000 ~ Book.components set from entity @e[type=item,distance=..1,predicate=gm4_guidebook:lectern_contents,limit=1] Item.components
execute positioned ~ ~-3000 ~ run kill @e[type=item,distance=..1,predicate=gm4_guidebook:lectern_contents,limit=1]

# store page count (minus 1)
execute store result score @e[type=marker,tag=gm4_guide_lectern,distance=..0.5,limit=1] gm4_guide_pages run data get block ~ ~ ~ Book.components."minecraft:written_book_content".pages
scoreboard players remove @e[type=marker,tag=gm4_guide_lectern,distance=..0.5,limit=1] gm4_guide_pages 1

# mark toc
tag @e[type=marker,tag=gm4_guide_lectern,distance=..0.5,limit=1] remove gm4_guide_toc
execute if score $trigger gm4_guide matches 1 run tag @e[type=marker,tag=gm4_guide_lectern,distance=..0.5,limit=1] add gm4_guide_toc

# update page number
execute if score $trigger gm4_guide matches 1 run data modify block ~ ~ ~ Page set value 1
execute unless score $trigger gm4_guide matches 1 run data modify block ~ ~ ~ Page set value 5

# clean up
scoreboard players reset $trigger gm4_guide
