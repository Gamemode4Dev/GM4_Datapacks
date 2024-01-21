# jumps to toc
# @s = guide lectern marker
# located at the center of the lectern
# run from gm4_guidebook:lecterns/section/check_page/normal

# jump to section
loot spawn ~ ~-3000 ~ loot gm4_guidebook:lectern/guidebook
execute positioned ~ ~-3000 ~ run data modify block ~ ~3000 ~ Book.tag set from entity @e[type=item,distance=..1,nbt={Item:{tag:{gm4_guidebook:{lectern:1b}}}},limit=1] Item.tag
execute positioned ~ ~-3000 ~ run kill @e[type=item,distance=..1,nbt={Item:{tag:{gm4_guidebook:{lectern:1b}}}},limit=1]

# store page count (minus 1)
execute store result score @s gm4_guide_pages run data get block ~ ~ ~ Book.tag.pages
scoreboard players remove @s gm4_guide_pages 1

# update page number
data modify block ~ ~ ~ Page set value 1

# mark toc
tag @s add gm4_guide_toc
