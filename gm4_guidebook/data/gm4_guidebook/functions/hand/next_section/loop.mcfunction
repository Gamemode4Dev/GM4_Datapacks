# clears all sections before the current section (inclusive)
# @s = player who clicked in the guidebook
# located at world spawn
# run from gm4_guidebook:hand/next_section/search
# run from self

execute store result score $check gm4_guide_next run data get storage gm4_guidebook:temp triggers[0]
data remove storage gm4_guidebook:temp triggers[0]
execute unless score $check gm4_guide_next = @s gm4_guide_next if data storage gm4_guidebook:temp triggers[-1] run function gm4_guidebook:hand/next_section/loop
