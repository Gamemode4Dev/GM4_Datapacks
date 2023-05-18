# finds prev section to jump to 
# @s = player who clicked in the guidebook
# located at world spawn
# run from gm4_guidebook:tick

# find section
data modify storage gm4_guidebook:temp triggers set from storage gm4_guidebook:register trigger_order
function gm4_guidebook:hand/prev_section/loop

# set guide score
execute store result score @s gm4_guide run data get storage gm4_guidebook:temp triggers[-1]
execute unless data storage gm4_guidebook:temp triggers[-1] run scoreboard players set @s gm4_guide 1
data remove storage gm4_guidebook:temp triggers
