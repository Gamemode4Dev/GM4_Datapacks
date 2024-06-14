# replaces a specified line of Lore with a new line of Lore
# run from modules that use this library

# prepare for replace
function gm4_lore:utilities/prepare

# if start is specified, ignore the lines before that index
execute if score $start gm4_lore matches 1.. run function gm4_lore:utilities/start_after

# move all lines prior to the target line to a temp storage
# Source[0] will become equal to Target after this
function gm4_lore:utilities/find_line

# replace the first line of source (target line)
data modify storage gm4_lore:temp TempInput set from storage gm4_lore:temp Input
data modify storage gm4_lore:temp Dump append from storage gm4_lore:temp Source[0]
data modify storage gm4_lore:temp Source[0] set from storage gm4_lore:temp Input[-1]
data remove storage gm4_lore:temp Input[-1]
data modify storage gm4_lore:temp Source prepend from storage gm4_lore:temp Input[]
data modify storage gm4_lore:temp Input set from storage gm4_lore:temp TempInput

# place the lines back into Source from the TempSource
data modify storage gm4_lore:temp Source prepend from storage gm4_lore:temp TempSource[]

# clean up
function gm4_lore:utilities/clean_up
