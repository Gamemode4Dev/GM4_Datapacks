# clears all sections before the current section (inclusive)
# @s = player who last opened the lectern
# located at the center of the lectern
# run from gm4_guidebook:lecterns/section/update/prev_section/jump
# run from self

execute store result score $check gm4_guide_prev run data get storage gm4_guidebook:temp triggers[-1]
data remove storage gm4_guidebook:temp triggers[-1]
execute unless score $check gm4_guide_prev = $trigger gm4_guide_prev if data storage gm4_guidebook:temp triggers[-1] run function gm4_guidebook:lecterns/section/update/prev_section/find_section
