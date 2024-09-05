# clears all sections after the current section (inclusive)
# @s = player who clicked in the guidebook
# located at world spawn
# run from gm4_guidebook:hand/prev_section/search
# run from self

execute store result score $check gm4_guide_prev run data get storage gm4_guidebook:temp triggers[-1]
data remove storage gm4_guidebook:temp triggers[-1]
execute unless score $check gm4_guide_prev = @s gm4_guide_prev if data storage gm4_guidebook:temp triggers[-1] run function gm4_guidebook:hand/prev_section/loop
