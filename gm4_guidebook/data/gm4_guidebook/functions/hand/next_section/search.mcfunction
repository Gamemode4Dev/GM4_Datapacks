# finds next section to jump to 
# @s = player who clicked in the guidebook
# located at world spawn
# run from gm4_guidebook:tick

# find section
data modify storage gm4_guidebook:temp triggers set from storage gm4_guidebook:register trigger_order
function gm4_guidebook:hand/next_section/loop

# set guide score
execute store result score @s gm4_guide run data get storage gm4_guidebook:temp triggers[0]
execute unless data storage gm4_guidebook:temp triggers[-1] run scoreboard players operation @s gm4_guide = @s gm4_guide_next
data remove storage gm4_guidebook:temp triggers
