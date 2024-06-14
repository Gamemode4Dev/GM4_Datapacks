# clears all sections before the desired section (exclusive)
# @s = player who last opened the lectern
# located at the center of the lectern
# run from gm4_guidebook:lecterns/section/update/next_section/jump
# run from self

data remove storage gm4_guidebook:temp triggers[0]
scoreboard players add $check gm4_guide 1
execute unless score $check gm4_guide >= $index gm4_guide if data storage gm4_guidebook:temp triggers[-1] run function gm4_guidebook:lecterns/section/toc/find_section
