# finds last player to open the lectern
# @s = guide lectern marker
# located at the center of the lectern
# run from gm4_guidebook:lecterns/section/check_page/normal

# execute as player, at block
scoreboard players operation $current gm4_guide_id = @s gm4_guide_id
execute as @a[distance=..6] if score @s gm4_guide_id = $current gm4_guide_id run function gm4_guidebook:lecterns/section/update/next_section/jump

# mark toc
tag @s remove gm4_guide_toc
execute if score $trigger gm4_guide matches 1 run tag @s add gm4_guide_toc

# store page count (minus 1)
execute store result score @s gm4_guide_pages run data get block ~ ~ ~ Book.tag.pages
scoreboard players remove @s gm4_guide_pages 1

# clean up
scoreboard players reset $trigger gm4_guide
scoreboard players reset $trigger gm4_guide_next
