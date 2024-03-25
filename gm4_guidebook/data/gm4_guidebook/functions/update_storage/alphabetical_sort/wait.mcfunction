# wait for chunk to be loaded (entity processing)
# @s = none
# located at world spawn
# run from gm4_guidebook:update_storage/setup_markers


execute if loaded ~ ~ ~ run function gm4_guidebook:update_storage/alphabetical_sort/go
execute unless loaded ~ ~ ~ run schedule function gm4_guidebook:update_storage/alphabetical_sort/wait 1t
