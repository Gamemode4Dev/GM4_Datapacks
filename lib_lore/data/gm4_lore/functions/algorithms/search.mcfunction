# find a specified line of Lore from a source Lore
# run from modules that use this library

# prepare for search
function gm4_lore:utilities/prepare

# if start is specified, ignore the lines before that index
execute if score $start gm4_lore matches 1.. run function gm4_lore:utilities/start_after

# move all lines prior to the target line to a temp storage
# Source[0] will become equal to Target after this
function gm4_lore:utilities/find_line

# store the first line of source (target line)
data modify storage gm4_lore:temp Dump append from storage gm4_lore:temp Source[0]

# place the lines back into Source from the TempSource
data modify storage gm4_lore:temp Source prepend from storage gm4_lore:temp TempSource[]

# clean up
function gm4_lore:utilities/clean_up
