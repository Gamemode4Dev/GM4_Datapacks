# clears all sections before the current section (inclusive)
# @s = player who last opened the lectern
# located at the center of the lectern
# run from gm4_guidebook:lecterns/section/update/next_section/jump
# run from self

execute store result score $check gm4_guide_next run data get storage gm4_guidebook:temp triggers[0]
data remove storage gm4_guidebook:temp triggers[0]
execute unless score $check gm4_guide_next = $trigger gm4_guide_next if data storage gm4_guidebook:temp triggers[-1] run function gm4_guidebook:lecterns/section/update/next_section/find_section
